// Shared appendix module for the Laurea templates.
// Collects appendix items during the document body and renders them
// at the end (via render_appendices()) with an "Appendices" heading,
// an outline, and auto-numbering ("Appendix 1: Title").

#let appendix_items = state("appendices", ())

/// Register a new appendix. The title and body are collected and
/// rendered later by `render_appendices()`.
#let appendix(title, body) = context {
  let current_items = appendix_items.get()
  appendix_items.update(current_items + ((title, body),))
}

/// Render the "Appendices" section: heading, outline, and each appendix.
#let render_appendices() = context {
  if appendix_items.get().len() == 0 {
    return
  }
  pagebreak()
  set heading(numbering: none)
  set par(first-line-indent: 0pt, leading: 1.5em)
  heading(level: 1)[Appendices]
  v(1em)
  outline(title: none, target: heading.where(supplement: [Appendix]), indent: 0em)

  let i = 1
  for item in appendix_items.get() {
    let title = item.at(0)
    let body = item.at(1)
    pagebreak()
    set heading(numbering: none, supplement: [Appendix])
    counter(heading).update(0)
    set par(first-line-indent: 0pt)
    heading(level: 2)[Appendix #i: #title]
    body
    i = i + 1
  }
}
