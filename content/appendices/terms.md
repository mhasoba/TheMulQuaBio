(mqb-terms)=
# Key computing terms

Use this page when an unfamiliar computing term appears in MQB. Each chapter explains a term again when it is needed for an activity; this page is a short place to look it up.

(terminal)=
## Terminal and shell

### Terminal

A **terminal** is an application window where you type commands and see their output. On macOS it is usually called Terminal; on Linux it may be Terminal, GNOME Terminal or a similar name. VS Code and other modern code editors also have an integrated terminal.

(shell)=
### Shell

A **shell** is the program inside a terminal that reads the commands you type and starts other programs. MQB mainly uses Bash. A terminal is the window; the shell is the command-reading program in that window.

(paths-and-the-current-directory)=
## Paths, files and systems

### Paths and the current directory

A **path** names the location of a file or folder. The **current directory** is the folder a terminal or program is using right now. The `pwd` command prints that folder.

An **absolute path** gives the complete location, starting at the top of the file system. For example, `/opt/homebrew/bin/brew` is an absolute path on many Apple Silicon Macs. A **relative path** starts from the current directory, such as `data/observations.csv`.

(project-root)=
### Project root

A **project root** is the main folder for one project, whether coursework or independent study. In MQB examples it normally contains `README.md`, `code`, `data` and `results`. The outer folder's name is not part of the example's internal paths: bootcamp students can keep using `MQB_Bootcamp`, while independent learners choose their own name. Shell, Python and R scripts can share the same project. See [Organising your learning project](../part-computing.md#organising-your-learning-project).

Unless an exercise names another starting directory, return to this root before running a script. A path such as `data/observations.csv` is then relative to the root, so the whole project can move without embedding one person's absolute path. Exercises about navigation, notebooks and HPC jobs may state a different starting directory explicitly.

(path)=
### PATH

`PATH` is a list of folders that a shell searches when you type a command name. If the folder containing a program is on `PATH`, you can type the program's short name, such as `brew`, instead of its full path. `command -v NAME` shows the location the shell would use for a command named `NAME`.

(startup-file)=
### Startup file

A **startup file** is a settings file that a shell reads when a new terminal session starts. A line added there affects future sessions. To apply the change to the current terminal, source the file explicitly or close and reopen the terminal. Your shell and the kind of terminal session determine which startup file it reads; follow the setup instructions for your own system and change only the line you added.

(package-manager-and-package)=
### Package manager and package

A **package manager** installs, updates and removes software in a controlled way. Homebrew on macOS and APT on Ubuntu are package managers. A **package** is one unit of software managed this way; it may provide a command, a library or an application.

(python-environment-and-interpreter)=
## Python and notebooks

### Python environment and interpreter

A Python **interpreter** is the program that runs Python code. A Python **environment** is a project-specific place where that interpreter uses its own installed packages. A `venv` is the standard Python tool for creating such an environment. Activating it tells the current terminal to use that project's Python first.

(notebook-kernel)=
### Notebook kernel

A notebook **kernel** is the running program that executes notebook cells and keeps variables in memory. A Python interpreter selected for a script and a kernel selected for a notebook can be different, so check both when working in an editor. A kernel also has a current directory; selecting it does not guarantee that relative paths start at the project root.

(repository-and-remote)=
## Git and GitHub

### Repository and remote

A Git **repository** is a project folder together with its saved history of changes. A **remote** is a named local connection to another repository, usually represented by a URL. `origin` is a conventional name for that connection; it is a label chosen in your local repository, not the name of a special GitHub server.

(command)=
### Command, option and argument

A **command** is an instruction given to a shell, such as `pwd` or `git status`. An **option** or **flag** changes how a command behaves, often beginning with `-` or `--`. An **argument** is an input supplied to a command, such as a filename or directory.

(standard-input-output-error)=
### Standard input, output and error

**Standard input** is data read by a program, normally from the keyboard or another command. **Standard output** is normal program output, and **standard error** is diagnostic output. They are commonly abbreviated as `stdin`, `stdout` and `stderr`.

(pipe-and-redirection)=
### Pipe and redirection

A **pipe**, written `|`, sends the output of one command to the input of another. **Redirection** sends input or output to a file, using operators such as `<`, `>` and `>>`.

(exit-status)=
### Exit status

An **exit status** is the numeric result a command returns to the shell. Zero normally means success; a non-zero value normally indicates an error or another condition.

(operating-system)=
### Operating system

An **operating system** manages a computer's hardware and provides services for programs. Linux, macOS and Windows are operating systems.

(cpu-and-processor)=
### CPU and processor

The **central processing unit (CPU)**, or **processor**, executes program instructions. A CPU may contain multiple cores that can run independent tasks concurrently.

(ram-and-memory)=
### RAM and memory

**RAM** is fast temporary working space used by running programs. Its contents are normally lost when the computer shuts down. RAM is different from persistent storage such as an SSD.

(storage)=
### Storage

**Storage** is persistent space for files and programs, such as an SSD, hard drive or network drive. Storage retains data when the computer is turned off.

(file-system)=
### File system

A **file system** is the structure and set of rules an operating system uses to organise files and folders on storage.

(architecture)=
### Architecture

Computer **architecture** is the design and instruction set targeted by software, such as `x86_64` or `ARM64`. Programs and packages must be compatible with the system architecture.

(process)=
### Process

A **process** is a running instance of a program, with its own memory and system resources.

(permissions-and-executable)=
### Permissions and executable files

File **permissions** control who can read, modify or run a file. An **executable** is a program or script that the operating system is allowed to run.

(environment-variable)=
### Environment variable

An **environment variable** is a named value made available to programs started by a shell. `PATH` is one example. Commands such as `export NAME=value` set variables for the current shell and its child processes.

## Editors and development tools

(code-editor)=
### Code editor

A **code editor** is a program for writing and editing source code. Examples include VS Code, Vim and Emacs.

(ide)=
### Integrated development environment (IDE)

An **integrated development environment (IDE)** combines tools for writing, running, debugging and testing code. Examples include VS Code, RStudio, PyCharm and Visual Studio. An IDE can still use a separately selected interpreter or environment.

(integrated-terminal)=
### Integrated terminal

An **integrated terminal** is a terminal panel inside an editor such as VS Code. It still runs a shell separately from the editor itself.

(repl)=
### REPL

A **REPL** is a read-evaluate-print loop: an interactive prompt that reads code, evaluates it and displays the result. The Python prompt and R console are examples.

(debugger)=
### Debugger

A **debugger** is a tool for pausing a program, stepping through execution, inspecting variables and locating errors.

(linter-and-formatter)=
### Linter and formatter

A **linter** detects possible errors or style problems. A **formatter** automatically rewrites code into a consistent layout.

(extension-or-plugin)=
### Extension or plugin

An **extension** or **plugin** is an add-on that provides language support, debugging, notebook integration or other editor features.

(language-server)=
### Language server

A **language server** is a background service that provides features such as syntax checking, completion, documentation, navigation and refactoring.

(script-module-and-package)=
### Script, module and package

A **script** is a file intended to be run as a program. A **module** is a file or collection of code that can be imported and reused. A **package** is a collection of related modules distributed as a unit.

(dependency)=
### Dependency

A **dependency** is software that a program or project relies on, such as a Python package or an external command. Dependencies should be recorded so another person can reproduce the environment.

(pip)=
### pip

`pip` is a tool for installing and managing Python packages. Use the interpreter-bound form, such as `python -m pip`, when several Python installations may exist.

(notebook)=
### Notebook

A **notebook** is a document that combines explanatory text, executable code, visualisations and saved output. Jupyter Notebook, JupyterLab and VS Code provide notebook interfaces.

(code-cell)=
### Code cell and Markdown cell

A **code cell** contains executable code. A **Markdown cell** contains formatted explanatory text, links, equations or other documentation.

(restart)=
### Restart

To **restart** a notebook kernel is to stop and start it again. Restarting clears variables, imports and other state held in memory.

(working-tree)=
### Working tree

The **working tree** is the set of files currently checked out on disk. It can contain changes that have not yet been staged or committed.

(staging-area)=
### Staging area and index

The **staging area**, also called the **index**, is the proposed content for the next commit. `git add` places changes there; `git diff --cached` shows what is staged.

(commit)=
### Commit

A **commit** is a saved snapshot of selected project changes with a message, author and position in the repository history.

(branch)=
### Branch

A **branch** is a movable name pointing to a line of commits. Branches allow work to be developed and reviewed separately from another branch such as `main`.

(head)=
### HEAD

`HEAD` identifies the commit, branch or other revision currently checked out. `git status` reports the current `HEAD` and branch.

(clone-fetch-pull-and-push)=
### Clone, fetch, pull and push

To **clone** is to create a local repository from a remote. To **fetch** is to download remote commits without changing the current files. To **pull** usually means fetch followed by an integration step. To **push** is to send local commits to a remote.

(merge-conflict)=
### Merge conflict

A **merge conflict** occurs when Git cannot combine changes automatically, often because two changes affect the same lines. A person must choose the intended result, then stage and commit the resolution.

(gitignore)=
### `.gitignore`

`.gitignore` lists files and folders that Git should normally leave untracked, such as build output, caches, local environments and secrets. It does not stop tracking a file that was already committed.

(fork-and-pull-request)=
### Fork and pull request

A **fork** is a separate GitHub copy of a repository under another account or organisation. A **pull request** proposes changes from one branch or repository to another for review and possible merging.

(testing-and-checking-results)=
## Testing and checking results

(test-case-and-expected-result)=
```{admonition} Test case and expected result
:class: note
A **test case** is one specified input or situation together with the behaviour you expect. Work out or justify the expected result independently before comparing it with the program's observed result. A collection of test cases is a **test suite**.
```

(assertion)=
```{admonition} Assertion
:class: note
An **assertion** is an executable statement that checks whether a condition is true. In Python, `assert result == expected` passes silently when the condition is true and raises `AssertionError` when it is false. Assertions help express tests, but the person writing the test must still justify the expected result.
```

(unit-test)=
```{admonition} Unit test
:class: note
A **unit test** checks one small unit of code, usually a function, separately from the larger program. Small, focused tests make it easier to identify which behaviour broke after a change.
```

(normal-case-testing)=
```{admonition} Normal-case testing
:class: note
A **normal case** uses typical valid input and checks the main intended behaviour. It is a useful starting point, but normal cases alone often miss errors at thresholds, empty inputs, missing data or other edges.
```

(boundary-value-analysis)=
```{admonition} Boundary testing or Boundary Value Analysis (BVA)
:class: note
**Boundary testing**, also called **Boundary Value Analysis (BVA)**, checks behaviour at the edges of a rule and, where meaningful, immediately on either side. If a threshold is 10, cases such as 9, 10 and 11 can reveal whether the code uses `>` or `>=` correctly. Boundaries are defined by the problem and the function's contract: they can include empty input, an all-missing group, capacity limits, dates or the first and last permitted values—not only numeric minima and maxima.
```

(failure-case-testing)=
```{admonition} Failure-case or negative testing
:class: note
A **failure case** supplies invalid or unsupported input and checks that the program rejects it or reports the expected error clearly. This is sometimes called **negative testing**. It does not mean deliberately breaking unrelated parts of the system; it means verifying the promised response to bad input.
```

## Data and configuration

(csv-json-and-yaml)=
### CSV, JSON and YAML

**CSV** stores tabular data as rows and delimiters. **JSON** stores structured data using objects, arrays and values. **YAML** stores structured, human-readable configuration and data. Each format has different rules for quoting, nesting and data types.

(metadata)=
### Metadata

**Metadata** is information that describes other data, such as units, column meanings, provenance, collection methods or software versions.

(reproducibility)=
### Reproducibility

**Reproducibility** means that another person can repeat an analysis and obtain the same or appropriately equivalent results using the recorded code, data, environment and instructions.

(ssh-keys)=
## SSH keys

SSH uses a pair of related files to prove that you control an account. The **private key** stays on your computer and must remain secret. The **public key** can be added to GitHub. A **passphrase** protects a private key if the file is copied; it is not your GitHub password.
