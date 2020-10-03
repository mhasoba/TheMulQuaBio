# The Multilingual Quantitative Biologist

This repository contains the source code for the **The Multilingual Quantitative Biologist** online book.

All code in this project was written in and tested with R 3.xx and Python 3.xx, though older language versions (including R 2.xx and Python 2.7) should work in most cases.

## Usage

### Building the book

If you'd like to develop on and build the Multilingual Quantitative Biologist book, you should:

- Clone this repository and run
- Run `pip install -r requirements.txt` (it is recommended you do this within a virtual environment)
- (Recommended) Remove the existing `The Multilingual Quantitative Biologist/_build/` directory
- Run `jupyter-book build The Multilingual Quantitative Biologist/`

A fully-rendered HTML version of the book will be built in `_build/html/`.

### Hosting the book

The html version of the book is hosted on the `gh-pages` branch of this repo. A GitHub actions workflow has been created that automatically builds and pushes the book to this branch on a push or pull request to master.

If you wish to disable this automation, you may remove the GitHub actions workflow and build the book manually by:

- Navigating to your local build; and running,
- `ghp-import -n -p -f The Multilingual Quantitative Biologist/_build/html`

This will automatically push your build to the `gh-pages` branch. More information on this hosting process can be found [here](https://jupyterbook.org/publish/gh-pages.html#manually-host-your-book-with-github-pages).

## Contributors

We welcome and recognize all contributions. You can see a list of current contributors in the [contributors tab](https://github.com/mhasoba/TheMulQuaBio/graphs/contributors).Also, note that:

* The `master` branch of this repository is protected, so even users with write (push) access need to push changes on a branch and make a [pull request](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-pull-requests) (also, see [this](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)). New commits to a non-master branch *after* a pull request has been made will result in any pull requests from that non-master branch to be discrded. Please [read this](https://gist.github.com/digitaljhelms/4287848) for good practices for branching (and merging).     
* Old materials, written in LaTeX, are now in the `archived` directory.
* The solutions to the exercises are in a separate, [private git repo](https://bitbucket.org/mhasoba/themulquabio_sols) that students do not have access to. Ask Samraat (mhasoba@gmail.com) if you need access to that repository. Students will be provided the solutions when the time comes.
* The `results` directory will be populated only when scripts are run, but these are not version controlled (all files in this directory under `.gitignore`).


## Credits

This project is created using the excellent open source [Jupyter Book project](https://jupyterbook.org/) and the [executablebooks/cookiecutter-jupyter-book template](https://github.com/executablebooks/cookiecutter-jupyter-book).
