# Laurea Thesis Template for Typst

A Typst template matching the official Laurea University of Applied Sciences Word thesis template.

## Features

- Matches the official `Thesis template.docx` formatting
- Cover pages (title, author, degree, publication info)
- Abstract page with structured fields
- Headings (1–3) with auto-numbering
- Table of contents, list of figures/tables
- Bibliography with Harvard (Laurea) citation style
- Appendices support

## Quick Start

### From Typst Universe

```bash
typst init @preview/laurea-templates:0.1.0 my-thesis
cd my-thesis
typst compile main.typ
```

### Install locally for development

1. Clone this repository:

```bash
git clone https://github.com/Snoozyman/laurea-templates.git
cd laurea-templates
```

2. Install as a local package:

```bash
mkdir -p ~/.local/share/typst/packages/local/laurea-templates/0.1.0
cp -r src typst.toml ~/.local/share/typst/packages/local/laurea-templates/0.1.0/
```

3. Edit `template/main.typ` — change the import to use `@local`:

```typ
#import "@local/laurea-templates:0.1.0": *
```

4. Compile the template:

```bash
typst compile template/main.typ
```

To use the example thesis instead:

```bash
typst compile example-thesis.typ
```

## Parameters

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
| `bibliography-file` | str\|none | `none` | Path to `.bib` file |
| `csl-style` | str | `"laurea-harvard.csl"` | CSL style file path |

## Helper Functions

```typ
// Start a new appendix
#appendix[Appendix 1: Title][
  Appendix content here...
]
```

## Formatting Reference

- **Font:** Aptos 11pt (fallback: Trebuchet MS)
- **Line spacing:** 150%
- **Cover margins:** L 2cm, R 1cm, T 6.8cm, B 1.5cm
- **Body margins:** L 4cm, R 2cm, T 2.7cm, B 1.5cm
- **Heading 1:** 1.27cm above
- **Heading 2:** 0.423cm above
- **Heading 3:** 0.423cm above

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
```

## License

CC BY-SA 3.0 — see [LICENSE](LICENSE).
