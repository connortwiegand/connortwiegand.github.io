#import "@local/res-template:0.0.3": *
#import "@preview/fontawesome:0.5.0": *

#let temp(body) = text(gray.darken(25%))[#body]
#set page(header: align(right)[_R$acute(e)$sum$acute(e)$_], footer: [#align(center)[#emph[References & Phone number available upon request]]])

#show: resume.with(
  author: "Connor T. Wiegand",
  location: "",
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
  date: [2019 -- 2025],
  // date: [2019 -- 2025\ (Expected Spring)],
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
    - Designed novel web-based interface for efficient elicitation (#underline[_Methods paper to follow_])
    - Find *57%* of participants show behavior consistent with time-varying preferences
  ]
)

#exp(
  role: "Does AI Facilitate Trust? An Experimental Study",
  // project: [],
  date: [Working Paper],
  location: [#link("ctwie.me/proj/research-pages/trust/trust-and-ai.pdf")[Draft Available]],
  summary: [#h(0.33em) w/ Tanner Bivins, Ethan Holdahl, Jiabin Wu],
  details: [
    - Analyzed role of LLM as a tool for facilitating trust in partnership games
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
    - Responsible for collection of literature; revision and editing of encyclopedia entry
  ]
)

= Professional Experience

#exp(
  role: "Lead Instructor",
  project: "University of Oregon",
  date: "2021 -- present",
  summary: "Responsible for preparing and administering lectures, assessments, and course content",
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
  role: "Research Assistant",
  project: "Alfredo Burlando, Professor of Economics",
  date: "Summer 2021",
  // summary: [Assisted in writing theory and proofs for Burlando (2023) ],
  details: [
    - "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_
    // - Alfredo Burlando, "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_, 97, 102466
  ]
)


= Skills

#let short-skills(area: "", fields: (:)) = {
  set block(below: 0.65em)
  strong[#area] + " | "
  fields.join(" | ")
  // linebreak()
}

// #set par(spacing: 0.8em)

#short-skills(
  area: "Expertise", fields: (
    [Behavioral Economics],
    [Game Theory],
    [Experiments],
    [Principal-Agent],
    [Applied Micro.],
  )
)

#exp(
  role: "Machine Learning & Econometrics", 
  project: [8+ years],
  details: [
    - Random Forests, LLMs, Clustering, LASSO, Instruments, Time Series, Multiple Regression 

    - Causal Modeling, Prediction, Classification, A/B Testing, Big Data

    - Cross Validation, Model Selection & Evaluation, Unsupervised/Supervised Learning
  ]
)


#exp(
  role: "Programming", 
  // project: [8+ years],
  details: [
    - *R* (_8+ years_) | Direct experience training and evaluating machine learning models

    - *Python* (_4+ years_) | Experience programming research experiments, including ETL/ELT decisions

    - #short-skills(area: "Other", fields: ([Julia], [STATA],  [Java], [SQL], [Web Design], [Quarto], [Typst (Rust)], [Bash/Linux]))
  ]
)
