# Laurea Templates for Typst

Typst templates matching the official Laurea University of Applied Sciences Word templates:

- **`thesis`** — matches the official `Thesis template.docx`
- **`long-report`** — matches the official `Long document template with logo.docx` (SFS 2487 layout)

Both are shipped as a single Typst package and share a common appendix module.

## Features

Thesis:
- Matches the official `Thesis template.docx` formatting
- Cover pages (title, author, degree, publication info)
- Abstract page with structured fields
- Headings (1–3) with auto-numbering
- Table of contents, list of figures/tables
- Bibliography with Harvard (Laurea) citation style
- Appendices support

Long report:
- Matches the official `Long document template with logo.docx` (SFS 2487)
- Cover page, header with authors and page numbers
- Headings (1–3) with auto-numbering
- Table of contents, list of figures/tables
- Bibliography with Harvard (Laurea) citation style
- Appendices support

## Repository Structure

```
src/
├── lib.typ          # Entry point — imports the templates & appendix module
├── thesis.typ       # Thesis template
├── long-report.typ  # Long report template
├── appendix.typ     # Shared appendix module
├── laurea-harvard.csl
└── laurea-logo*.png, bar-image.png
scripts/
└── install.sh       # Install as a local Typst package (Linux & macOS)
template/            # Template projects (main.typ, long-report.typ, references.bib)
example-thesis.typ   # Example thesis document
example-long-report.typ  # Example long report document
```

The sample `references.bib` used by the examples and template projects lives in `template/`.

## Quick Start

### Install locally (Linux & macOS)

No publishing required — install the package locally with the bundled script:

```bash
git clone https://github.com/Snoozyman/laurea-templates.git
cd laurea-templates
bash scripts/install.sh
```

This copies the package into Typst's local packages directory, on macOS `~/Library/Application Support/typst/packages/local/laurea-templates/<version>` and on Linux `~/.local/share/typst/packages/local/laurea-templates/<version>`. Re-run the script after pulling updates, uninstall with `bash scripts/install.sh --uninstall`, or print the install path with `--where`.

Then scaffold a new project:

```bash
typst init @local/laurea-templates:0.2.0 my-thesis
cd my-thesis
typst compile main.typ
```

The project folder contains both the thesis (`main.typ`) and long-report (`long-report.typ`) template examples. For live preview while editing, use `typst watch main.typ` instead of `typst compile`.

### From Typst Universe

```bash
typst init @preview/laurea-templates:0.2.0 my-thesis
cd my-thesis
typst compile main.typ
```

The scaffolded templates import the package from `@local`, so if you created the project from `@preview`, change the import in `main.typ` and `long-report.typ` to `@preview/laurea-templates:0.2.0` first.

### Manual local install (alternative)

```bash
mkdir -p ~/.local/share/typst/packages/local/laurea-templates/0.2.0
cp -r src typst.toml ~/.local/share/typst/packages/local/laurea-templates/0.2.0/
cp -r template ~/.local/share/typst/packages/local/laurea-templates/0.2.0/
```

Then compile the template:

```bash
typst compile template/main.typ
```

To use the example thesis or long report instead:

```bash
typst compile example-thesis.typ
typst compile example-long-report.typ
```

Both examples reference the sample bibliography at `template/references.bib`.

## Usage

### Thesis

```typ
#import "@local/laurea-templates:0.2.0": thesis, appendix

#show: thesis.with(
  title: [Digital Transformation in SMEs],
  author: "Maija Meikäläinen",
  degree: "Bachelor of Business Administration",
  programme: "Business Management",
  month: "May",
  year: "2026",
  page-count: 48,
  abstract: [Your abstract text here.],
  keywords: ("digital transformation", "SMEs", "Finland"),
)

= Introduction
...
#bibliography("references.bib")
```

### Long report

```typ
#import "@local/laurea-templates:0.2.0": long-report, appendix

#show: long-report.with(
  title: [Digital Transformation in SMEs],
  authors: ("Maija Meikäläinen",),
  date: "May 2026",
  teacher: "Dr. John Doe",
  document-type: "Report",
  study-unit: "Digital Business Strategies",
)

= Introduction
...
#bibliography("references.bib")
```

## Parameters

### `thesis`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | str | `"Thesis Title"` | Thesis title |
| `author` | str | `"First Last"` | Author's full name |
| `degree` | str | `"Degree"` | Degree type (e.g. "Bachelor of Business Administration") |
| `programme` | str | `"Degree Programme"` | Programme name (e.g. "Business Management") |
| `month` | str | `"Month"` | Month of publication |
| `year` | str | `"Year"` | Year of publication |
| `abstract` | str | `"Abstract text here."` | Abstract text |
| `keywords` | array | `()` | List of 3–5 keywords |
| `page-count` | int | `0` | Total page count (shown on abstract page) |
| `logo-path` | str | `"laurea-logo.png"` | Path to Laurea logo file |
| `bar-path` | str | `"bar-image.png"` | Path to gradient bar image |
| `csl-style` | str | `"laurea-harvard.csl"` | CSL style file path |

The citation style is applied automatically via the `csl-style` parameter. To render your bibliography, call `#bibliography("your-file.bib")` yourself at the end of the document — the `.bib` path resolves relative to your document, and the style is applied for you.

### `long-report`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | str | `"Document Title"` | Document title |
| `authors` | array | `("First Last",)` | List of author names |
| `date` | str | `"Day Month Year"` | Date when ready |
| `teacher` | str\|none | `none` | Teacher's name (optional) |
| `study-unit` | str\|none | `none` | Study unit / course name (optional) |
| `document-type` | str | `"Report"` | Document type (e.g. "Report") |
| `logo-path` | str | `"laurea-logo-vaaka.png"` | Path to the Laurea logo file |
| `csl-style` | str | `"laurea-harvard.csl"` | CSL style file path |

As with `thesis`, render your bibliography with `#bibliography("your-file.bib")` at the end of the document; the style is applied automatically.

## Appendices

Both templates share a common appendix module (`src/appendix.typ`). Appendix items are collected with `#appendix` and automatically rendered at the end of the document with an "Appendices" heading, an outline entry, and auto-numbering.

```typ
#appendix[Interview Guide][
  The interview guide included the following questions:
  + Describe your company's digital maturity.
  + What challenges have you faced?
]

#appendix[Consent Form][
  *Informed Consent Form*
  I consent to participate in the research study...
]
```

Each `#appendix[Title][body]` becomes `Appendix 1: Title`, `Appendix 2: Title`, and so on. If no appendices are declared, nothing is rendered. Appendices appear in the table of contents automatically.

## Formatting Reference

Thesis:
- **Font:** Aptos 11pt (fallback: Trebuchet MS)
- **Line spacing:** 150%
- **Cover margins:** L 2cm, R 1cm, T 6.8cm, B 1.5cm
- **Body margins:** L 4cm, R 2cm, T 2.7cm, B 1.5cm
- **Heading 1:** 1.27cm above
- **Heading 2:** 0.423cm above
- **Heading 3:** 0.423cm above

Long report (SFS 2487):
- **Font:** Aptos 11pt
- **Line spacing:** 1.2
- **Margins:** L 2cm, R/T/B 1cm

## Zotero Integration

This template uses BibTeX for citations. Zotero can export your library as a `.bib` file.

### Export from Zotero

1. Select the references you want to cite in Zotero
2. Right-click → **Export Items...**
3. Choose **BibTeX** as the format
4. Save as `references.bib` in your project folder

### Alternative: Zotero-BibTeX Plugin

For automatic syncing, install the [Better BibTeX for Zotero](https://retorque.re/zotero-better-bibtex/) plugin:

1. In Zotero, go to **Edit → Preferences → Better BibTeX**
2. Enable **Keep updated** and set the auto-export path to your project folder
3. Export once as BibTeX — the file updates automatically when you add/change references

### Cite in Typst

```typ
According to @westerman2014, digital transformation...

As shown by @verhoef2021 and @braun2006...

#bibliography("references.bib")
```

## License

CC BY-SA 3.0 — see [LICENSE](LICENSE).
