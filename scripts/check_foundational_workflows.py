#!/usr/bin/env python3

"""Smoke-test representative shell and Python lessons from a project root."""

from __future__ import annotations

import csv
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
SOURCE_CODE = REPOSITORY_ROOT / "content" / "code"
SOURCE_DATA = REPOSITORY_ROOT / "content" / "data"


def copy_files(source_directory: Path, destination: Path, names: tuple[str, ...]) -> None:
    """Copy selected teaching files into a disposable coursework project."""
    for name in names:
        shutil.copy2(source_directory / name, destination / name)


def run(command: list[str], project_root: Path) -> subprocess.CompletedProcess[str]:
    """Run one documented command from the disposable project root."""
    return subprocess.run(
        command,
        cwd=project_root,
        check=True,
        capture_output=True,
        text=True,
    )


def check_workflows() -> None:
    """Run representative foundational workflows and check their results."""
    with tempfile.TemporaryDirectory(prefix="mqb-foundations-") as directory:
        project_root = Path(directory)
        code = project_root / "code"
        data = project_root / "data"
        results = project_root / "results"
        code.mkdir()
        data.mkdir()
        results.mkdir()

        copy_files(
            SOURCE_CODE,
            code,
            (
                "boilerplate.sh",
                "MyExampleScript.py",
                "boilerplate.py",
                "using_name.py",
                "sysargv.py",
                "control_flow.py",
                "test_control_flow.py",
                "basic_csv.py",
            ),
        )
        copy_files(SOURCE_DATA, data, ("testcsv.csv",))

        shell_result = run(["bash", "code/boilerplate.sh"], project_root)
        assert "This is a shell script!" in shell_result.stdout

        first_script = run([sys.executable, "code/MyExampleScript.py"], project_root)
        assert first_script.stdout.strip() == "The square of 2 is 4"

        boilerplate = run([sys.executable, "code/boilerplate.py"], project_root)
        assert boilerplate.stdout.strip() == "This is a boilerplate"

        module_name = run([sys.executable, "code/using_name.py"], project_root)
        assert module_name.stdout.strip() == "This module's name is: __main__"

        arguments = run(
            [sys.executable, "code/sysargv.py", "oak", "two words"],
            project_root,
        )
        assert "Number of arguments: 2" in arguments.stdout
        assert "Arguments: ['oak', 'two words']" in arguments.stdout

        run([sys.executable, "code/control_flow.py"], project_root)
        control_checks = run(
            [sys.executable, "code/test_control_flow.py"], project_root
        )
        assert control_checks.stdout == ""

        run([sys.executable, "code/basic_csv.py"], project_root)
        with (data / "testcsv.csv").open(newline="") as source:
            expected_rows = [[row[0], row[4]] for row in csv.reader(source)]
        with (results / "bodymass.csv").open(newline="") as generated:
            actual_rows = list(csv.reader(generated))
        assert actual_rows == expected_rows


if __name__ == "__main__":
    check_workflows()
    print("Foundational workflow check: all commands passed")
