#!/usr/bin/env python3

"""Run the small R example and save its output from the project root."""

import subprocess


with open("results/test_r.rout", "w") as output_file, \
     open("results/test_r_errFile.rout", "w") as error_file:
    result = subprocess.run(
        ["Rscript", "--verbose", "code/test_r.R"],
        stdout=output_file,
        stderr=error_file,
        check=False,
    )

print("Return code:", result.returncode)
raise SystemExit(result.returncode)
