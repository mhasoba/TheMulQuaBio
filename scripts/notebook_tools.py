"""Shared helpers for executing and auditing notebooks in the Jupyter Book TOC."""

from __future__ import annotations

import json
from collections.abc import Iterator
from pathlib import Path
from typing import Any

import yaml


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
CONTENT_ROOT = REPOSITORY_ROOT / "content"
TOC_PATH = CONTENT_ROOT / "_toc.yml"


def _walk_toc(node: Any) -> Iterator[str]:
    if isinstance(node, dict):
        file_ref = node.get("file")
        if isinstance(file_ref, str):
            yield file_ref
        for value in node.values():
            yield from _walk_toc(value)
    elif isinstance(node, list):
        for value in node:
            yield from _walk_toc(value)


def toc_notebooks() -> list[Path]:
    """Return the existing notebook sources referenced by the book TOC."""
    toc = yaml.safe_load(TOC_PATH.read_text(encoding="utf-8"))
    notebooks: list[Path] = []
    seen: set[Path] = set()
    for reference in _walk_toc(toc):
        source = CONTENT_ROOT / reference
        candidates = [source] if source.suffix else [source.with_suffix(".ipynb")]
        for candidate in candidates:
            if candidate.suffix == ".ipynb" and candidate.exists() and candidate not in seen:
                notebooks.append(candidate)
                seen.add(candidate)
    return notebooks


def load_notebook(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def kernel_name(notebook: dict[str, Any]) -> str:
    return notebook.get("metadata", {}).get("kernelspec", {}).get("name", "")


def cell_tags(cell: dict[str, Any]) -> set[str]:
    return set(cell.get("metadata", {}).get("tags", []))


def cell_errors(cell: dict[str, Any]) -> list[dict[str, Any]]:
    return [
        output
        for output in cell.get("outputs", [])
        if output.get("output_type") == "error"
    ]
