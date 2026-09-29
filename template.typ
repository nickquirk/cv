// template.typ: layout and styling only.
// All CV content lives in cv.typ, so content diffs stay clean.

// ---- Theme ------------------------------------------------------------
// Needs --font-path fonts (or TYPST_FONT_PATHS=fonts); Typst falls back to its
// embedded fonts if these are missing.
#let heading-font = "Oswald"
#let body-font = "Open Sans"

#let accent = rgb("#4a86c8")
#let dark = rgb("#1f3864")
#let shade = rgb("#cfe2f3")
#let link-blue = rgb("#1155cc")

// ---- Variants ---------------------------------------------------------
// Build a tailored CV with:  typst compile --input focus=audio cv.typ
// Default is "general", which shows everything.
#let focus = sys.inputs.at("focus", default: "general")

// Show `body` in the general CV and in any of the listed variants.
#let only(..focuses, body) = {
  if focus == "general" or focus in focuses.pos() { body }
}

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

#let section(title) = block(above: 1.3em, below: 0.6em, stack(
  spacing: 3pt,
  text(font: heading-font, size: 13pt, fill: accent, upper(title)),
  line(length: 100%, stroke: 0.8pt + accent),
))

// Alternating shaded rows, e.g. skills(("Frontend", "React, ..."), ...)
#let skills(..rows) = table(
  columns: 1fr,
  stroke: none,
  inset: (x: 2pt, y: 2.5pt),
  fill: (_, y) => if calc.even(y) { shade },
  ..rows.pos().map(((label, items)) => [#strong[#upper(label):] #items]),
)

// Employment entry: Title (dates) : Company
#let job(title, dates, org) = block(above: 0.8em, below: 0.4em)[
  #strong(title) (#dates) : #emph(org)
]

// Work-history entry: Title: Organisation (dates)
#let entry(title, org, dates) = block(above: 1em, below: 0.4em)[
  #strong(title + ":") #emph(org) (#dates)
]

#let project(name, stack: "", url: none, repo: none) = block(above: 1em, below: 0.5em)[
  #if url != none { link(url, strong(upper(name))) } else { strong(upper(name)) }
  #if repo != none [| #link(repo)[github]]
  | #strong[Stack:] #emph(stack)
]
