#import "_templates/resume.template.typ": *
#import "_templates/res-defs.template.typ": *
#import "@preview/fontawesome:0.5.0": *

#let temp(body) = text(gray.darken(25%))[#body]
#set page(header: align(right)[_Curriculum Vitae_])

#show: resume.with(
  author: "Connor T. Wiegand",
  location: "",
  contacts: (
    ("envelope", "mailto:connortwiegand@gmail.com", [gmail: connortwiegand]),
    ("globe", "https://ctwie.me", [ctwie.me]),
    ("linkedin", "https://linkedin.com/in/connor-wiegand", [connor-wiegand]),
    ("github", "https://github.com/connortwiegand", [connortwiegand]),
  ),
  margins: (top: 0.75in, bottom: 0.75in, rest: (0.5in)),
)


= Education

#EDU.values().join()


= Research

#PROJ.values().join()

// The Elgar Encyclopedia on the Economics of Competition, Regulation and Antitrust
= Experience

#WORK.values().join()

#pagebreak()

= Other Projects

#exp(
  role: "game-theoryst",
  project: "A Typst package",
  date: [\ Author],
  // location: [Featured on \ Typst Universe],
  summary: "",
  details: [\
    - Typst package for formatting beautiful normal form games
    - Currently Featured on Typst Universe
  ]
)

#exp(
  role: "LOST",
  project: "The Library of Statistical Techniques",
  date: [\ Contributer],
  // location: [2021],
  summary: "",
  details: [\
    - Original author of ARIMA page, including background theory and relevant R code
  ]
)

#exp(
  role: "AreaCodeR",
  project: "An open-source R project",
  date: [\ Author],
  // location: [],
  summary: "",
  details: [\
    - Produce novel maps of countries with regional area codes using web scraping and geospatial techniques.
  ]
)

= Areas of Interest

#grid(columns: (1fr, ) * 2, 
  [
    - Time Preferences -- Modeling and Elicitation
    - Prospect Theory, Loss Aversion
    - Learning, Bounded Rationality
    - Choice Problems, Consumer Behavior
    - Linguistics, Natural Language
  ], [
    - Contracts, Principal-Agent Problems
    - Repeated Games
    - Experimental Game Theory
    - Data Science, Big Data
    - Software and Programming
  ]
)

= Skills
#skills((
  ("Expertise", (
    [Behvaioral Economics],
    [Game Theory],
    [Machine Learning],
    [Experiments], 
    [Data Science]
  )),
  ("Data Science", (
    [Tidyverse],
    [data.table],
    [Clustering],
    [Random Forests],
    [Regression],
    [Big Data],
  )),
  ("Programming", (
    [R],
    [Python],
    [Web Tools],
    [SQL],
    [Typst (Rust)],
    [Quarto (Pandoc)], 
    [Java],
    [Bash/Linux]
  )),
))

/*
= References
#exp(
  role: "Student Advisor",
  project: "Doc's Kidz After-School Child Care Service",
  date: "May 1954 - June 1985",
  summary: "Giving random highschoolers hands-on experience in live nuclear engineering",
  details: [
    - Created community initiative to teach local student(s) about the wonders of nuclear physics
    - Provided interesting time travel research opportunities for students to add to their college applications
  ]
)*/