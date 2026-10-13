# Algorithms: solving problems with computation

Programming languages give us ways to express instructions. Algorithms are the
ideas behind those instructions: precise procedures for solving specified
problems. The distinction matters. Learning more syntax may help you write a
longer program; learning to think algorithmically may help you discover that
you did not need the longer program in the first place.

Algorithms are not only about speed. They influence which scientific questions
we can investigate, how clearly we reason about a problem, whether somebody
else can check our work, and what becomes possible when the data grow. They
also run search engines, route deliveries, recommend music and decide which
advertisement follows you around the internet. Their impact is broad and
far-reaching—sometimes wonderfully so, sometimes merely profitable, and often
both.

Several examples in this chapter—especially the route from 3-SUM measurements
to cost models and orders of growth—draw on Sedgewick and Wayne's *Algorithms*
and its companion Section 1.4 material
{cite}`SedgewickWayne2011Algorithms,SedgewickWayneSection14`.

```{admonition} Learning goals
By the end of this chapter you should be able to:

- explain why algorithms matter beyond computational performance;
- distinguish a problem, an algorithm, a data structure and an implementation;
- state an algorithm's inputs, outputs and assumptions;
- compare possible solutions using correctness, clarity, time and memory;
- explain how algorithmic choices can make new scientific questions feasible;
- interpret simple empirical and mathematical evidence about scaling; and
- justify an algorithmic choice without assuming that the fastest-looking code
  must be the best solution.
```

## Why study algorithms?

There are several good reasons—some noble, some practical and at least one that
has made a few people extraordinarily rich.

### To solve problems that could not otherwise be addressed

A better algorithm can turn an impossible calculation into an ordinary one.
Genome assembly, searching biological databases, reconstructing evolutionary
histories and running large ecological simulations all depend on organising the
computation carefully, not merely on asking a faster computer to perform more
of the same work.

This does not mean that every biological problem has one magical fast
algorithm. It means that how we formulate a computation can determine whether
the scientific question is tractable at all.

### To become a proficient programmer

Syntax tells you how to express an instruction in Python, R or another
language. Algorithms make you ask better questions before you write that
instruction: What exactly is the problem? What information must be retained?
Which operations are repeated? Can the same result be obtained more directly?

A proficient programmer is not simply someone who can produce a great deal of
code. Quite often, proficiency is visible in the code they realise they do not
need to write.

### For intellectual stimulation

Designing an algorithm can be satisfying in much the same way as solving a
puzzle or finding a concise mathematical argument. A complicated task is
reduced to a set of precise steps, hidden assumptions are exposed, and an
apparently unavoidable piece of work sometimes disappears altogether.

Some people relax with crosswords. Others try to remove a factor of $n$ from an
algorithm. We shall not judge either group.

### To understand their broad impact

Algorithms shape transport, communication, medicine, finance, public services
and much of everyday life online. They determine what information can be found,
which patterns can be detected and which decisions can be automated. That
influence makes them worth understanding even when we are not the people
implementing them.

### They may unlock the secrets of life—and perhaps the universe

Modern biology relies on algorithms to compare sequences, assemble genomes,
identify structures, infer relationships and analyse images. Other sciences use
them to process signals from telescopes, particle detectors and simulations.
Whether the universe will surrender all its secrets is uncertain, but it seems
polite to give it a well-specified algorithm and a proper test!

### For profit

Efficient search, routing, recommendation, compression and trading algorithms
have created considerable commercial value. Profit is therefore a genuine
motivation for algorithm development. It is not, of course, evidence that an
algorithm is scientifically valid, socially desirable or even especially "nice"!

## Problems, algorithms, implementations and data structures

These terms describe different parts of the reasoning:

| Term | Meaning |
| --- | --- |
| **Problem** | The question to be answered, including its inputs, required output and assumptions. |
| **Algorithm** | A precise sequence of steps for solving that problem. |
| **Data structure** | A way of organising information so that useful operations can be performed. |
| **Implementation** | An expression of the algorithm in a particular programming language and environment. |

The same algorithm can be implemented in Python, R or another language. The
same problem can also have several algorithms, and their choice of data
structure may change how much work they require. Lists, vectors, dictionaries,
sets and data frames are therefore not merely different boxes in which to place
data: they support different operations and make different solutions natural.

## One problem, more than one solution

Suppose we have a collection of numbers and want to know how many pairs sum to
zero. To make the problem precise, let us count pairs of positions $(i,j)$ for
which $i < j$ and $x_i + x_j = 0$. Stating that index rule matters when values
are repeated.

One algorithm compares every possible pair:

```text
count = 0
for each position i:
    for each later position j:
        if x[i] + x[j] equals zero:
            increase count
return count
```

This is transparent and easy to check. It also performs
$n(n-1)/2$ pair comparisons for $n$ values, so the amount of work grows roughly
as $n^2$.

Another algorithm remembers values it has already encountered:

```text
start an empty collection of previously seen values
for each value x:
    look for -x among the previously seen values
    update the count if it is present
    remember x
return count
```

If the remembered values are stored in a structure with fast membership tests,
this can require much less time on average. It also uses additional memory, and
care is needed if repeated values should produce several index pairs. The
lesson is not that sets are always better than loops. It is that a choice of
data structure can make a different algorithm possible.

## What makes an algorithm suitable?

Speed matters, but it is not the first or only question.

1. **Correctness:** does the algorithm solve the problem actually stated?
2. **Assumptions:** for which inputs should it work, and what happens outside
   that domain?
3. **Clarity:** can another person understand, test and maintain it?
4. **Time:** how does the amount of work change as the input grows?
5. **Memory:** what must be stored while the algorithm runs?
6. **Practical context:** are the expected data large enough for the more
   elaborate solution to be worthwhile?

```{admonition} Optimise the right thing
:class: note

Donald Knuth famously warned that “premature optimization is the root of all
evil” in [*Structured Programming with go to
Statements*](https://doi.org/10.1145/356635.356640). This does not mean that
efficiency is unimportant. It means that small, speculative improvements
should not distract us before we have a correct solution and evidence about
where the real cost lies.

First make the problem precise and test the result. Then measure. If
performance matters, improve the algorithm—or the part of its implementation
that the evidence identifies—not whichever loop happens to look untidy.
```

A fast wrong answer is still wrong—just sooner. Begin with independently
expected results for small examples, and use the same checks for every
implementation being compared.

## From measurements to scaling

Timing one run can tell us what happened once on one computer. It cannot, by
itself, tell us how the algorithm will behave as the problem grows. A useful
comparison therefore combines several kinds of evidence:

1. run equivalent implementations on the same inputs;
2. check that they return the same independently expected results;
3. repeat timings rather than relying on a single run;
4. measure several input sizes;
5. identify the important operation and predict how often it is repeated; and
6. compare that prediction with the measurements.

An **order of growth** describes how the dominant amount of work changes with
input size. If doubling $n$ roughly quadruples the work, quadratic growth is a
plausible explanation; if it roughly doubles, linear growth may be more
plausible. Real timings also contain interpreter, memory, operating-system and
hardware effects, so measurements and mathematical analysis inform one another
rather than serving as interchangeable proofs.

## Algorithms can change what science is feasible

Scientific computing is full of repeated work. Sometimes that work is
unavoidable; sometimes it reflects how the problem was first formulated.

- Genome assembly methods use structured representations of sequence overlap
  rather than examining every possible reconstruction.
- Search and indexing structures allow large biological databases to be
  queried without inspecting every record in the same way for every question.
- Ecological simulations can sometimes reuse quantities that have not changed
  rather than recomputing the entire system at every step.
- Image-analysis algorithms can focus computation on informative structures
  rather than treating every possible pattern equally.

These are broad examples, not universal complexity claims about whole fields.
The underlying point is that an algorithm can change the scientific boundary:
questions that were once too expensive to ask may become routine.

## Algorithms in science and society

The same reach creates responsibilities. An algorithm carries assumptions
about what should be optimised, which data count and what errors matter. A
commercially successful recommendation system and a scientifically defensible
analysis are judged by rather different criteria, even if both are technically
impressive.

When an algorithm contributes to a scientific or social decision, ask:

- What objective has been encoded?
- Which observations are absent or poorly represented?
- How would we detect a plausible but wrong result?
- Who benefits when the algorithm succeeds, and who bears the cost when it
  fails?

Algorithmic reasoning is therefore not merely a route to faster code. It is a
way to make computational choices explicit enough to examine.

## A practical workflow for comparing algorithms

Use this order when comparing possible solutions:

1. State the problem, inputs, outputs and assumptions.
2. Work out expected results for small examples.
3. Describe each algorithm before concentrating on syntax.
4. Implement and test both against the same expectations.
5. Measure equivalent work over several input sizes.
6. Predict how the important operation count grows.
7. Compare the prediction with the measurements.
8. Consider memory, clarity and realistic input sizes before choosing.

```{admonition} Try it: compare two pair-search algorithms
:class: tip

Implement the two pair-search algorithms above in a language of your choice.
Begin with a small input for which you can count the qualifying index pairs by
hand. Then use several larger inputs to investigate how their running times
change. Explain the role of the data structure in the second algorithm and give
one situation in which you would still choose the simpler first version.
```

## Lecture and further material

The [Analysis of algorithms slides](../lectures/algorithms/algorithms.html)
develop these ideas through 3-SUM, empirical measurement, simple cost models,
orders of growth and a worked 2-SUM comparison. The slides are a draft
adaptation of Stanislav (Stanley) Modrak's original lecture, itself adapted from
Sedgewick and Wayne. Content, visual provenance and permissions remain under
review.

For implementation-specific profiling and vectorisation, return to the
[Python chapter](python.ipynb#the-need-for-speed-profiling-code) or the
[R vectorisation section](r.ipynb#vectorization). For memory, numerical scaling,
parallel computing and larger computing resources, continue to
[Performance, Scaling, and Compute](../appendices/performance.md).
