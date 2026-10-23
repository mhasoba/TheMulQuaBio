# Introduction & prerequisites

This part gets you comfortable with the command line, version control, and the core tools used throughout MQB.

You can follow the computing chapters as a multilingual bootcamp or study just the parts you need. In either case, use the same approach to organising your work: a project with clearly separated code, inputs and outputs.

## Organising your learning project

Should you make a new folder when you move from Shell to Python or R? Not just because you are changing language. These tools can contribute to the same analysis, so their scripts can live together in one project.

- **Following a multilingual computing bootcamp:** create a `MQB_Bootcamp` project and repository across the computing chapters. Do not create a separate R or Python coursework project, or rename an existing project, simply because a chapter uses another example name.
- **Studying independently:** create one learning project, or reuse an appropriate existing one. Choose a meaningful name; `mqb_practice` is one example. You can use it for Shell, R, Python or any combination of chapters. You do not need to complete the other languages or the Git chapter before starting; follow the prerequisites of the chapter you choose.
- **Disposable exercises:** where an exercise explicitly asks for a temporary practice project, keep it separate from work you need to retain. This lets you experiment safely; it does not replace your permanent project.
- **Assessed work:** the released brief controls repository names, layout and submission requirements. General examples in the book do not change those rules.

The outer folder's name can vary. What the examples normally depend on is this layout inside it:

```text
your-project/
├── README.md
├── code/
├── data/
├── results/
└── sandbox/       # optional, for disposable experiments
```

Store scripts in `code/`, supplied inputs in `data/` and generated outputs in `results/`. For multilingual work, `.sh`, `.py` and `.R` files can share `code/`. Keep inputs unchanged, and describe the purpose of the project and how to run it in `README.md`. If you use Git, keep a root `.gitignore` for generated files and other files that should not be tracked.

Use the directory names exactly as shown: `code`, not `Code`. Many file systems distinguish these spellings. Simple project names without spaces make command-line examples easier to follow; existing names with spaces do not require renaming, but their paths need quoting.

Unless an exercise explicitly says otherwise, start commands at the **project root**: the directory containing `README.md`, `code/`, `data/` and `results/`. From there, run a script as `python3 code/script.py`, `Rscript code/script.R` or `bash code/script.sh`. Paths such as `data/input.csv` and `results/output.csv` are relative to that root, not to a particular project name. Navigation exercises, notebooks and HPC jobs may name a different starting directory; follow the stated exception rather than guessing. Keep your learning project separate from the downloaded MQB book repository.

If you already have a project with this layout, reuse it. For a new project, the [Unix directory exercise](notebooks/unix.ipynb#building-your-coursework-directory-structure) demonstrates Shell commands and [Your analysis workflow in R](notebooks/r.ipynb#your-analysis-workflow) shows the R equivalent. Neither requires you to create another project when switching language.

## You will learn

- Navigate files/directories efficiently (terminal basics)
- Write small shell scripts for reproducible workflows
- Use `git` to version-control your work and collaborate
- Work with LaTeX for scientific writing
- Get started with Python and R in a reproducible project setup

## Prerequisites

- None assumed.
- If you are brand new to Jupyter, see the [Jupyter introduction appendix](notebooks/appendix-jupy-intro).
- If a computing word is unfamiliar, use [Key computing terms](appendices/terms.md) and return to the chapter when it makes sense.

## Recommended pre-work

- If you have never used a terminal before: skim the first section of [Unix](notebooks/unix).
- If you have never used version control: read the intro of [Git](notebooks/git).

## Choosing a route

For the full computing route:

1. Start with [Unix](notebooks/unix).
2. Learn to retain and inspect your history with [Git](notebooks/git).
3. Continue into [Shell scripting](notebooks/shell-scripting), [Python](notebooks/python) and [R](notebooks/r), following your course's teaching sequence.

For standalone study, go directly to the chapter you need and check its prerequisites. Return to Unix for unfamiliar file operations and to Git when you want version control; you do not need a separate project for each topic.

## Plan, implement, test, explain and rerun

1. **Plan:** name the question, inputs, outputs and assumptions; predict a small example by hand.
2. **Implement:** translate the plan into a small function or script, starting with your own attempt.
3. **Test:** compare the result with your prediction, then check a boundary case and an invalid input.
4. **Explain:** describe why the result answers the question and what each check detects.
5. **Rerun:** start a fresh process from the documented project root and verify the same result with the same inputs.

Try the [independent Python observations exercise](notebooks/python.ipynb#independent-exercise-summarise-observations-by-site). The Python and R exercises begin with your own attempt; afterwards, you can critique a prepared suggestion without an assistant account. Each released assignment brief controls its assessed tasks and AI permissions; teaching examples do not amend those rules.

See [AI-assisted programming in biology](notebooks/ai-assisted-programming.ipynb) and the accompanying [lecture slides](lectures/ai_coding/ai_coding.html), both in progress. For setup, use [Getting started with GitHub Copilot in VS Code](appendices/vscode-copilot.md).

## Where this goes next

Most later chapters assume you can:
- run commands in a terminal,
- manage files with relative paths,
- and, where an exercise uses version control, pull/update a repository with `git`.
