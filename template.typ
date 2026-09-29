// template.typ: styling, layout and the renderer.
// Content lives in content.typ. Role files (role-*.typ) override parts of it.

// ---- Theme ------------------------------------------------------------
// Needs --font-path fonts (or TYPST_FONT_PATHS=fonts); Typst falls back to its
// embedded fonts if these are missing.
#let heading-font = "Oswald"
#let body-font = "Open Sans"

#let accent = rgb("#4a86c8")
#let dark = rgb("#1f3864")
#let shade = rgb("#cfe2f3")
#let link-blue = rgb("#1155cc")

// ---- Page setup -------------------------------------------------------
#let cv(name: "", body) = {
  set document(title: name + " – CV", author: name)
  set page(paper: "a4", margin: (x: 1.5cm, top: 1.3cm, bottom: 1.3cm))
  set text(font: body-font, size: 9.5pt, lang: "en", region: "gb")
  set par(leading: 0.55em, spacing: 0.7em)
  set list(
    marker: text(size: 0.7em, baseline: -0.1em)[●],
    indent: 1.4em,
    body-indent: 0.7em,
    spacing: 0.45em,
  )
  show link: it => underline(text(fill: link-blue, it))
  body
}

// ---- Building blocks --------------------------------------------------
#let header(name, title, contact) = align(center)[
  #text(font: heading-font, size: 30pt, fill: dark, upper(name))
  #text(font: heading-font, size: 14pt, fill: accent, upper(title))
  #v(0.1em)
  #contact
]

#let section(title) = block(sticky: true, above: 1.3em, below: 0.6em, stack(
  spacing: 3pt,
  text(font: heading-font, size: 13pt, fill: accent, upper(title)),
  line(length: 100%, stroke: 0.8pt + accent),
))

// Rows are dictionaries with `label` and `items`; shading alternates.
#let skills-table(rows) = table(
  columns: 1fr,
  stroke: none,
  inset: (x: 2pt, y: 2.5pt),
  fill: (_, y) => if calc.even(y) { shade },
  ..rows.map(r => [#strong[#upper(r.label):] #r.items]),
)

// Employment entry: Title (dates) : Company
#let job(title, dates, org) = block(sticky: true, above: 0.8em, below: 0.4em)[
  #strong(title) (#dates) : #emph(org)
]

// Work-history entry: Title: Organisation (dates)
#let entry(title, org, dates) = block(sticky: true, above: 1em, below: 0.4em)[
  #strong(title + ":") #emph(org) (#dates)
]

#let project(name, stack: "", url: none, repo: none) = block(sticky: true, above: 1em, below: 0.5em)[
  #if url != none { link(url, strong(upper(name))) } else { strong(upper(name)) }
  #if repo != none [| #link(repo)[github]]
  | #strong[Stack:] #emph(stack)
]

// ---- Data helpers -----------------------------------------------------

// Deep-merge `overrides` into `base`. Dictionaries merge key by key;
// anything else (text, bullet arrays, none) replaces the base value.
// Setting an entry to `none` hides it.
#let merge(base, overrides) = {
  let out = base
  for (key, value) in overrides {
    let current = out.at(key, default: none)
    if type(value) == dictionary and type(current) == dictionary {
      out.insert(key, merge(current, value))
    } else {
      out.insert(key, value)
    }
  }
  out
}

// Move the given keys to the front of a dictionary, keeping the rest in order.
// e.g. reorder(data.projects, "audio")
#let reorder(dict, ..keys) = {
  let first = keys.pos()
  let out = (:)
  for key in first { out.insert(key, dict.at(key)) }
  for (key, value) in dict {
    if key not in first { out.insert(key, value) }
  }
  out
}

// The visible (non-hidden) entries of a section, in order.
#let entries(dict) = dict.values().filter(e => e != none)

// ---- Renderer ---------------------------------------------------------
#let render(data) = {
  let c = data.contact
  header(data.name, data.title)[
    *Location:* #c.location | *Email:* #c.email | *LinkedIn:* #link(c.linkedin.url, c.linkedin.label) \
    *GitHub:* #link(c.github.url, c.github.label) | *Blog:* #link(c.blog.url, c.blog.label)
  ]

  if data.profile != none {
    section("Profile")
    par(justify: true, data.profile)
  }

  let skills = entries(data.skills)
  if skills.len() > 0 {
    section("Skills")
    skills-table(skills)
  }

  let jobs = entries(data.jobs)
  if jobs.len() > 0 {
    section("Employment")
    for j in jobs {
      job(j.title, j.dates, j.org)
      list(..j.bullets)
    }
  }

  let projects = entries(data.projects)
  if projects.len() > 0 {
    section("Projects")
    for p in projects {
      project(
        p.name,
        stack: p.stack,
        url: p.at("url", default: none),
        repo: p.at("repo", default: none),
      )
      list(..p.bullets)
    }
  }

  let history = entries(data.history)
  if history.len() > 0 {
    section("Work history")
    for h in history {
      entry(h.title, h.org, h.dates)
      let summary = h.at("summary", default: none)
      if summary != none { pad(left: 1.4em, summary) }
      list(..h.bullets)
    }
    v(0.4em)
    align(center, emph[For full career breakdown visit my #link(c.linkedin.url)[LinkedIn]])
  }

  let education = entries(data.education)
  if education.len() > 0 {
    section("Education")
    education.join(linebreak())
  }

  if data.interests != none {
    section("Interests")
    data.interests
  }
}