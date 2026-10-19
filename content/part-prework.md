# Introduction & prerequisites

These are short exercises (with worked solutions) to refresh the core mathematics and statistics ideas that show up repeatedly in:

- **Ecological & Evolutionary Modelling** (building and analysing mechanistic models)
- **Advanced Data Analyses and Statistics** (fitting models to data and doing inference)

## You will learn / refresh

- Functions, graphs, and transformations
- Calculus (derivatives/integrals, Taylor series intuition)
- Linear algebra basics (matrices, eigenvalues)
- Differential equation intuition (equilibria, stability)
- Probability and likelihood fundamentals

## Prerequisites

There are no formal prerequisites. However, what you should prioritise depends on which MQB section you are preparing for.

### If you are preparing for *Ecological & Evolutionary Modelling*

This section uses mathematical models as the main language. You will get most value if you can:

- Manipulate algebraic expressions (rearrange equations; logs/exponentials)
- Interpret derivatives/integrals as **rates** and **accumulation**
- Multiply a small matrix by a vector; read a matrix model; basic eigenvalue intuition

These skills are used heavily in:

- [Metabolic basis](notebooks/metabolic-basis)
- [Populations](notebooks/populations) (and its practicals)
- [Interactions](notebooks/interactions)
- [Competitive dynamics](notebooks/competitive-dynamics)
- [Predator–prey](notebooks/predator-prey)
- [Epidemiology](notebooks/epidemiology)

### If you are preparing for *Advanced Data Analyses and Statistics*

This section is about fitting models and quantifying uncertainty. You will get most value if you can:

- Work comfortably with exponentials/logs and simple calculus (for optimisation and likelihoods)
- Understand probability basics (expectation/variance; common distributions)
- Read and manipulate a log-likelihood (dropping constants; interpreting parameters)

These skills are used heavily in:

- [GLMs](notebooks/glms)
- [Nonlinear least squares (NLLS)](notebooks/nlls)
- [Maximum likelihood estimation (MLE)](notebooks/mle)

### If you are preparing for *(future) Bayesian modelling*

Bayesian chapters are not yet deployed, but if/when you take them you will get most value if you can:

- Manipulate probabilities and densities (including conditional probability)
- Understand what a **prior**, **likelihood**, and **posterior** represent
- Interpret uncertainty summaries (credible intervals) and posterior predictive thinking
- Recognise that computation (e.g. sampling) is often required when posteriors are not available in closed form

The closest prerequisites in the current MQB material are:

- [GLMs](notebooks/glms) (model specification and interpretation)
- [Nonlinear least squares (NLLS)](notebooks/nlls) (model fitting and diagnostics)
- [Maximum likelihood estimation (MLE)](notebooks/mle) (likelihood as the bridge to Bayes)

### If you are preparing for *(future) Machine Learning modelling*

Machine-learning chapters are not yet deployed, but if/when you take them you will get most value if you can:

- Think in terms of **prediction** vs **explanation** (and when each is appropriate)
- Understand train/test splits, cross-validation, overfitting, and why leakage matters
- Be comfortable with feature/response notation and basic matrix/vector operations
- Interpret performance metrics (e.g. accuracy/AUC for classification; RMSE/$R^2$ for regression)

The closest prerequisites in the current MQB material are:

- [Regression](notebooks/regress) (prediction, residuals, generalisation)
- [GLMs](notebooks/glms) (classification/regression framing)
- [Optimisation & likelihood](notebooks/mle) (objective functions and fitting)

If you want a quick refresher on the “basic stats” pipeline first (design → tests → regression), see:

- [Experimental design](notebooks/exp-design)
- [t and F tests](notebooks/t-f-tests)
- [Regression](notebooks/regress)
- [ANOVA](notebooks/anova)

## Recommended pre-work

- Do the [Exercises](notebooks/mqb-prework-exercises) first, then use the [Solutions](notebooks/mqb-prework-solutions) to check your reasoning.
- If you are about to start **E&E Modelling**, prioritise sections **2–4** (calculus, linear algebra, differential equations) in the exercises.
- If you are about to start **Advanced Data Analyses and Statistics**, prioritise sections **2, 5, and 6** (calculus, probability, optimisation/likelihood).
- If you are preparing for **Bayesian modelling**, prioritise sections **5 and 6** (probability + likelihood/optimisation), then skim **2** (calculus) as needed.
- If you are preparing for **Machine Learning**, prioritise sections **5 and 6** (probability + optimisation/likelihood), and make sure you can follow the Python checks.

## Do this first

1. Work through the [Exercises](notebooks/mqb-prework-exercises)
2. Use the [Solutions](notebooks/mqb-prework-solutions) to check your reasoning

## When to use this

- Before the modelling chapters if you feel rusty.
- Before GLMs/NLLS/MLE if you feel rusty.
