#!/usr/bin/env python3
"""Point `sitemap.xml`'s URLs at the same place the page's canonical does.

Quarto writes `<loc>https://ctwie.me/cv/index.html</loc>`, while the page it
describes carries `<link rel="canonical" href="https://ctwie.me/cv/">` — the
trailing-slash form `canonical-url: true` resolves directory indexes to. The
mismatch costs nothing on its own, since Google follows the canonical, but
there is no reason to hand a crawler two URLs for one page. This runs as a
project `post-render` hook and rewrites the file Quarto just produced:

    https://ctwie.me/cv/index.html   ->  https://ctwie.me/cv/
    https://ctwie.me/index.html      ->  https://ctwie.me/
    https://ctwie.me/404.html            (left alone — not a directory index)

Adapted from `sitemap_images.py` in the Peter's Pumpkin Patch repo, which does
this *and* declares an `<image:image>` per photo. The image half is dropped
here: it earns its keep on a photo gallery chasing Google Image Search, and not
on a CV site with a dozen figures. If it is ever wanted, that script is the
place to take it from — it parses the rendered HTML rather than the front
matter, and skips listing thumbnails by CSS class.

Post-render, and idempotent
---------------------------
Quarto writes `sitemap.xml` in its own website post-render step, which runs
before project `post-render` scripts, so this sees a finished sitemap and gets
the last word.

Quarto also reads an existing sitemap back in and matches entries by exact
`loc`, which is a hazard for a script that rewrites those locs: a canonicalized
`…/cv/` no longer matches the `…/cv/index.html` Quarto looks for, so it can
append a *second* entry for the same page. That was observed on the pumpkin
site this is adapted from; it has not been reproduced here, where repeated
renders have rebuilt the sitemap from scratch each time. The de-duplication
below is therefore defensive rather than load-bearing — it costs nothing and
makes the output correct either way.

So this re-canonicalizes and de-duplicates the whole file on every run, keeping
the newest `lastmod`. Verified: two renders in a row produce byte-identical
output, and the 14 locs match the 14 `rel="canonical"` values exactly.

Stdlib-only on purpose: Quarto invokes a `.py` hook with whatever `python3` is
on PATH, so this must not need a virtualenv. `_quarto.yml` wires it up through
`uv run --no-project` anyway; both routes work.

Usage:
  uv run --no-project scripts/canonicalize_sitemap.py [--site-dir _site]
                                                      [--dry-run] [--quiet]
"""

from __future__ import annotations

import argparse
import os
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(os.environ.get("QUARTO_PROJECT_DIR") or Path(__file__).resolve().parent.parent)

SITEMAP_NS = "http://www.sitemaps.org/schemas/sitemap/0.9"


def canonical(loc: str) -> str:
    """`…/cv/index.html` -> `…/cv/`, matching what the page declares.

    Only a trailing `/index.html` is rewritten. A standalone page such as
    `404.html` has no directory index to collapse into and is left as-is.
    """
    return loc[: -len("index.html")] if loc.endswith("/index.html") else loc


def read_urls(sitemap: Path) -> list[tuple[str, str | None]]:
    root = ET.parse(sitemap).getroot()
    urls = []
    for url in root.findall(f"{{{SITEMAP_NS}}}url"):
        loc = url.findtext(f"{{{SITEMAP_NS}}}loc")
        if loc:
            lastmod = (url.findtext(f"{{{SITEMAP_NS}}}lastmod") or "").strip()
            urls.append((loc.strip(), lastmod or None))
    return urls


def dedupe(urls: list[tuple[str, str | None]]) -> tuple[list[tuple[str, str | None]], int, int]:
    """Canonicalize every loc, then collapse duplicates onto the newest lastmod.

    Duplicates are the read-back hazard described in the module docstring, and
    have not been seen on this site. Insertion order is preserved, so a clean
    render round-trips byte-for-byte apart from the rewritten locs.
    """
    merged: dict[str, str | None] = {}
    normalized = 0
    for loc, lastmod in urls:
        key = canonical(loc)
        if key != loc:
            normalized += 1
        prior = merged.get(key, ...)
        if prior is ...:
            merged[key] = lastmod
        else:
            # ISO-8601 UTC throughout, so lexical order is chronological.
            merged[key] = max(filter(None, (prior, lastmod)), default=None)
    return list(merged.items()), normalized, len(urls) - len(merged)


def build(sitemap: Path) -> tuple[str, dict[str, int]]:
    urls, normalized, collapsed = dedupe(read_urls(sitemap))

    ET.register_namespace("", SITEMAP_NS)
    root = ET.Element(f"{{{SITEMAP_NS}}}urlset")
    for loc, lastmod in urls:
        url_el = ET.SubElement(root, f"{{{SITEMAP_NS}}}url")
        ET.SubElement(url_el, f"{{{SITEMAP_NS}}}loc").text = loc
        if lastmod:
            ET.SubElement(url_el, f"{{{SITEMAP_NS}}}lastmod").text = lastmod

    ET.indent(root, space="  ")
    xml = '<?xml version="1.0" encoding="UTF-8"?>\n' + ET.tostring(root, encoding="unicode") + "\n"
    return xml, {"urls": len(urls), "normalized": normalized, "collapsed": collapsed}


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument(
        "--site-dir",
        type=Path,
        default=None,
        help="rendered output directory (default: $QUARTO_PROJECT_OUTPUT_DIR, else _site)",
    )
    ap.add_argument("--dry-run", action="store_true", help="report without writing")
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args()

    site_dir = args.site_dir or Path(os.environ.get("QUARTO_PROJECT_OUTPUT_DIR") or ROOT / "_site")
    site_dir = site_dir if site_dir.is_absolute() else (ROOT / site_dir)
    sitemap = site_dir / "sitemap.xml"

    if not sitemap.exists():
        # No `site-url` means no sitemap, which is a valid configuration --
        # nothing to do rather than a failure.
        if not args.quiet:
            print(f"sitemap: none at {sitemap}, skipped")
        return 0

    xml, stats = build(sitemap)
    if not args.dry_run:
        sitemap.write_text(xml, encoding="utf-8")

    if not args.quiet:
        detail = f"{stats['urls']} urls"
        for label, key in (("canonicalized", "normalized"), ("deduped", "collapsed")):
            if stats[key]:
                detail += f", {stats[key]} {label}"
        print(f"sitemap: {'would write ' if args.dry_run else ''}{detail}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
