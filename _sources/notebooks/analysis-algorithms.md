# Algorithms and performance

A program can be correct and still become unusable when its input grows. The
Wednesday lecture asks how we can predict that change, compare two algorithms
fairly, and decide whether an apparent improvement is worth keeping.

By the end of the session, you should be able to:

- distinguish testing, profiling and algorithm analysis;
- measure comparable runs over several input sizes;
- explain what an order of growth says—and what it leaves out;
- compare a quadratic pair-search with a set-based alternative;
- identify a time-memory trade-off; and
- justify an algorithmic choice using correctness checks, measurements and a
  scaling argument.

The examples use Python, but the reasoning is language-independent. The same
questions apply to an R analysis, a shell workflow or a simulation submitted to
a cluster.

```{admonition} Draft lecture
:class: warning

The [Algorithms and performance slides](../lectures/analysis_algorithms/analysis_algorithms.html)
are a draft adaptation of Stanislav (Stanley) Modrak's *Analysis of algorithms*
lecture. Content, visual provenance, permissions and teaching fit are under
review and may change before delivery.
```

## Before the session

Revisit [profiling in Python](python.ipynb#the-need-for-speed-profiling-code).
Bring one example of a program that becomes slower when its input grows. You do
not need to know asymptotic notation in advance.

## The central workflow

Use this order when comparing implementations:

1. State the problem, input, output and assumptions.
2. Check both implementations against the same independently expected results.
3. Time equivalent work over several input sizes.
4. Predict how the important operation count grows.
5. Compare the prediction with the measurements.
6. Consider memory, clarity and realistic input sizes before choosing.

Correctness comes first. Optimising a program is useful only if it continues to
solve the intended scientific problem.

For deeper material on profiling, numerical performance and computing at
larger scale, continue to [Performance, Scaling, and Compute](../appendices/performance.md).

