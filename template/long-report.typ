// Example usage of the Laurea long-report template
// Compile with: typst compile main.typ

#import "@local/laurea-templates:0.2.0": long-report, appendix

#show: long-report.with(
  title: [Digital Transformation in Small and Medium-sized Enterprises],
  authors: ("Maija Meikäläinen",),
  date: "May 2026",
  teacher: "Dr. John Doe",
  document-type: "Report",
  study-unit: "Digital Business Strategies",
)

// ═══════════════════════════════════════════════════════════════
// 1. INTRODUCTION
// ═══════════════════════════════════════════════════════════════

= Introduction

Digital transformation has become a critical priority for businesses worldwide @westerman2014. Small and medium-sized enterprises (SMEs) face particular challenges in this process due to limited resources and expertise @verhoef2021.

According to @bharadwaj2000, digital transformation involves "the use of digital technology to enable major business improvements." This report examines how Finnish SMEs navigate this transformation and what strategies have proven effective.

The report is structured as follows. Section 2 reviews the relevant literature, Section 3 describes the methodology, Section 4 presents the results, and Section 5 discusses the findings and conclusions.

// ═══════════════════════════════════════════════════════════════
// 2. THEORETICAL FRAMEWORK
// ═══════════════════════════════════════════════════════════════

= Theoretical Framework

== Digital Transformation

Digital transformation is a multidimensional concept that has been defined in various ways by researchers @verhoef2021. At its core, it involves the integration of digital technologies into all areas of a business, fundamentally changing how it operates and delivers value @westerman2014.

== SMEs and Technology Adoption

Small and medium-sized enterprises are defined by the European Commission as companies with fewer than 250 employees and an annual turnover of less than €50 million. SMEs represent 99% of all businesses in the EU and are a significant source of employment @european2020.

The technology adoption literature identifies several factors that influence SMEs' decisions to adopt new technologies @rogers2003:

- Perceived relative advantage
- Compatibility with existing systems
- Complexity of the technology
- Trialability
- Observability of results

== Frameworks for Digital Transformation

Several frameworks have been proposed for understanding digital transformation @verhoef2021. The most widely cited include the MIT Sloan framework @westerman2014 and the Deloitte Digital Maturity Model.

// ═══════════════════════════════════════════════════════════════
// 3. METHODOLOGY
// ═══════════════════════════════════════════════════════════════

= Methodology

This study employs a qualitative research approach combining a literature review with empirical interviews.

== Data Collection

The literature review covers publications from 2015 to 2025, sourced from Scopus and Web of Science databases. The search terms included "digital transformation," "SME," and "technology adoption."

In addition, five semi-structured interviews were conducted with managers of Finnish SMEs between January and March 2026. The interview guide covered topics such as current digital maturity, challenges faced, and strategies employed.

== Data Analysis

The interview data was analysed using thematic analysis as described by @braun2006. The analysis followed six steps: familiarisation, generating initial codes, searching for themes, reviewing themes, defining and naming themes, and producing the report.


// ═══════════════════════════════════════════════════════════════
// 4. RESULTS
// ═══════════════════════════════════════════════════════════════

= Results

== Barriers to Digital Transformation

The analysis revealed three main categories of barriers: organisational, financial, and technical. Table 1 summarises the barriers identified across the five interviewed companies.

#figure(
  table(
    columns: (1fr, 2fr),
    align: (left, left),
    table.header(
      [*Category*], [*Description*],
    ),
    [Organisational], [Lack of digital skills and resistance to change],
    [Financial], [Limited budgets for technology investments],
    [Technical], [Legacy systems and integration challenges],
  ),
  caption: [Barriers to digital transformation in interviewed SMEs],
) <tab-barriers>

As shown in @tab-barriers, organisational barriers were the most frequently cited, mentioned by all five companies.

== Effective Strategies

The interviews identified several effective strategies:

+ Partnership with technology providers
+ Incremental implementation approach
+ Employee training programmes
+ Government support schemes

= Conclusions

This report has examined digital transformation in Finnish SMEs. The key findings are:

1. Organisational barriers, particularly lack of digital skills, are the most significant obstacles
2. Incremental implementation and partnership strategies are effective approaches
3. A three-phase framework (assessment, implementation, improvement) can guide SMEs through the transformation process

// ═══════════════════════════════════════════════════════════════
// APPENDICES
// ═══════════════════════════════════════════════════════════════

#appendix[Interview Guide][
  The interview guide included the following questions:

  + How would you describe your company's current level of digital maturity?
  + What are the main challenges your company has faced in adopting digital technologies?
  + What strategies have you found most effective?
  + What role has government support played in your digital transformation?
  + What advice would you give to other SMEs embarking on digital transformation?
]

#appendix[Consent Form][
  *Informed Consent Form*

  I, the undersigned, consent to participate in the research study titled "Digital Transformation in Small and Medium-sized Enterprises" conducted by Maija Meikäläinen at Laurea University of Applied Sciences.

  I understand that:
  - My participation is voluntary
  - I may withdraw at any time
  - My responses will be anonymised
  - The data will be used only for academic purposes

  Signature: #box(width: 8cm, baseline: 1pt)[#line(length: 100%, stroke: 0.4pt)] \
  Date: #box(width: 5cm, baseline: 1pt)[#line(length: 100%, stroke: 0.4pt)]
]

#bibliography("references.bib")
