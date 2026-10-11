"""Check working-directory assumptions in active teaching code.

The check covers executable notebook cells and fences, named supplied scripts,
and Quarto lecture fences. Inline prose and documentation links stay under the
content/link audit so that a valid source-relative download is not mistaken for
a runtime path.
"""

from __future__ import annotations

import argparse
import re
from collections import Counter
from pathlib import Path

import nbformat
import yaml
from markdown_it import MarkdownIt

from check_content import book_pages


EXECUTABLE_FENCES = {"bash", "console", "py", "python", "r", "sh", "shell", "sql", "zsh"}
SCRIPT_EXTENSIONS = {".py", ".r", ".sh", ".sql"}
RULES = {
    "parent_project_path": re.compile(
        r"(?<![\w/])\.\./(?:data|results|code)(?:/[\w./{}<>-]*)?",
        re.IGNORECASE,
    ),
    "working_directory_change": re.compile(r"\b(?:setwd|(?:os\.)?chdir)\s*\("),
    "machine_specific_absolute_path": re.compile(
        r"(?<![:\w])(?:/(?:home|Users)/[\w.-]+(?:/[\w .-]+)*|[A-Za-z]:[\\/](?:Users|Documents)[\\/][\w .-]+(?:[\\/][\w .-]+)*)"
    ),
}
MARKDOWN = MarkdownIt()


def markdown_fences(text: str):
    number = 0
    for token in MARKDOWN.parse(text):
        if token.type != "fence":
            continue
        language = token.info.strip().split(maxsplit=1)[0].lower() if token.info.strip() else ""
        language = language.strip("{}")
        if language not in EXECUTABLE_FENCES:
            continue
        number += 1
        yield number, token.content


def active_blocks(book: Path):
    pages, toc_problems = book_pages(book)
    if toc_problems:
        raise ValueError("; ".join(toc_problems))

    combined_source = []
    for page in pages:
        relative = page.relative_to(book)
        if page.suffix == ".ipynb":
            notebook = nbformat.read(page, as_version=4)
            for index, cell in enumerate(notebook.cells, start=1):
                if cell.cell_type not in ("code", "markdown"):
                    continue
                combined_source.append(cell.source)
                if cell.cell_type == "code":
                    yield f"{relative}:cell {index}", cell.source
                else:
                    for fence, content in markdown_fences(cell.source):
                        yield f"{relative}:cell {index}:fence {fence}", content
            continue

        text = page.read_text(encoding="utf-8")
        combined_source.append(text)
        for fence, content in markdown_fences(text):
            yield f"{relative}:fence {fence}", content

    all_text = "\n".join(combined_source)
    code_dir = book / "code"
    if code_dir.is_dir():
        for script in sorted(code_dir.iterdir()):
            if not script.is_file() or script.suffix.lower() not in SCRIPT_EXTENSIONS:
                continue
            if not re.search(rf"(?<![\w.-]){re.escape(script.name)}(?![\w.-])", all_text):
                continue
            yield str(script.relative_to(book)), script.read_text(encoding="utf-8", errors="replace")

    lectures = book / "lectures"
    if lectures.is_dir():
        for source in sorted(lectures.rglob("*.qmd")):
            text = source.read_text(encoding="utf-8")
            for fence, content in markdown_fences(text):
                yield f"{source.relative_to(book)}:fence {fence}", content


def findings(book: Path) -> Counter[tuple[str, str, str]]:
    found: Counter[tuple[str, str, str]] = Counter()
    for location, text in active_blocks(book):
        for rule, pattern in RULES.items():
            for match in pattern.finditer(text):
                value = match.group()
                if rule == "machine_specific_absolute_path" and re.search(
                    r"/(?:home|Users)/(?:name|username|yourname)(?:/|$)", value
                ):
                    continue
                found[(location, rule, value)] += 1
    return found


def load_exceptions(path: Path) -> tuple[Counter[tuple[str, str, str]], list[str]]:
    allowed: Counter[tuple[str, str, str]] = Counter()
    problems = []
    if not path.is_file():
        return allowed, [f"{path}: missing runtime-path exception register"]

    document = yaml.safe_load(path.read_text(encoding="utf-8")) or {}
    entries = document.get("exceptions", [])
    if not isinstance(entries, list):
        return allowed, [f"{path}: exceptions must be a list"]

    required = {"location", "rule", "value", "count", "reason", "owner", "target_phase"}
    for index, entry in enumerate(entries, start=1):
        label = f"{path}:exception {index}"
        if not isinstance(entry, dict):
            problems.append(f"{label}: entry must be a mapping")
            continue
        missing = sorted(required - entry.keys())
        if missing:
            problems.append(f"{label}: missing {', '.join(missing)}")
            continue
        if entry["rule"] not in RULES:
            problems.append(f"{label}: unknown rule {entry['rule']}")
            continue
        if not isinstance(entry["count"], int) or entry["count"] < 1:
            problems.append(f"{label}: count must be a positive integer")
            continue
        if not all(isinstance(entry[field], str) and entry[field].strip()
                   for field in ("location", "value", "reason", "owner", "target_phase")):
            problems.append(f"{label}: text fields must be non-empty strings")
            continue
        key = (entry["location"], entry["rule"], entry["value"])
        if key in allowed:
            problems.append(f"{label}: duplicate exception for {key}")
            continue
        allowed[key] = entry["count"]
    return allowed, problems


def check_runtime_paths(book: Path, exceptions: Path) -> list[str]:
    actual = findings(book)
    allowed, problems = load_exceptions(exceptions)
    for key in sorted(actual.keys() | allowed.keys()):
        observed = actual[key]
        expected = allowed[key]
        location, rule, value = key
        if observed > expected:
            problems.append(
                f"{location}: {rule}: unapproved {value!r} "
                f"({observed} found, {expected} approved)"
            )
        elif expected > observed:
            problems.append(
                f"{exceptions}: stale exception for {location}: {rule}: {value!r} "
                f"({expected} approved, {observed} found)"
            )
    return sorted(problems)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--book", type=Path, default=Path("content"))
    parser.add_argument(
        "--exceptions",
        type=Path,
        default=Path("scripts/runtime_path_exceptions.yml"),
    )
    args = parser.parse_args()
    problems = check_runtime_paths(args.book, args.exceptions)
    for problem in problems:
        print(problem)
    print(f"Runtime path check: {len(problems)} issue(s)")
    return bool(problems)


if __name__ == "__main__":
    raise SystemExit(main())
