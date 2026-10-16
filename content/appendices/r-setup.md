(r-setup)=
# R Installation and User Libraries

R is the program that runs R code. `R` opens an interactive console; `Rscript` runs a saved script from a terminal. RStudio and Visual Studio Code are optional editors: neither installs nor replaces R itself.

If you are using a managed course computer, use its installed R first. Do not reinstall or upgrade managed software during a class unless teaching staff ask you to.

## Check before installing

Open a terminal and run:

```bash
R --version
Rscript --version
```

If both commands report a version, continue to {ref}`r-setup-check`. If an editor cannot find R but these commands work, fix the editor configuration rather than installing a second copy.

## Install R

Use the official [Comprehensive R Archive Network (CRAN)](https://cran.r-project.org/) downloads.

- **macOS:** use [R for macOS](https://cran.r-project.org/bin/macosx/) and choose the installer that matches your Mac and supported macOS version. Open a new terminal afterwards.
- **Ubuntu:** follow the [CRAN Ubuntu instructions](https://cran.r-project.org/bin/linux/ubuntu/) when you need CRAN's current release. On a managed machine, ask the administrator. For a simple distribution-provided installation on a machine you administer, `sudo apt update` followed by `sudo apt install r-base` is sufficient, but the Ubuntu release may provide an older R version. See {ref}`ubuntu-admin` before changing repositories or system packages.

Install R before an editor. If you want RStudio Desktop, use the current [Posit download page](https://posit.co/download/rstudio-desktop/) and check its [supported platforms](https://docs.posit.co/platform-support.html). For VS Code, follow {ref}`vscode-setup` after the terminal checks above work.

## Install packages without running R as administrator

R searches one or more package libraries. Inspect them in the R console:

```r
.libPaths()
Sys.getenv("R_LIBS_USER")
```

Install course packages from an ordinary R session:

```r
install.packages("package_name", repos = "https://cloud.r-project.org")
```

If R asks to create a personal library, answer **yes**. This is the normal, recommended location for packages that belong to your account. If needed, create R's default user-library directory and restart R:

```r
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
```

Do **not** start R with `sudo`, and do not make a system library writable to everyone. Administrator access may be needed to install R itself or a missing operating-system development library, but it is not the normal way to install an R package. If an installation fails, read the error before adding compilers or system libraries; it should identify the missing requirement.

(r-setup-check)=
## Run a clean project check

Create a disposable folder with `code`, `data`, and `results` subfolders. Save this as `code/r_setup_check.R`:

```r
cat(R.version.string, "\n")
cat("Working directory:", getwd(), "\n")
cat("First library:", .libPaths()[1], "\n")

dir.create("results", showWarnings = FALSE)
png("results/r_setup_check.png", width = 640, height = 480)
plot(cars, main = "R setup check")
dev.off()

stopifnot(file.exists("results/r_setup_check.png"))
cat("R setup check passed\n")
```

In a terminal, change to the **project root**, then run:

```bash
Rscript code/r_setup_check.R
```

The command should print `R setup check passed` and create `results/r_setup_check.png`. This is MQB's default script convention: start at the project root unless an exercise explicitly names another directory. Paths such as `data/input.csv` and `results/figure.png` are then portable. Do not put a computer-specific `setwd()` in a shared script.

## When something goes wrong

When asking for help, copy the exact error and report your operating system plus the output of:

```r
R.version.string
R.home()
.libPaths()
Sys.which(c("R", "Rscript"))
```

Also say whether the failure occurs in a terminal, RStudio, VS Code, or a notebook. An R notebook additionally needs the separate {ref}`jupyter-r-kernel`; a Python environment does not install or isolate R packages.

## Further reading

- [R installation and administration manual](https://cran.r-project.org/doc/manuals/r-release/R-admin.html).
- [RStudio IDE user guide](https://docs.posit.co/ide/user/).
- [Posit's supported platforms](https://docs.posit.co/platform-support.html).

Use the linked current installation instructions if their screens differ. The project check above uses base R and does not depend on an editor.
