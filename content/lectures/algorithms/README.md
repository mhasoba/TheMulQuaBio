# Algorithms: solving problems with computation

This directory contains a draft MQB adaptation of Stanislav (Stanley) Modrak's
48-slide *Analysis of algorithms* lecture, itself credited as adapted from
Robert Sedgewick and Kevin Wayne at Princeton. The examples and sequence align
particularly closely with Sedgewick and Wayne's *Algorithms*, 4th edition
(Addison-Wesley, 2011), [Section 1.4: Analysis of
Algorithms](https://algs4.cs.princeton.edu/14analysis/) and the corresponding
[Princeton lecture
slides](https://algs4.cs.princeton.edu/lectures/keynote/14AnalysisOfAlgorithms.pdf).

The redraft retains the original lecture's broad case for studying algorithms:
their scientific and social reach, their role in becoming a proficient
programmer, their intellectual appeal, the problems they make tractable, their
potential to reveal the workings of life and the universe, and—less
romantically—their commercial value. It then develops 3-SUM, experimental
analysis, operation-count models, orders of growth, a 2-SUM comparison, memory
and the parallelism/HPC signpost.

The MQB adaptation adds explicit correctness checks, repeated timing, input
assumptions, tighter asymptotic language and time-memory trade-offs. It treats
performance as one reason for studying algorithms rather than the subject's
only motivation, and connects the lecture to the programming language-agnostic
[algorithms chapter](../../notebooks/algorithms.md).

The source and assets are retained for contributor review. This is not yet an
approved or released lecture.

## Render locally

From the MQB repository root:

```bash
quarto render content/lectures/algorithms/algorithms.qmd --to revealjs
```

The generated `algorithms.html` embeds its presentation resources.
Press `S` while presenting to open the speaker view.

## Timing

The draft budgets approximately 111 minutes, including a ten-minute break and a
15-minute paired practical. Any remaining time can be used for questions,
completion and discussion.

| Approximate time | Focus |
| :-- | :-- |
| 00:00–18:30 | Why algorithms matter, definitions and the evidence chain |
| 18:30–37:30 | 3-SUM and experimental measurement |
| 37:30–55:30 | Cost models and orders of growth |
| 55:30–65:30 | Break |
| 65:30–77:00 | Two 2-SUM algorithms and correctness checks |
| 77:00–97:00 | Paired timing practical and debrief |
| 97:00–111:00 | Memory, parallelism, conclusions and reproducible evidence |

## Source and asset record

The supplied source PDF had SHA-256:

```text
1640b9cfa450bd006b413bd775c61b25cff5695166022c97032a4e5ade36271c
```

`assets/original/` contains every raster image and soft mask that `pdfimages`
could extract from that PDF. See [the asset manifest](assets/README.md) for the
page mapping. Several images contain text or third-party logos and are retained
for audit and contributor review rather than automatically reused in the
redraft. Their provenance and permission status must be resolved before public
release.

The [Princeton booksite](https://algs4.cs.princeton.edu/home/) asks teachers who
adapt its online material to follow normal academic attribution, while its
[FAQ](https://algs4.cs.princeton.edu/faq/) also asks instructors to contact the
authors for permission. The citation above therefore records the intellectual
source but does not, by itself, establish permission to republish the original
slides or graphics. Before release, confirm which Princeton material Stanley
used, whether permission was obtained, and which source-derived visuals can be
retained. Where that cannot be established, link to the source and use MQB's
own prose, code or newly drawn diagrams instead.

Some apparent diagrams and equations in the PDF are vector or text objects
rather than embedded images. They have been reconstructed as editable text,
tables, equations or code in the Quarto source. No extractable raster asset has
been silently discarded.

