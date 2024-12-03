#import "resume.template.typ": *
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

// = Education

#let edu-phd = [
  #edu(
    institution: "University of Oregon",
    date: "2019 -- 2024",
    location: "Eugene, OR",
    degrees: (
      ("Ph.D.", "Economics"),
    ),
  )
]

#let edu-bs = [
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
]

#let edu-aa = [
  #edu(
    institution: "Whatcom Community College",
    date: "2014 -- 2016",
    location: "Bellingham, WA",
    degrees: (
      ("Associate of Arts", "Transfer Degree"),
    ),
  )
]

#let EDU = ("UO": edu-phd, "UW": edu-bs, "WCC": edu-aa)

#let tvtp-deets-alt = [
  - Conducted novel longitudinal study to elicit non-standard time preferences
  - Designed novel web-based interface for fast and efficient elicitation (_*Methods paper to follow*_)
  - Spearheaded model theory and proofs
  - Find *57%* of participants show behavior consistent with time-varying preferences
]

// = Research
#let proj-tvtp(use-alt-deets: false) = [
  #exp(
    role: "Time Varying Time Preferences",
    project: "w/ M. Steven Holloway, Michael A. Kuhn",
    date: [JMP],
    location: [#link("ctwie.me/proj/research-pages/tvtp/tvtp.pdf")[Draft Available]],
    summary: "",
    details: if use-alt-deets {[#tvtp-deets-alt]} else [
      - Conducted novel longitudinal study to elicit non-standard time preferences
      - Designed novel web-based interface for efficient elicitation (#underline[_Methods paper to follow_])
      - Find *57%* of participants show behavior consistent with time-varying preferences
    ]
  )
]

#let proj-trust = [
  #exp(
    role: "Does AI Facilitate Trust? An Experimental Study",
    // project: [],
    date: [Working Paper],
    location: [#link("ctwie.me/proj/research-pages/trust/trust-and-ai.pdf")[Draft Available]],
  summary: [#h(0.33em) w/ Tanner Bivins, Ethan Holdahl, Jiabin Wu],
    details: [
      - Analyzed role of LLM AI as a tool for facilitating trust in partnership games
      - Contributed to experiment framework, design through oTree (Python-based), post-study analysis and documenting results
      - Find significant evidence that access to AI for trustee leads to cooperative play
    ]
  )
]

#let proj-mf = [
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
]

#let PROJ = ("tvtp": proj-tvtp(), "trust": proj-trust, "encyclopedia": proj-mf)

// = Experience

#let exp-li = [
  #exp(
    role: "Lead Instructor",
    project: "University of Oregon",
    date: "2021 -- present",
    summary: "Responsible for preparing and administering lectures, assesments, and course content",
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
]

#let exp-ta = [
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
]

#let exp-ra(show-sum: false) = [
  #exp(
    role: "Research Assistant",
    project: "Alfredo Burlando, Professor of Economics",
    date: "Summer 2021",
    summary: if(show-sum) {[Assisted in writing theory and proofs for Burlando (2023)]},
    details: [
      - "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_
      // - Alfredo Burlando, "Tuition fees and the intra-household allocation of schooling: Evidence from Uganda's Free Primary Education reform" (2023), _Economics of Education Review_, 97, 102466
    ]
  )
]

#let WORK = ("lead-instructor": exp-li, "teaching-assistant": exp-ta, "research-assistant": exp-ra())

// = Skills
#let SKILLS-BRIEF = [ 
  #skills((
    ("Expertise", (
      [Behvaioral Economics],
      [Game Theory],
      [Machine Learning],
      [Experiments], 
      [Data Science]
    )),
    ("Further Experience", (
      [Environmental Economics],
      [Project Analysis],
      [Data Science],
      [Econometrics]
    )),
    ("Programming", (
      [R],
      [Python],
      [STATA],
      [HTML/CSS/JS],
      [SQL],
      [Quarto (Pandoc)], 
      [Java],
      [Bash/Linux]
    )),
  ))
]

#let _use-default-key(dict, def) = {
  for key in def.keys() {
    if key not in dict.keys() {
      dict.insert(key, def.at(key))
    }
  }
  return(dict)
}

#let barred-skills(
  grid-spec: (
    cols: (1fr, 49fr), 
    stroke: (none, (left: gray.lighten(30%))), 
    inset: (x: 0.4em, y: 0.2em)
  ), 
  box-spec: (
    width: 8em,
    inset: (x: -3.5em, y: -4em)
  ),
  text-spec: (
    rot: -90deg,
    col: rgb("#0645AD").lighten(60%),
    txt: ""
  ),
  cont
) = [
  #{
    let gs-def = (
      cols: (1fr, 49fr), 
      stroke: (none, (left: gray.lighten(30%))), 
      inset: (x: 0.4em, y: 0.2em)
    )
    let bs-def = (
      width: 8em,
      inset: (x: -3.5em, y: -4em)
    )
    let ts-def = (
      rot: -90deg,
      col: rgb("#0645AD").lighten(60%),
      txt: ""
    )

    grid-spec = _use-default-key(grid-spec, gs-def)
    box-spec = _use-default-key(box-spec, bs-def)
    text-spec = _use-default-key(text-spec, ts-def)

  }
  
  #set par(spacing: 0.8em)
  #grid(
    columns: grid-spec.cols,
    stroke: grid-spec.stroke,
    inset: grid-spec.inset, 
    [
      #box(width: box-spec.width, inset: box-spec.inset)[
        #rotate(
          text-spec.rot, 
          text(fill: text-spec.col)[#text-spec.txt]
        )
      ]
    ], [
    #cont
    ]
  )
] 

#let bar-skills-esd = barred-skills(
  box-spec: (inset: (x: -4em, y: -5em)), 
  text-spec: (txt: [Economics &\ Data Science]), 
  [

    #exp(
      role: "Machine Learning", 
      // project: [4+ years],
      details: [
        - Random Forests, LLMs, Clustering, Unsupervised/Supervised Learning
        - Prediction, Classification, Cross Validation, Bias--Variance Tradeoff
      ]
    )

    #exp(
      role: "Econometrics", 
      // project: [8+ years],
      details: [
        - A/B Testing, Causal Modeling, Time Series, Big Data
      ]
    )

    #skills((
      ("Expertise", (
        [Behavioral Economics],
        [Game Theory],
        [Experiments],
        [Principal-Agent],
        [Applied Micro.],
      )),
    ))
  ]
)

#let bar-skills-prog = barred-skills(
  box-spec: (inset: (x: -4em, y: -5em)), 
  text-spec: (txt: [Programming]), 
  [
    #exp(
      role: "R", 
      project: [8+ years],
      details: [
        - Direct experience training and evaluating machine learning models
      ]
    )

    #exp(
      role: "Python", 
      project: [4+ years],
      details: [
        - Experience programming research experiments, including ETL/ELT decisions
      ]
    )

    #skills((
      ("Other", (
        [Julia],
        [STATA], 
        [Java],
        [SQL],
        [Web Design],
        [Quarto], 
        [Typst (Rust)],
        [Bash/Linux]
      )),
    ))
  ]
)

#let BAR-SKILLS = ("econ-data-sci": bar-skills-esd, "programming": bar-skills-prog)

#let short-skills(area: "", fields: (:)) = {
  set block(below: 0.65em)
  strong[#area] + " | "
  fields.join(" | ")
  // linebreak()
}

#let vA-skills-expt = short-skills(
  area: "Expertise", fields: (
    [Behavioral Economics],
    [Game Theory],
    [Experiments],
    [Principal-Agent],
    [Applied Micro.],
  )
)

#let vA-skills-mle = exp(
  role: "Machine Learning & Econometrics", 
  project: [8+ years],
  details: [
    - Random Forests, LLMs, Clustering, LASSO, Instruments, Time Series, Multiple Regression 

    - Causal Modeling, Prediction, Classification, A/B Testing, Big Data

    - Cross Validation, Model Selection & Evaluation, Unsupervised/Supervised Learning
  ]
)

#let vA-skills-prog = exp(
  role: "Programming", 
  // project: [8+ years],
  details: [
    - *R* (_8+ years_) | Direct experience training and evaluating machine learning models

    - *Python* (_4+ years_) | Experience programming research experiments, including ETL/ELT decisions

    - #short-skills(area: "Other", fields: ([Julia], [STATA],  [Java], [SQL], [Web Design], [Quarto], [Typst (Rust)], [Bash/Linux]))
  ]
)

#let SKILLS-vA = ("expertise": vA-skills-expt, "ml-metrics": vA-skills-mle, "programming": vA-skills-prog)

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