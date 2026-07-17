// Laurea University of Applied Sciences — Thesis Template for Typst
// Based on the official "Thesis template.docx" Word template
// Font: Aptos 11pt, line spacing 1.5
// Cover margins: L 2cm, R 1cm, T 6.8cm, B 1.5cm
// Body margins: L 4cm, R 2cm, T 2.7cm, B 1.5cm
// Author: Mikko Tuomikoski — License: CC BY-SA 3.0

/// Laurea thesis template matching the official Word template exactly.
///
/// - title (str): Thesis title.
/// - author (str): Author's full name (First Last).
/// - degree (str): Degree type (e.g. "Bachelor of Business Administration").
/// - programme (str): Programme name (e.g. "Business Management").
/// - month (str): Month of publication.
/// - year (str): Year of publication.
/// - abstract (str): Abstract text.
/// - keywords (array): List of 3–5 keywords.
/// - page-count (int): Total page number (for abstract field).
/// - logo-path (str): Path to the Laurea logo file.
/// - bibliography-file (str|none): Path to .bib file.
/// - csl-style (str): CSL style file path.
/// - body (function): Document body.
#let laurea-thesis(
  title: "Thesis Title",
  author: "First Last",
  degree: "Degree",
  programme: "Degree Programme",
  month: "Month",
  year: "Year",
  abstract: "Abstract text here.",
  keywords: (),
  page-count: 0,
  logo-path: "laurea-logo.png",
  bar-path: "bar-image.png",
  bibliography-file: none,
  csl-style: "laurea-harvard.csl",
  body,
) = {
  // ── Typography ──────────────────────────────────────────────
set text(
  font: ("Aptos", "Trebuchet MS"),
  size: 11pt,
  lang: "en",
  top-edge: "ascender",
  bottom-edge: "descender",
)

set par(
  justify: true,
  leading: 0.75em,
  spacing: 1.5em,
  first-line-indent: 0pt,
)
  // ── Headings ────────────────────────────────────────────────
  set heading(numbering: (..nums) => {
    let n = nums.pos()
    n.map(str).join(".")
  })

  show heading.where(level: 1): it => {
    v(1.27cm)
    block(breakable: false)[
      #set text(size: 11pt, weight: "regular")
      #set par(leading: 0.75em)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.423cm)
  }
  show heading.where(level: 2): it => {
    v(0.423cm)
    block(breakable: false)[
      #set text(size: 11pt, weight: "regular")
      #set par(leading: 0.75em)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.423cm)
  }
  show heading.where(level: 3): it => {
    v(0.423cm)
    block(breakable: false)[
      #set text(size: 11pt, weight: "regular")
      #set par(leading: 0.75em)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
  }
  // ── List formatting ──────────────────────────────────────────

  // Ordered lists: decimal (level 0), lower-alpha (level 1), lower-roman (level 2)
  set enum(
    numbering: "1.",
    tight: false,
    indent: 0.9cm,     // left indent per level
    body-indent: 0.4cm, // hanging indent (bullet/number sits here)
  )

  // Unordered lists: filled circle (level 0), circle (level 1), square (level 2)
  set list(
    marker: (
      text(size: 11pt)[•],   // level 0 — filled circle
      text(size: 11pt)[◦],   // level 1 — open circle
      text(size: 11pt)[▪],   // level 2 — filled square
    ),

    indent: 0.9cm,
    body-indent: 0.4cm,
  )
  show list: it => {
    v(0.25cm)
    it
  }

  show enum: it => {
    v(0.25cm)
    it
  }
  // Align roman-numeral level numbers to the right
  // (only needed for deep nesting — Typst handles this automatically)

  // ── Links ───────────────────────────────────────────────────
  show link: set text(fill: blue.darken(20%))

  // ── Helper: cover page layout ───────────────────────────────
  let cover-page(show-header: bool, body-content) = {

    page(
      paper: "a4",
      margin: (left: 2cm, right: 1cm, top: 8cm, bottom: 1.5cm),
      header: if show-header {
      context {
        place(dx: 2cm, dy: 2cm)[
          #image(logo-path, width: 3cm)
        ]
      }
      },
    )[
      #body-content
    ]
  }

  // ════════════════════════════════════════════════════════════
  // COVER PAGE 1 — Title, Author, Year+Laurea, Publisher
  // ════════════════════════════════════════════════════════════
  cover-page(show-header: true)[

    #set align(center)

    // Title
    #block(width: 100%)[
      #set text(size: 14pt)
      #title
    ]

    #v(0.3em)

    // Author
    #block(width: 100%)[
      #author
    ]

    #v(3fr)

    // Year of publication + Laurea — centred, 14pt
    #block(width: 100%)[
      #set text(size: 14pt)
      #year #h(0.5em) Laurea
    ]

    #v(1fr)

    // Publisher at bottom
    #block(width: 100% - 3cm)[
      #image(bar-path, width: 100%)
    ]
  ]

  // ════════════════════════════════════════════════════════════
  // COVER PAGE 2 — Title, Author, Degree, Type, Month/Year
  // ════════════════════════════════════════════════════════════
  cover-page(show-header: false)[

    // Title — bold
    #block(width: 100%)[
      #set align(center)
      #set text(size: 14pt)
      #title
    ]

    #v(1fr)

    #align(right)[
      #block(inset: (x: 1cm))[
      #set align(left)
      #author

      #degree

      #programme

      // Month, year
      #month, #year
      ]
    ]
    #v(1cm)
  ]

  // ════════════════════════════════════════════════════════════
  // ABSTRACT PAGE
  // ════════════════════════════════════════════════════════════
  page(
    paper: "a4",
    margin: (left: 4cm, right: 2cm, top: 2.7cm, bottom: 1.5cm),
    header: none,
    footer: none,
  )[
    #set text(size: 11pt)

    // "Laurea University of Applied Sciences" + "Abstract" — same line
    #block(width: 100%)[
      #set text(weight: "bold")
      Laurea University of Applied Sciences #h(1fr) Abstract
      #set text(weight: "regular")

      #degree

      #programme
    ]

    #v(2em)

    // Author
    #author

    #v(0.3em)

    #title

    #v(1.5em)

    // Year — with bottom border underline
    #block(width: 100%, stroke: (bottom: 0.4pt), inset: (bottom: 5pt))[
      Year #h(2fr) #year #h(1em) Number of pages #h(1fr) #page-count
    ]

    #v(1.5em)

    // Abstract text — line spacing 1
    #block(width: 100%)[
      #set par(leading: 1em, spacing: 0em, justify: true)
      #abstract
    ]

    // Push keywords to bottom
    #v(1fr)

    // Keywords
    #if keywords.len() > 0 [
      Keywords: #h(0.5em) #keywords.join(", ")
    ]
  ]

  // ════════════════════════════════════════════════════════════
  // BODY PAGES
  // ════════════════════════════════════════════════════════════
  set page(
    paper: "a4",
    margin: (left: 4cm, right: 2cm, top: 2.7cm, bottom: 1.5cm),
    header: context {
      set align(right)
      counter(page).display("1")
    },
    footer: none,
  )

  // ── TABLE OF CONTENTS ──────────────────────────────────────
  {
    heading(outlined: false, numbering: none)[Contents]
    v(0.2em)
    /*show outline.entry: set block(above: 0pt, below: 0pt)
    show outline.entry.where(level: 1): set block(above: 6pt, below: 0pt)
    show outline.entry.where(level: 2): set block(above: 6pt, below: 0pt)
    show outline.entry.where(level: 3): set block(above: 6pt, below: 0pt) */
    
    outline(title: none, indent: 0.8em, depth: 2)
  }

  pagebreak()

  // ── BODY ───────────────────────────────────────────────────
  body

  // ── BIBLIOGRAPHY ───────────────────────────────────────────
  pagebreak()
  {
    set heading(numbering: none)
    heading(level: 1)[References]
    v(0.5em)

    if bibliography-file != none {
      bibliography(bibliography-file, style: csl-style, title: none)
    }
  }

  // ── LIST OF FIGURES ────────────────────────────────────────
  context if query(figure.where(kind: image)).len() > 0 {
    pagebreak()
    {
      set heading(numbering: none)
      heading(level: 1)[Figures]
      v(0.5em)
      outline(title: none, target: figure.where(kind: image))
    }
  }

  // ── LIST OF TABLES ─────────────────────────────────────────
  context if query(figure.where(kind: table)).len() > 0 {
    pagebreak()
    {
      set heading(numbering: none)
      heading(level: 1)[Tables]
      v(0.5em)
      outline(title: none, target: figure.where(kind: table))
    }
  }

  // ── APPENDICES (placeholder — user adds via appendix()) ────
}

// ── Helper functions ────────────────────────────────────────────

/// Start a new appendix.
#let appendix(title, body) = {
  pagebreak()
  set par(first-line-indent: 0pt)
  heading(level: 2)[#title]
  body
}
