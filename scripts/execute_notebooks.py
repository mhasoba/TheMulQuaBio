#!/usr/bin/env python3
"""Execute TOC notebooks in place, rejecting unexpected cell errors."""

from __future__ import annotations

import argparse
import copy
import os
from pathlib import Path

import nbformat
from nbclient import NotebookClient

from notebook_tools import (
    CONTENT_ROOT,
    REPOSITORY_ROOT,
    cell_errors,
    cell_tags,
    kernel_name,
    toc_notebooks,
)


DEFAULT_EXCLUDES = {"content/notebooks/appendix-jupy-intro.ipynb"}
MIXED_NOTEBOOK = "content/notebooks/appendix-jupy-intro.ipynb"
MIXED_CELL_KERNELS = {13: "python3", 16: "ir", 18: "python3", 20: "ir"}
NOTEBOOK_DIRECTORY_CWD = {
    "content/notebooks/appendix-mathsforbiologists/maths-for-biologists.ipynb"
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("notebooks", nargs="*", type=Path, help="specific notebooks to execute")
    parser.add_argument("--kernel", action="append", help="execute only this kernel (repeatable)")
    parser.add_argument("--timeout", type=int, default=180, help="per-cell timeout in seconds")
    parser.add_argument("--include-mixed", action="store_true", help="include the mixed-language appendix")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--normalize-only", action="store_true", help="remove transient execution metadata")
    return parser.parse_args()


def selected_notebooks(args: argparse.Namespace) -> list[Path]:
    if args.notebooks:
        paths = [path if path.is_absolute() else REPOSITORY_ROOT / path for path in args.notebooks]
    else:
        paths = toc_notebooks()

    selected: list[Path] = []
    for path in paths:
        relative = path.relative_to(REPOSITORY_ROOT).as_posix()
        if not args.include_mixed and relative in DEFAULT_EXCLUDES:
            print(f"skip {relative}: mixed Python/R teaching notebook")
            continue
        notebook = nbformat.read(path, as_version=4)
        if not any(cell.cell_type == "code" for cell in notebook.cells):
            print(f"skip {relative}: no code cells")
            continue
        if args.kernel and kernel_name(notebook) not in args.kernel:
            continue
        selected.append(path)
    return selected


def execute(path: Path, timeout: int) -> list[str]:
    relative = path.relative_to(REPOSITORY_ROOT).as_posix()
    if relative == MIXED_NOTEBOOK:
        return execute_mixed(path, timeout)

    notebook = nbformat.read(path, as_version=4)
    original_tags = [cell_tags(cell) for cell in notebook.cells]
    execution_root = path.parent if relative in NOTEBOOK_DIRECTORY_CWD else CONTENT_ROOT
    client = NotebookClient(
        notebook,
        timeout=timeout,
        allow_errors=True,
        resources={"metadata": {"path": str(execution_root)}},
        skip_cells_with_tag="skip-execution",
    )
    client.execute(cwd=str(execution_root))

    failures: list[str] = []
    for index, cell in enumerate(notebook.cells):
        errors = cell_errors(cell)
        if errors and "raises-exception" not in original_tags[index]:
            for error in errors:
                failures.append(
                    f"cell {index}: {error.get('ename', 'Error')}: {error.get('evalue', '')}"
                )

    if not failures:
        strip_transient_metadata(notebook)
        nbformat.write(notebook, path)
    return failures


def execute_mixed(path: Path, timeout: int) -> list[str]:
    """Execute the introductory notebook's Python and R cells in their own kernels."""
    notebook = nbformat.read(path, as_version=4)
    failures: list[str] = []

    for kernel in ("python3", "ir"):
        working = copy.deepcopy(notebook)
        working.metadata.kernelspec = {
            "display_name": "Python 3" if kernel == "python3" else "R",
            "language": "python" if kernel == "python3" else "R",
            "name": kernel,
        }
        for index, cell in enumerate(working.cells):
            if cell.cell_type == "code" and MIXED_CELL_KERNELS.get(index) != kernel:
                tags = list(cell.metadata.get("tags", []))
                if "skip-execution" not in tags:
                    tags.append("skip-execution")
                cell.metadata["tags"] = tags

        client = NotebookClient(
            working,
            timeout=timeout,
            allow_errors=False,
            resources={"metadata": {"path": str(CONTENT_ROOT)}},
            skip_cells_with_tag="skip-execution",
        )
        try:
            client.execute(cwd=str(CONTENT_ROOT))
        except Exception as error:  # nbclient provides the cell traceback in the message
            failures.append(f"{kernel}: {error}")
            continue

        for index, expected_kernel in MIXED_CELL_KERNELS.items():
            if expected_kernel == kernel:
                notebook.cells[index].execution_count = working.cells[index].execution_count
                notebook.cells[index].outputs = working.cells[index].outputs

    if not failures:
        strip_transient_metadata(notebook)
        nbformat.write(notebook, path)
    return failures


def strip_transient_metadata(notebook: nbformat.NotebookNode) -> None:
    """Remove timestamps that make otherwise identical executions produce noisy diffs."""
    for cell in notebook.cells:
        cell.metadata.pop("execution", None)


def main() -> int:
    args = parse_args()
    os.chdir(REPOSITORY_ROOT)
    paths = selected_notebooks(args)
    print(f"selected {len(paths)} notebook(s)")
    if args.normalize_only:
        for path in paths:
            notebook = nbformat.read(path, as_version=4)
            strip_transient_metadata(notebook)
            nbformat.write(notebook, path)
            print(f"normalized {path.relative_to(REPOSITORY_ROOT)}")
        return 0
    if args.dry_run:
        for path in paths:
            print(path.relative_to(REPOSITORY_ROOT))
        return 0

    failed = False
    for path in paths:
        relative = path.relative_to(REPOSITORY_ROOT)
        print(f"execute {relative}", flush=True)
        failures = execute(path, args.timeout)
        if failures:
            failed = True
            print(f"FAILED {relative}; source notebook was not changed")
            for failure in failures:
                print(f"- {failure}")
        else:
            print(f"updated {relative}")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
