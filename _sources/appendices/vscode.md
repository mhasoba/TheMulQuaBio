(vscode-setup)=
# VS Code for MQB

Visual Studio Code (VS Code) is a multilingual editor that can work with Python scripts, R scripts, terminals and Jupyter notebooks in one project folder. It is an option, not a requirement: use RStudio where that better suits your R work. This page assumes that you already have the Python environment from {ref}`python-environments` and, for R, a working installation from {ref}`r-setup`.

## Before you start

Keep each piece of coursework or project in its own folder, containing its code, data and results. Do not open the MQB book source or a `code` subfolder when you mean to work on a whole project: opening the [project root](terms.md#project-root) makes relative paths and the integrated terminal easier to understand. Unless an exercise explicitly says otherwise, run scripts from that root and use paths such as `data/input.csv` and `results/output.csv`.

These are separate things:

- the **integrated terminal** runs shell commands such as `python script.py` or `R`;
- a language **REPL** (read-eval-print loop) is an interactive Python or R session in that terminal: you enter one command, it runs, and you see the result; and
- a notebook **kernel** executes cells in an `.ipynb` file.

Selecting a Python interpreter does not automatically select an existing notebook kernel, and launching an R terminal does not create an R notebook kernel.

## Install VS Code and open a project

1. Install the current stable [Visual Studio Code](https://code.visualstudio.com/download) for your operating system, or use the version provided on a managed course machine. Do not use an administrator account merely to install extensions for your own account.
2. Start VS Code and choose **File → Open Folder…**. Select the root of a disposable practice project or your own coursework project.
3. Open **Terminal → New Terminal** and check where it starts:

   ```bash
   pwd
   ```

   On Windows PowerShell, use `Get-Location`. If this is not the folder you opened, use the terminal's `cd` command deliberately rather than assuming an editor button has changed every process's directory.
4. When VS Code asks whether you trust a folder, trust only work you obtained from a course, collaborator or source you understand. Restricted Mode can prevent extensions, tasks and debugging configurations from running unfamiliar code. Do not make a folder globally trusted just to remove the prompt.

Install only the extensions that you need from the Extensions view. For MQB, the usual minimum is:

| Work | Extension |
| --- | --- |
| Python scripts | **Python** by Microsoft |
| Jupyter notebooks | **Jupyter** by Microsoft |
| R scripts | **R** by REditorSupport (`REditorSupport.r`) |

The Python and Jupyter extensions may offer supporting extensions. Accept only the publisher-verified prompts that you understand. The R extension already integrates language-service support; do not install the obsolete separate `vscode-R-lsp` extension alongside it.

## Use VS Code as a Git GUI

VS Code's built-in Git support uses the same Git installation and repository as the terminal; no additional Git extension is required for this basic workflow. Install and configure Git first using {ref}`git-ssh-setup`. Open the project root, then select **Source Control** in the Activity Bar or run **View: Show Source Control** from the Command Palette.

The Source Control view lists changed files. Select a file to inspect its diff: removed lines appear on one side and added lines on the other. Stage only the files you intend to include in the next commit by selecting the **+** beside each file. Review the files under **Staged Changes** before entering a commit message and selecting **Commit**. A commit records changes locally; it does not upload them.

Before sharing work, check the current branch in the status bar and make sure the intended remote is configured. Use the Source Control **…** menu or status-bar controls to push or pull. A **Sync Changes** control may both pull and push; it is not just “save”. Pulling can bring in other commits and may produce conflicts; commit or deliberately set aside your own work first, and inspect any conflicts before continuing. See the [Git chapter](../notebooks/git.ipynb) for the underlying concepts and practice workflow.

:::{figure-md} vscode-source-control

```{image} ../images/vscode-source-control.png
:alt: VS Code Source Control view showing staged and unstaged files beside a side-by-side diff.
:width: 100%
```

**Source Control view and diff editor.** <small>(Source: [VS Code documentation](https://code.visualstudio.com/docs/sourcecontrol/overview); screenshot licensed under [CC BY 3.0 US](https://creativecommons.org/licenses/by/3.0/us/).)</small>

:::

## Python scripts: select, run and debug

Create or activate a project environment using {ref}`python-venv` before selecting it in VS Code. Open a `.py` file, then select the interpreter shown in the status bar (the strip along the bottom of the window) or run **Python: Select Interpreter** from the Command Palette (VS Code’s searchable command menu). Choose the `.venv` belonging to the project, not simply the first Python version in the list.

Check the selected interpreter in both the editor and a new integrated terminal:

```python
import sys
print(sys.executable)
print(sys.prefix)
```

The displayed executable should be inside the intended `.venv`. Also run `python -m pip --version` in the terminal; it should name that same environment. If it does not, return to {ref}`python-identity` rather than installing packages into an uncertain interpreter.

Use the editor's Python run control for a small script, then make the working directory explicit in your explanation of any input paths. To inspect a fault, set a breakpoint in the left margin and choose **Python Debugger: Debug Python File**, or use **Run and Debug**. The debugger normally uses the selected interpreter. A `launch.json` is optional; do not copy a generic configuration until you know why the script needs it.

## Jupyter notebooks: choose a kernel deliberately

With the Microsoft Jupyter extension installed, open an existing `.ipynb` file or create a new notebook. A [kernel](terms.md#notebook-kernel) is the program that will run its cells. Select **Select Kernel** in the notebook’s upper-right corner, then choose the intended entry under **Python Environments** or **Jupyter Kernels**. A remembered kernel is a convenience, not evidence that it is correct for a new project.

Run this in the first Python cell:

```python
import sys
print(sys.executable)
print(sys.prefix)
```

Compare the result with the project interpreter selected for scripts. If it is wrong, use **Notebook: Select Notebook Kernel** and choose again. A Python environment can be offered as a notebook kernel without installing a separate browser Jupyter server into that environment; use {ref}`python-jupyter-install` only when you need the browser Notebook or JupyterLab interface.

Save notebooks before switching kernels or closing VS Code. A kernel may continue to hold variables until it is restarted or stopped, so rerun the notebook from a clean kernel before treating an analysis as reproducible. See {ref}`jupyter-kernels` for named Python kernels and R notebook kernels.

An open project folder, integrated terminal and notebook kernel can report different current directories. Run `Path.cwd()` in Python or `getwd()` in R and follow the notebook's stated starting-directory instructions. Do not assume that selecting a kernel has moved it to the project root.

## Using R in VS Code

This route requires R to be installed and usable before VS Code is involved. In the integrated terminal, check:

```bash
R --version
```

Install the **R** extension by REditorSupport. In an R console using the intended R installation, install its language-service package in your user library:

```r
install.packages("languageserver")
```

The extension may ask to install or update its session-support package; read the package prompt before accepting. `languageserver` provides code analysis, completion and diagnostics. It does not run your analysis or replace a working R session.

Open an `.R` file, run **R: Create R Terminal** from the Command Palette, and check the session before sending coursework code to it:

```r
R.home()
.libPaths()
Sys.which("R")
```

Use the extension command for running the selected line(s) or selection, or source a known script explicitly:

```r
source("code/example.R")
plot(cars)
?mean
```

The R extension can expose workspace, plot and help views when it is connected to the R terminal. Check a plot and an object before relying on those views; the exact layout depends on the extension version and session state. Ordinary plots do not require `httpgd`. `httpgd` is optional for an interactive viewer, and `radian` is optional; neither is required for MQB.

If **R: Create R Terminal** cannot find R, first run `R --version` in the VS Code integrated terminal. On Windows, the extension normally discovers a standard CRAN installation from the registry. Only if that fails, set the documented `r.rterm.windows` value to the exact `R.exe` path, for example:

```json
{
  "r.rterm.windows": "C:\\Program Files\\R\\R-4.3.3\\bin\\x64\\R.exe"
}
```

Use your installed version and path; do not paste the example unchanged. On macOS or Linux, resolve the path visible to VS Code's terminal before adding any extension setting. See {ref}`r-setup` for installation and user-library troubleshooting.

R debugging is separate from the R language extension and needs its own supported debugger and prerequisites. Do not claim a script has been debugged merely because it ran. An R `.ipynb` notebook uses an IRkernel chosen in the notebook kernel picker; it is distinct from sending code to an `.R` terminal.

## A small setup check

Before beginning assessed work, use a scratch project with synthetic data:

1. Open the project root and verify the terminal location.
2. Run a short Python script using the selected project interpreter and print `sys.executable`.
3. Open a small notebook, select its kernel and print `sys.executable` again.
4. If using R, create an R terminal, inspect `R.home()` and `.libPaths()`, source a small script and view a simple plot.

If any of these checks identifies a different interpreter, R installation or working directory than expected, stop and correct that mismatch before installing packages or running coursework. Record the OS, VS Code version, interpreter/R version and relevant extensions when reporting a setup problem to teaching staff.

(vscode-setup-resources)=
## Sources and verification

Adapted from the FoNS [VS Code guidance](https://imperial-fons-computing.github.io/vscode.html); see {ref}`setup-attribution` for the source revision and licence. MQB revision: 30 September 2026.

Operational references: [VS Code installation](https://code.visualstudio.com/docs/setup/setup-overview), [workspace trust](https://code.visualstudio.com/docs/editing/workspaces/workspace-trust), [Python in VS Code](https://code.visualstudio.com/docs/languages/python), [Python environments](https://code.visualstudio.com/docs/python/environments), [Jupyter kernel selection](https://code.visualstudio.com/docs/datascience/jupyter-kernel-management), [Python debugging](https://code.visualstudio.com/docs/python/debugging), and the [REditorSupport R extension](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r).

Verified locally on Linux on 30 September 2026: VS Code 1.139.1 and R 4.3.3 were available. No extension was installed into the maintainer's editor profile, and no graphical editor, macOS, Windows or R-notebook workflow was runtime-tested. Check current official support and extension requirements on your own platform.
