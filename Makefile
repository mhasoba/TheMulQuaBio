.PHONY: init test test-strict check-content check-notebooks execute-notebooks

REQUIREMENTS_FILE ?= requirements.txt
BOOK_CONFIG ?= content/_config.yml
BOOK_BUILD_ARGS ?=
PYTHONPATH ?= $(CURDIR)

# Create/update the local virtualenv and install python dependencies
init:
	REQUIREMENTS_FILE="$(REQUIREMENTS_FILE)" bash scripts/bootstrap.sh

# "Test" for this repository = build the Jupyter Book locally
test: check-content
	. .venv/bin/activate && PYTHONPATH="$(PYTHONPATH)" jupyter-book build content $(BOOK_BUILD_ARGS) --config "$(BOOK_CONFIG)"

test-strict: check-content execute-notebooks check-notebooks
	. .venv/bin/activate && PYTHONPATH="$(PYTHONPATH)" jupyter-book build content --all --config "$(BOOK_CONFIG)"

check-notebooks:
	.venv/bin/python scripts/check_notebook_outputs.py

execute-notebooks:
	.venv/bin/python scripts/execute_notebooks.py
	.venv/bin/python scripts/execute_notebooks.py --include-mixed content/notebooks/appendix-jupy-intro.ipynb

check-content:
	.venv/bin/python -m unittest discover -s scripts -p 'test_check*.py'
	.venv/bin/python scripts/check_content.py
	.venv/bin/python scripts/check_runtime_paths.py
	.venv/bin/python scripts/check_foundational_workflows.py
