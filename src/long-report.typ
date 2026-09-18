// Laurea University of Applied Sciences — Long Document Template for Typst
// Based on the official "Long document template with logo.docx"
// Uses SFS 2487 standard layout (2cm left, 1cm other margins)
// Author: Mikko Tuomikoski
// License: CC BY-SA 3.0

#import "appendix.typ": *

/// Laurea long document template (reports, essays, longer assignments).
///
/// - title (str): Document title.
/// - authors (array): List of author names (alphabetical order).
/// - teacher (str): Teacher's name (optional).
/// - study-unit (str): Study unit / course name (optional).
/// - date (str): Date when ready.
/// - logo-path (str): Path to the Laurea logo file.
/// - csl-style (str): CSL style file path.
/// - body (function): Document body.
#let long-report(
  title: "Document Title",
  authors: ("First Last",),
  teacher: none,
  study-unit: none,
  document-type: "Report",
  date: "Day Month Year",
  logo-path: "laurea-logo-vaaka.png",
  csl-style: "laurea-harvard.csl",
  body,
) = {
  // ── Page setup (SFS 2487) ───────────────────────────────────
  set page(
    paper: "a4",
    margin: (
      left: 2cm,
      right: 1cm,
      top: 4cm,
      bottom: 1cm,
    ),
    // Header: author name(s) on the right, starting from page 1
    header: context {
      let current-page = counter(page).get().first()
      if current-page >= 1 {
        set text(size: 9pt)
        set align(right)
        authors.join(", ")
      }
    },
  )

  // ── Typography ──────────────────────────────────────────────
  let default_text = (
    font: ("Aptos"),
    size: 11pt,
    lang: "en",
  )
  set text(
    ..default_text
  )

  let default_par = (
    justify: false,
    leading: 0.8em, // ~1.2 line spacing for 11pt
    first-line-indent: (amount: 2.3cm, all: true),
    hanging-indent: 2.3cm,
    spacing: 2em,
  )

  set par(
    ..default_par,

  )

  set list( 
    indent: 2.3cm,
    spacing: 1em,
    body-indent: 1em
  )
  set enum(
    indent: 2.3cm,
    spacing: 1em,
    body-indent: 1em
  )

  show list: it => {
    v(0.1em)
    it
  }
  show enum: it => {
    v(0.1em)
    it
  }
  // First paragraph after heading: no indent
  show heading: it => {
    it
    par(text(size: 0pt)[], hide: true) // force new paragraph
    set par(first-line-indent: 0pt)
    []
  }

  let doc_header = context {
    set par(..default_par, leading: 0.5em, first-line-indent: 0pt)
    grid(
      columns: (50%,1fr, 1cm),
    [  
      #v(1cm)
      #image(logo-path, width: 60%)
      // Authors (alphabetical, comma-separated)
      #block(width: 100%)[
        #set text(size: 11pt)
        #authors.join(", ")
      ]
    ],
    [ 
            #v(1cm)
      #block()[
        #set text(weight: "bold")
        #document-type \
        #set text(weight: "regular")
        #date \
        #study-unit \
        #teacher
      ]
    ],
    [
            #v(1cm)
      #align(left + horizon)[
        #v(-4em)
        #counter(page).display() (#counter(page).final().first())
      ]
    ]
    )
  }

  set page(header: doc_header)


  // ── Headings ────────────────────────────────────────────────
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    v(1em)
    block(breakable: false)[
      #set text(size: 14pt, weight: "bold")
      #set par(leading: 0.8em, first-line-indent: 0pt)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.5em)
  }
  show heading.where(level: 2): it => {
    v(0.7em)
    block(breakable: false)[
      #set text(size: 12pt, weight: "bold")
      #set par(leading: 0.8em, first-line-indent: 0pt)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.3em)
  }
  show heading.where(level: 3): it => {
    v(0.5em)
    block(breakable: false)[
      #set text(size: 11pt, weight: "bold")
      #set par(leading: 0.8em, first-line-indent: 0pt)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.2em)
  }
  show heading.where(level: 4): it => {
    v(0.5em)
    block(breakable: false)[
      #set text(size: 11pt, weight: "bold")
      #set par(leading: 0.8em, first-line-indent: 0pt)
      #if it.numbering != none [
        #counter(heading).display() #h(0.5em)
      ]
      #it.body
    ]
    v(0.2em)
  }

  // ── Links ───────────────────────────────────────────────────
  show link: set text(fill: blue.darken(20%))

  // ── Bibliography defaults ───────────────────────────────────
  // The style resolves relative to this file (src/); the user's own
  // `#bibliography("refs.bib")` call resolves relative to their document.
  set bibliography(style: csl-style, title: none)
  
  show bibliography: it => {
    pagebreak()
    heading(level: 1)[References]
    v(1em)
    it
  }

  // ════════════════════════════════════════════════════════════
  // COVER PAGE
  // ════════════════════════════════════════════════════════════
  page(header: doc_header)[

    #v(2cm)
    // Title — 14pt bold, left-aligned (can be centred for long titles)
    #block(width: 100%, inset: 2cm)[
      #set text(size: 14pt, weight: "bold")
      #set par(leading: 1em)
      #title
    ]
  ]

  // ════════════════════════════════════════════════════════════
  // TABLE OF CONTENTS
  // ════════════════════════════════════════════════════════════
  {
    set text(size: 11pt)
    set par(leading: 1.5em, first-line-indent: 0pt)
    heading(numbering: none)[Table of Contents]
    v(1em)
    outline(
      title: none,
      indent: 1.5em,
      depth: 3,
    )
    set par(..default_par) // Reset to defaults or your document defaults
  }
  // Reset to defaults or your document defaults
  pagebreak()

  // ════════════════════════════════════════════════════════════
  // BODY
  // ════════════════════════════════════════════════════════════
  body

  // ════════════════════════════════════════════════════════════
  // LIST OF FIGURES
  // ════════════════════════════════════════════════════════════
  context {
    if query(figure.where(kind: figure)).len() > 0 {
      pagebreak()
      {
        set heading(numbering: none)
        set par(first-line-indent: 0pt)
        heading(level: 1)[Figures]
        v(1em)
        outline(title: none, target: figure.where(kind: image))
      }
    }
  }
  // ════════════════════════════════════════════════════════════
  // LIST OF TABLES
  // ════════════════════════════════════════════════════════════
  
  context {
    if query(figure.where(kind: table)).len() > 0 {
      pagebreak()
      {
        set heading(numbering: none)
        set par(first-line-indent: 0pt)
        heading(level: 1)[Tables]
        v(1em)
        outline(title: none, target: figure.where(kind: table))
      }
    }
  }
  // ════════════════════════════════════════════════════════════
  // APPENDICES
  // ════════════════════════════════════════════════════════════
  render_appendices()

  set bibliography()
}
