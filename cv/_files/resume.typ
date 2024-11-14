// #import "@preview/guided-resume-starter-cgc:2.0.0": *
#import "_templates/resume.template.typ": *
#import "@preview/fontawesome:0.2.1": *

#let temp(body) = text(gray.darken(25%))[#body]
#set page(header: align(right)[_R$acute(e)$sum$acute(e)$_], footer: [#align(center)[#emph[References & Phone number available upon request]]])

#show: resume.with(
  author: "Connor T. Wiegand",
  location: "",
  // contacts: (
  //   [#link("https://ctwie.me")[#text(baseline: 1.5pt)[#fa-icon("globe")] ctwie.me]],
  //   [#text(baseline: 1.5pt)[#fa-icon("linkedin")] #link("https://linkedin.com/in/connor-wiegand")[connor-wiegand]],
  //   [#text(baseline: 1.5pt)[#fa-icon("github")] #link("https://github.com/connortwiegand")[connortwiegand]],
  //   [#text(baseline: 1.5pt)[#fa-icon("envelope")] #link("mailto:connortwiegand@gmail.com")[gmail: connortwiegand]],
  // ),
  // contacts: (
  //   (fa-icon("globe"), "https://ctwie.me"),
  //   (fa-icon("github"), "https://github.com/connortwiegand"),
  //   (fa-icon("linkedin"), "https://linkedin.com/in/connor-wiegand"),
  //   (fa-icon("envelope"), "mailto:connortwiegand@gmail.com"),
  // ),
  contacts: (
    ("envelope", "mailto:connortwiegand@gmail.com", [gmail: connortwiegand]),
    ("globe", "https://ctwie.me", [ctwie.me]),
    ("linkedin", "https://linkedin.com/in/connor-wiegand", [connor-wiegand]),
    ("github", "https://github.com/connortwiegand", [connortwiegand]),
  ),
)

= Education
#edu(
  institution: "University of Oregon",
  date: "2019 -- 2024",
  location: "Eugene, OR",
  degrees: (
    ("Ph.D.", "Economics"),
  ),
)

#edu(
  institution: "University of Washington",
  date: "2016 -- 2019",
  // gpa: "3.9 of 4.0, Summa Cum Laude",
  location: "Seattle, WA",
  degrees: (
    ("Bachelor of Science (Double Major)", "Mathematics, Economics"),
    // ("Double Major", "Economics")
  ),
)
/*
#edu(
  institution: "Whatcom Community College",
  date: "2014 -- 2016",
  location: "Bellingham, WA",
  degrees: (
    ("Associate of Arts", "Transfer Degree"),
  ),
)
*/


= Research
#exp(
  role: "Time Varying Time Preferences",
  project: "w/ M. Steven Holloway, Michael A. Kuhn",
  date: [JMP],
  location: [#link("ctwie.me/proj/research-pages/tvtp/tvtp.pdf")[Draft Available]],
  summary: "",
  details: [
    - Conducted novel longitudinal study to elicit non-standard time preferences
    - Designed novel web-based interface for fast and efficient elicitation (_*Methods paper to follow*_)
    - Spearheaded model theory and proofs
    - Find *57%* of participants show behavior consistent with time-varying preferences
  ]
)

#exp(
  role: "Trust and AI",
  project: "w/ Tanner Bivins, Ethan Holdahl, Jiabin Wu",
  date: [Working Paper],
  location: [#link("ctwie.me/proj/research-pages/trust/trust-and-ai.pdf")[Draft Available]],
  summary: "",
  details: [
    - Analyzed role of LLM AI as a tool for facilitating trust in partnership games
    - Contributed to experiment framework, design through oTree (Python-based), post-study analysis and documenting results
    - Find significant evidence that access to AI for trustee leads to cooperative play
  ]
)

#exp(
  role: "Market Failure",
  project: "w/ Van Kolpin",
  date: "Forthcoming",
  location: [November 2024],
  summary: [The Elgar Encyclopedia on the Economics of Competition, Regulation and Antitrust],
  details: [
    - Responsible for collection of relevant literature; revision and editing of encyclopedia entry
  ]
)

// The Elgar Encyclopedia on the Economics of Competition, Regulation and Antitrust
= Experience

#exp(
  role: "Lead Instructor",
  project: "University of Oregon",
  date: "2021 -- present",
  summary: "Lead Instructor; responsible for preparing and administering course content",
  details: {
    v(-0.5em) 
    grid(columns: (1fr, ) * 2, 
  [
    - Game Theory:
      - Introductory (4x)
      - Senior/Master's Level (1x)
  ], [
    - Microeconomics:
      - Introductory (1x)
      - Intermediate (1x)
  ]
)})

#exp(
  role: "Teaching Assistant",
  project: "University of Oregon",
  date: "2019 -- present",
  // location: "U. Oregon",
  summary: "Preparing and leading lab discussions, hosting office hours, grading",
  details: [
    - Selected courses: Behavioral economics, PhD core econometrics, environmental economics, micro, macro, game theory, money and banking, international economics, public economics, senior econometrics
  ]
)

#exp(
  role: "Research Assistant",
  project: "Prof. Alfredo Burlando, U. Oregon",
  date: "Summer 2021",
  summary: [Assisted in writing and reviewing theory and proofs for Burlando (2023) ],
  details: [
    - "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_
    // - Alfredo Burlando, "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_, 97, 102466
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
    [HTML/CSS/JS],
    [SQL],
    [Typst],
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