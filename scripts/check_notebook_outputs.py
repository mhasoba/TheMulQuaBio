#!/usr/bin/env python3
"""Audit stored outputs for notebooks included in the book."""

from __future__ import annotations

from collections import Counter

from notebook_tools import cell_errors, cell_tags, kernel_name, load_notebook, toc_notebooks


def main() -> int:
    failures: list[str] = []
    kernels: Counter[str] = Counter()
    notebook_count = code_count = output_count = 0

    for path in toc_notebooks():
        notebook_count += 1
        notebook = load_notebook(path)
        kernels[kernel_name(notebook) or "missing"] += 1

        for index, cell in enumerate(notebook.get("cells", [])):
            if cell.get("cell_type") != "code":
                continue
            code_count += 1
            outputs = cell.get("outputs", [])
            output_count += len(outputs)
            tags = cell_tags(cell)
            location = f"{path.relative_to(path.parents[2])}:cell-{index}"

            if outputs and cell.get("execution_count") is None and "skip-execution" not in tags:
                failures.append(f"{location}: stored output has a null execution count")

            errors = cell_errors(cell)
            if errors and "raises-exception" not in tags:
                names = ", ".join(error.get("ename", "unknown error") for error in errors)
                failures.append(f"{location}: unexpected stored error ({names})")

            if "output-required" in tags and not outputs:
                failures.append(f"{location}: output-required cell has no stored output")

    kernel_summary = ", ".join(f"{name}={count}" for name, count in sorted(kernels.items()))
    print(
        f"audited {notebook_count} TOC notebooks, {code_count} code cells, "
        f"and {output_count} outputs ({kernel_summary})"
    )
    if failures:
        print("notebook output audit failed:")
        for failure in failures:
            print(f"- {failure}")
        return 1
    print("notebook output audit passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
