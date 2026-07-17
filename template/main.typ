// Example usage of the Laurea thesis template
// Compile with: typst compile main.typ

#import "@preview/laurea-templates:0.1.0": *

#show: laurea-thesis.with(
  title: [Digital Transformation in Small and Medium-sized Enterprises],
  author: "Maija Meikäläinen",
  degree: "Bachelor of Business Administration",
  programme: "Business Management",
  month: "May",
  year: "2026",
  page-count: 48,
  abstract: [
    This thesis examines the digital transformation process in small and medium-sized enterprises (SMEs) in Finland. The objective is to identify the key factors that influence the adoption of digital technologies and to develop a practical framework for SMEs undertaking digital transformation. The study combines a systematic literature review with semistructured interviews of five SME managers. The results indicate that organizational readiness, leadership commitment, and access to digital skills are the most critical success factors. The thesis proposes a three-phase framework: assessment, implementation, and continuous improvement.
  ],
  keywords: ("digital transformation", "SMEs", "Finland", "technology adoption", "organizational change"),
  bibliography-file: "references.bib",
)

// ═══════════════════════════════════════════════════════════════
// CHAPTER 1: INTRODUCTION
// ═══════════════════════════════════════════════════════════════

= Introduction

Digital transformation has become a critical priority for businesses worldwide @westerman2014. Small and medium-sized enterprises (SMEs) face particular challenges in this process due to limited resources and expertise @verhoef2021.


According to @bharadwaj2000, digital transformation involves "the use of digital technology to enable major business improvements." This thesis examines how Finnish SMEs navigate this transformation.

The research questions are:
+ What are the main barriers to digital transformation in Finnish SMEs?
+ What strategies have proven effective in overcoming these barriers?
+ How can a practical framework support SMEs in their digital journey?

// ═══════════════════════════════════════════════════════════════
// CHAPTER 2: THEORETICAL FRAMEWORK
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
// CHAPTER 3: METHODOLOGY
// ═══════════════════════════════════════════════════════════════

= Research Methodology

This study employs a qualitative research approach combining a literature review with empirical interviews.

== Data Collection

The literature review covers publications from 2015 to 2025, sourced from Scopus and Web of Science databases. The search terms included "digital transformation," "SME," and "technology adoption."

In addition, five semi-structured interviews were conducted with managers of Finnish SMEs between January and March 2026. The interview guide covered topics such as current digital maturity, challenges faced, and strategies employed.

== Data Analysis

The interview data was analysed using thematic analysis as described by @braun2006. The analysis followed six steps: familiarisation, generating initial codes, searching for themes, reviewing themes, defining and naming themes, and producing the report.

== Ethical Considerations

All interview participants were informed about the purpose of the study and provided written consent. The data was anonymised to protect participant identities.

// ═══════════════════════════════════════════════════════════════
// CHAPTER 4: RESULTS
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

== A Proposed Framework

Based on the findings, a three-phase framework is proposed:
1. *Assessment Phase*: Evaluate current digital maturity and identify gaps
2. *Implementation Phase*: Deploy technologies in stages, starting with quick wins
3. *Improvement Phase*: Continuously monitor, evaluate, and optimise

// ═══════════════════════════════════════════════════════════════
// CHAPTER 5: DISCUSSION
// ═══════════════════════════════════════════════════════════════

= Discussion

The findings of this study align with previous research on digital transformation in SMEs @verhoef2021 @westerman2014. The prominence of organisational barriers is consistent with the resource-based view of the firm @barney1991, which suggests that firms with limited resources face greater challenges in implementing strategic changes.

The proposed three-phase framework builds on existing models but is specifically tailored to the Finnish SME context. The emphasis on incremental implementation reflects the practical constraints faced by smaller organisations @rogers2003.

== Limitations

This study has several limitations. The sample size of five interviews limits the generalisability of the findings. Additionally, the study focuses on Finnish SMEs, and the results may not be directly applicable to other contexts.

== Recommendations for Future Research

Future research should validate the proposed framework through longitudinal studies and explore the role of government policy in supporting SME digital transformation.

// ═══════════════════════════════════════════════════════════════
// CHAPTER 6: CONCLUSIONS
// ═══════════════════════════════════════════════════════════════

= Conclusions

This thesis has examined digital transformation in Finnish SMEs. The key findings are:

1. Organisational barriers, particularly lack of digital skills, are the most significant obstacles
2. Incremental implementation and partnership strategies are effective approaches
3. A three-phase framework (assessment, implementation, improvement) can guide SMEs through the transformation process

The thesis contributes to the understanding of digital transformation in the specific context of Finnish SMEs and provides a practical tool for business managers.

// ═══════════════════════════════════════════════════════════════
// APPENDICES
// ═══════════════════════════════════════════════════════════════

#pagebreak()
= Appendices

#appendix[Appendix 1: Interview Guide][
  The interview guide included the following questions:

  + How would you describe your company's current level of digital maturity?
  + What are the main challenges your company has faced in adopting digital technologies?
  + What strategies have you found most effective?
  + What role has government support played in your digital transformation?
  + What advice would you give to other SMEs embarking on digital transformation?
]

#appendix[Appendix 2: Interview Consent Form][
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
