.PHONY: init test check-content

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

check-content:
	.venv/bin/python -m unittest discover -s scripts -p 'test_check*.py'
	.venv/bin/python scripts/check_content.py
	.venv/bin/python scripts/check_runtime_paths.py
	.venv/bin/python scripts/check_foundational_workflows.py
