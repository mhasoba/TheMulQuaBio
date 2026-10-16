(python-environments)=
# Python Installation and Environments

A Python [interpreter](terms.md#python-environment-and-interpreter) is the program that runs Python code. Different projects can need different package versions, so give each project its own environment. Here we use Python's built-in `venv` tool to create one, then install packages with `python -m pip` so they go to that environment's Python. Anaconda is not required; {ref}`python-conda` describes an alternative when your course or project already uses conda.

Work in your own learning project, not the downloaded MQB book repository. That repository's `.venv` and `requirements.txt` are for building the book; leave them alone. Keep your scripts, notebooks, data and results outside your project's environment directory.

(python-interpreter)=
## Choose and check an interpreter

Use the Python version specified by your course or project when one is given. Otherwise choose a stable, supported Python 3 release for which the packages you need provide compatible builds. Check the [Python release status](https://devguide.python.org/versions/); a newly released or prerelease interpreter is not automatically the best choice for an existing scientific project. Record the version you actually use.

| Platform | Route |
| :--- | :--- |
| Ubuntu/Linux | Check `python3 --version` first. Use your distribution's supported Python and `venv` package, or an institution-provided interpreter. Do not replace `/usr/bin/python3`. |
| macOS | Do not assume Python is preinstalled or suitable for coursework. Use the official [python.org installer](https://www.python.org/downloads/macos/) or the Python formula from {ref}`macos-tools`; inspect existing installations before adding another. |
| Managed machine | Use the institution's supplied interpreter or ask IT for the required packages. Administrator access is not needed just to create an environment in a writable directory. |

On Ubuntu, if Python or `venv` is missing, an authorised administrator can install the distribution packages below after reviewing {ref}`ubuntu-packages`. These are Ubuntu system-package commands, not `pip` commands:

```bash
sudo apt update
sudo apt install python3 python3-venv
```

Other distributions and separately installed Python versions may need differently named packages. Read any `ensurepip`/`venv` error rather than trying unrelated system changes.

In your terminal, check which Python will run:

```bash
command -v python3
python3 --version
python3 -c "import sys; print(sys.executable)"
```

The first and third commands should identify the Python installation you intend to use. If several versions are installed, you can use the full path of the chosen Python executable when creating the environment.

(python-venv)=
## Create and activate one environment

In your terminal, change to your **own coursework/project root**: the main folder for that piece of work, not its `code` subdirectory. Start outside another active environment (`deactivate` for `venv`, or `conda deactivate` for conda). The examples use `.venv` in this current directory. If it already exists, inspect and reuse it; do not recreate an unknown environment over the top of it.

In **Bash or zsh**, create it once:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Activation changes command lookup in the current terminal so that this project’s Python is used first. In each new terminal, return to the same project root and run **only the activation command**, not environment creation. For other shells, consult the [venv activation table](https://docs.python.org/3/library/venv.html#how-venvs-work).

Activation is optional. From the project root, you can run the environment's Python directly:

```bash
.venv/bin/python -m pip --version
.venv/bin/python -c "import sys; print(sys.executable)"
```

Use `.venv/bin/python` in place of `python` in subsequent commands when working without activation.

(python-identity)=
## Verify Python and pip agree

After activation, run these in the **terminal**, not at Python's `>>>` prompt:

```bash
python --version
python -c "import sys; print(sys.executable); print(sys.prefix); print(sys.base_prefix)"
python -m pip --version
```

For a `venv`, `sys.executable` and `sys.prefix` should point into your project’s `.venv`; these show the Python program and environment currently in use. `sys.base_prefix` identifies the underlying Python installation and should differ from `sys.prefix`. The path printed by `python -m pip --version` should also be inside that environment. A changed terminal prompt alone is not proof. A notebook or editor may select a different interpreter independently; check `sys.executable` there too.

`python -m pip` asks the Python you just inspected to run `pip`, avoiding ambiguity between separate `pip`, `pip3` and Python installations. An *externally managed environment* error normally means you are trying to modify a distributor-managed Python rather than your project environment. Check the paths and activate or recreate the intended environment; do not work around it with `sudo pip`, `--break-system-packages` or a blanket `--user` installation.

```{warning}
A virtual environment separates Python packages, not permissions. Code run inside it can still read, modify or delete files accessible to your account and use the network. It is not a security sandbox. Install packages from trusted sources and inspect unfamiliar scripts/notebooks before executing them.
```

(python-packages)=
## Install the packages you need

Once these commands all identify the intended environment, install the small starting set for the Python lessons:

```bash
python -m pip install numpy matplotlib ipython
python -m pip check
python -c "import numpy, matplotlib; print(numpy.__version__); print(matplotlib.__version__)"
```

Add packages such as `scipy` or `pandas` when the relevant lesson requires them. Use a project's supplied dependency file when available instead of choosing unrelated versions. Installing packages downloads and runs third-party software; follow institutional network and package-source policies. If an install tries to compile a package, check interpreter/architecture support and available wheels before installing a large compiler toolchain.

To enter IPython, run `ipython` in the activated terminal; `exit()` returns to the shell. Run coursework scripts with `python code/script_name.py`, substituting your actual filename and respecting any working-directory requirements stated by the lesson.

(python-jupyter-install)=
## Add a Jupyter interface

Choose **one** interface initially. These commands assume the same activated, verified environment:

| Interface | Install | Launch |
| :--- | :--- | :--- |
| Jupyter Notebook 7 or newer | `python -m pip install notebook ipykernel` | `python -m notebook` |
| JupyterLab | `python -m pip install jupyterlab ipykernel` | `python -m jupyterlab` |

Notebook is a focused notebook interface; JupyterLab adds a tabbed workspace for notebooks, editors and terminals. Both use [kernels](terms.md#notebook-kernel) to run code. They can coexist, but neither requires installing the other as a separate course step. Old classic-Notebook extensions are not a reason to install both.

Continue with the [Jupyter appendix](../notebooks/appendix-jupy-intro.ipynb) for launching from your coursework directory, selecting and checking a kernel, saving work and shutting down. Installing into the environment does not select that environment in every editor or existing notebook server.

(python-recreate)=
## Record and recreate an environment

Keep `.venv/` out of version control, adding an ignore entry if needed. Keep notebooks, code, input data and generated results elsewhere. Environment directories are generally not portable between machines, paths or operating systems; recreate them instead of copying or committing them.

From your project root and active environment, record the package versions under an **unused filename** (shell redirection overwrites an existing file):

```bash
python -m pip freeze > requirements-coursework.txt
python --version
```

Review the file before sharing: it can contain local paths or private package URLs. Record the Python version, operating system, relevant external tools and direct dependencies alongside it. `pip freeze` is a snapshot, not a cross-platform lockfile or a guarantee that an analysis is reproducible.

Try recreating the environment alongside the original, using the **same chosen base interpreter** and a new name such as `.venv-recreated`. After recording dependencies:

```bash
deactivate
python3 -m venv .venv-recreated
source .venv-recreated/bin/activate
python -m pip install -r requirements-coursework.txt
python -m pip check
```

If `python3` now names a different base interpreter, use the original interpreter's path instead. Repeat the Python, pip and import checks above, then run a small trusted script or notebook before retiring the old environment. Keep the dependency record in your project; it is not the MQB book-build requirements file.

When finished, `deactivate` leaves the current `venv` without deleting it or stopping running notebooks. To remove an obsolete environment, first stop its kernels/servers, confirm the exact directory contains only the disposable environment, then remove that directory using your file manager. Do not delete a whole coursework folder. Remove obsolete kernel registrations separately as explained in the Jupyter appendix.

(python-conda)=
## Optional conda route

Use this **instead of** the `venv` route when your course/project already has a conda specification or needs conda-managed native libraries. Follow the current [conda installation guide](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html), choosing an installer for your OS and architecture and reviewing distribution/channel terms. A full Anaconda distribution is not compulsory. Do not paste old `/usr/local/anaconda3` PATH commands into multiple startup files.

In a terminal where conda is available, first use `conda env list` and choose an unused environment name. For a new project without its own specification:

```bash
conda create --name mqb-course python numpy matplotlib ipython
conda activate mqb-course
python -c "import sys; print(sys.executable)"
conda list
```

Review the solver's Python version and package plan before confirming; use the version required by your project when specified. Do not install coursework packages into `base` or nest an activated `venv` inside conda. Use `conda install notebook ipykernel` or `conda install jupyterlab ipykernel` in the chosen environment for Jupyter. If pip is genuinely needed, install `pip` into that environment with conda and use `python -m pip`; follow conda's [guidance on mixing package managers](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html#using-pip-in-an-environment). Prefer recreating an environment to repeatedly alternating conda and pip mutations.

Use `conda deactivate` when finished. For sharing/recreation, follow conda's environment export documentation; a conda environment file records information that `pip freeze` cannot capture.

(python-setup-resources)=
## Further reading

- [PyPA pip and virtual environments guide](https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/).
- [Python's venv documentation](https://docs.python.org/3/library/venv.html).
- [Externally managed Python environments](https://packaging.python.org/en/latest/specifications/externally-managed-environments/).
- [Jupyter installation](https://jupyter.org/install).

See {ref}`setup-attribution` for the adapted material's attribution, licence and limits of the setup checks.