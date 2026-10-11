"""Focused tests for the runtime-path convention checker."""

import tempfile
import unittest
from pathlib import Path

import nbformat
import yaml

from check_runtime_paths import check_runtime_paths


class CheckRuntimePathsTests(unittest.TestCase):
    def make_book(self, root: Path) -> Path:
        book = root / "content"
        (book / "notebooks").mkdir(parents=True)
        (book / "code").mkdir()
        (book / "lectures" / "example").mkdir(parents=True)
        (book / "_toc.yml").write_text("root: intro\nchapters:\n- file: notebooks/example\n")
        (book / "intro.md").write_text("# Introduction\n")
        return book

    def write_notebook(self, book: Path, cells) -> None:
        notebook = nbformat.v4.new_notebook(
            cells=cells,
            metadata={"kernelspec": {"name": "python3", "display_name": "Python"}},
        )
        nbformat.write(notebook, book / "notebooks" / "example.ipynb")

    def write_exceptions(self, root: Path, entries) -> Path:
        path = root / "exceptions.yml"
        path.write_text(yaml.safe_dump({"exceptions": entries}, sort_keys=False))
        return path

    def test_root_paths_links_and_explanatory_prose_are_accepted(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            book = self.make_book(root)
            self.write_notebook(book, [
                nbformat.v4.new_markdown_cell(
                    "Download [data](../data/example.csv). The function `setwd()` changes directory."
                ),
                nbformat.v4.new_code_cell("open('data/example.csv')\nopen('results/output.csv', 'w')"),
            ])
            exceptions = self.write_exceptions(root, [])
            self.assertEqual(check_runtime_paths(book, exceptions), [])

    def test_code_fences_named_scripts_and_qmd_are_checked(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            book = self.make_book(root)
            self.write_notebook(book, [
                nbformat.v4.new_markdown_cell(
                    "Use `analysis.py`.\n\n```python\nopen('../data/example.csv')\n```"
                ),
            ])
            (book / "code" / "analysis.py").write_text("open('../results/output.csv', 'w')\n")
            (book / "code" / "unmentioned.py").write_text("open('../data/ignored.csv')\n")
            (book / "lectures" / "example" / "slides.qmd").write_text(
                "```{python}\nopen('../data/from-slides.csv')\n```\n"
            )
            exceptions = self.write_exceptions(root, [])
            problems = check_runtime_paths(book, exceptions)
            self.assertEqual(len(problems), 3)
            self.assertTrue(any("example.csv" in problem for problem in problems))
            self.assertTrue(any("output.csv" in problem for problem in problems))
            self.assertTrue(any("from-slides.csv" in problem for problem in problems))
            self.assertFalse(any("ignored.csv" in problem for problem in problems))

    def test_exact_exception_is_consumed_and_stale_exception_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            book = self.make_book(root)
            self.write_notebook(book, [nbformat.v4.new_code_cell("setwd('../code/')")])
            entries = [
                {
                    "location": "notebooks/example.ipynb:cell 1",
                    "rule": "working_directory_change",
                    "value": "setwd(",
                    "count": 1,
                    "reason": "Legacy lesson awaiting migration.",
                    "owner": "Example owner",
                    "target_phase": "Phase 3",
                },
                {
                    "location": "notebooks/example.ipynb:cell 1",
                    "rule": "parent_project_path",
                    "value": "../code/",
                    "count": 1,
                    "reason": "Legacy lesson awaiting migration.",
                    "owner": "Example owner",
                    "target_phase": "Phase 3",
                },
            ]
            exceptions = self.write_exceptions(root, entries)
            self.assertEqual(check_runtime_paths(book, exceptions), [])

            self.write_notebook(book, [nbformat.v4.new_code_cell("getwd()")])
            problems = check_runtime_paths(book, exceptions)
            self.assertEqual(len(problems), 2)
            self.assertTrue(all("stale exception" in problem for problem in problems))

    def test_exception_metadata_and_machine_paths_are_checked(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            book = self.make_book(root)
            self.write_notebook(book, [
                nbformat.v4.new_code_cell("open('/home/alice/project/data.csv')"),
            ])
            exceptions = self.write_exceptions(root, [{"location": "incomplete"}])
            problems = check_runtime_paths(book, exceptions)
            self.assertEqual(len(problems), 2)
            self.assertTrue(any("missing" in problem for problem in problems))
            self.assertTrue(any("machine_specific_absolute_path" in problem for problem in problems))


if __name__ == "__main__":
    unittest.main()
