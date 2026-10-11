"""Reference solution for the observations-by-site notebook practice."""

import csv
from pathlib import Path


REQUIRED_FIELDS = {"site", "date", "count"}


def load_observations(path):
    with open(path, newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream))


def parse_count(count_text):
    if not isinstance(count_text, str):
        raise ValueError("Count must be text")
    if count_text == "":
        return None
    try:
        count = int(count_text)
    except ValueError as error:
        raise ValueError(f"Invalid count: {count_text!r}") from error
    if count < 0:
        raise ValueError("Count must be non-negative")
    return count


def summarise_site(rows, site):
    if not isinstance(rows, list):
        raise ValueError("Rows must be a list")
    if not isinstance(site, str) or not site:
        raise ValueError("Site must be non-empty text")

    seen_records = set()
    known_total = 0
    missing_count = 0
    has_known_count = False

    for row in rows:
        if not isinstance(row, dict) or set(row) != REQUIRED_FIELDS:
            raise ValueError("Each row must contain exactly site, date and count")
        row_site = row["site"]
        date = row["date"]
        count_text = row["count"]
        if not isinstance(row_site, str) or not row_site:
            raise ValueError("Each row must have a non-empty text site")
        if not isinstance(date, str) or not date:
            raise ValueError("Each row must have a non-empty text date")

        count = parse_count(count_text)
        record = (row_site, date, count_text)
        if record in seen_records:
            continue
        seen_records.add(record)

        if row_site == site:
            if count is None:
                missing_count += 1
            else:
                known_total += count
                has_known_count = True

    if not has_known_count:
        return None, missing_count
    return known_total, missing_count


def expect_value_error(rows, site="A"):
    try:
        summarise_site(rows, site)
    except ValueError:
        return
    raise AssertionError("Expected ValueError")


def main():
    data_dir = Path(__file__).resolve().parents[1] / "data"
    ordinary_path = data_dir / "bootcamp_observations.csv"
    boundary_path = data_dir / "bootcamp_observations_boundary.csv"
    invalid_path = data_dir / "bootcamp_observations_invalid.csv"

    ordinary_rows = load_observations(ordinary_path)
    boundary_rows = load_observations(boundary_path)
    invalid_rows = load_observations(invalid_path)

    assert parse_count("2") == 2
    assert parse_count("0") == 0
    assert parse_count("") is None
    expect_value_error([{"site": "A", "date": "2026-10-01", "count": "-1"}])
    expect_value_error([{"site": "A", "date": "2026-10-01", "count": "many"}])

    assert summarise_site(ordinary_rows, "A") == (2, 1)
    assert summarise_site(ordinary_rows, "B") == (0, 0)
    assert summarise_site(boundary_rows, "C") == (None, 2)
    assert summarise_site(boundary_rows, "D") == (0, 0)
    assert summarise_site([], "A") == (None, 0)
    assert summarise_site(ordinary_rows, "Z") == (None, 0)

    for invalid_row in invalid_rows:
        expect_value_error([invalid_row])

    expect_value_error([{"site": "A", "count": "2"}])
    original_rows = [row.copy() for row in ordinary_rows]
    summarise_site(ordinary_rows, "A")
    assert ordinary_rows == original_rows
    expect_value_error(ordinary_rows, "")

    print("Site A:", summarise_site(ordinary_rows, "A"))
    print("Site B:", summarise_site(ordinary_rows, "B"))
    print("Site C:", summarise_site(boundary_rows, "C"))
    print("Site D:", summarise_site(boundary_rows, "D"))
    print("All reference checks passed.")


if __name__ == "__main__":
    main()