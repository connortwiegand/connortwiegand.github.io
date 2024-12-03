/*
This copy of the resume formatting template is provided in the template download in case
you'd like to make your preferred edits to the template directly.

If you'd like to use this copy instead of the package, you'll need to update the #import
statement in your resume.typ file to reference this file directly.

Have you made edits or bug fixes to this template that you feel would help out others?
It would be fantastic if you submitted a pull request to the template repository at
https://github.com/chaoticgoodcomputing/typst-resume-starter !
*/

/*
Core formatting for the template document type. Establishes general document-wide formatting,
and creates the header and footer for the resume.
*/
/*
Core formatting for the template document type. Establishes general document-wide formatting,
and creates the header and footer for the resume.
*/
#let resume(
  author: "",
  location: "",
  contacts: (),
  margins: (
    top: 0.75in,
    bottom: 0.33in,
    rest: (0.5in),
  ),
  body
) = {
  // Me: [
  import "@preview/fontawesome:0.5.0": *

  set list(body-indent: 0.2em, indent: 0.3em)
  // ] end
  
  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    font: ("New Computer Modern"),
    size: 11pt,
    lang: "en"
  )

  set page(
    margin: margins
  )

  show link: set text(
    fill: rgb("#0645AD")
  )
  
  // Header parameters, including author and contact information.
  show heading: it => [
    #pad(top: -4pt, 
    bottom: -15pt, 
    [#smallcaps(it.body)])
    #line(length: 100%, stroke: 0.5pt)
  ]

  // Author
  align(center)[
    #block(text(weight: 700, 2.5em, [#smallcaps(author)]))
  ]

  // Contact
  pad(
    top: 0.25em,
    align(center)[
      #contacts.map(ent => {
        let (soc, lnk, txt) = ent
        link(lnk)[#text(baseline: 1.5pt, [#fa-icon(soc)]) #txt]
      }).join("  |  ")
    ]
  )

  // Location
  if location != "" {
    align(center)[
      #smallcaps[#location]
    ]
  }

  // Main body.
  set par(justify: true)

  body
}

#let hide(should-hide, content) = {
  if not should-hide {
    content
  }
}

/*
Education section formatting, allowing enumeration of degrees and GPA
*/
#let edu(
  institution: "",
  date: "",
  degrees: (),
  gpa: "",
  location: ""
) = {
  pad(
    bottom: 2.5%,
    // bottom: 2pt,
    grid(
      columns: (auto, 1fr),
      align: (left, right),
      [
        #strong(institution) | #emph(location)
        #if gpa != "" [| #emph[GPA: #gpa]]
        \ 
        #for degree in degrees [
          #h(1em)#strong(degree.at(0)) | #emph(degree.at(1)) \
        ]
      ], [
        #emph(date)
      ]
    )
  )
}

/*
Skills section formatting, responsible for collapsing individual entries into
a single list.
*/
#let skills(areas) = {
  for area in areas {
    strong[#area.at(0): ]
    area.at(1).join(" | ")
    linebreak()
  }
}

/*
Experience section formatting logic.
*/
#let exp(
  role: "",
  project: "",
  date: "",
  location: "",
  summary: "",
  details: []
) = {

  let LHS = [
    #strong(role) #if project != "" [| #emph(project)]
    #if summary != "" [\ #emph(summary)]
    #details
  ]

  let cont = [
    #if date == "" and location == "" [
      #LHS
    ] else [
      #grid(
        columns: (8fr, 2fr),
        align: (left, right),
        // column-gutter: 5em,
        [
          #strong(role) #if project != "" [| #emph(project)]
          #if summary != "" [\ #emph(summary)]
          #details
        ],
        [
          #emph(date)
          #if location != "" [| \ #emph(location)]
        ]
      )
    ]
  ]

  pad(
    bottom: 2.5%,
    cont
  )
}