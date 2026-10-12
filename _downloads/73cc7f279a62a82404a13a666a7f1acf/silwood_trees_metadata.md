# Synthetic Silwood tree-survey metadata

These are synthetic teaching records, not a campus inventory or a record of a real field survey. The location strings are synthetic exercise labels, not verified Silwood site locations, even where their spelling resembles real place names. The location and taxon labels define the accepted values for this exercise; do not use external sources to infer corrections.

## Columns

| Column | Meaning | Valid value |
| --- | --- | --- |
| `record_id` | Survey-record identifier | `ST` followed by exactly three digits; unique among accepted rows |
| `location` | Synthetic survey location | One of the four canonical locations below |
| `genus` | Tree genus | One of the permitted genera below |
| `species` | Tree species epithet | The permitted species paired with its genus below |
| `distance_m` | Horizontal distance from observer to tree, in metres | A number greater than 0 and no greater than 100 |
| `angle_degrees` | Angle from horizontal to treetop, in degrees | A number greater than 0 and less than 90 |

Every column is required.

## Permitted cleaning

For `record_id`:

1. Remove surrounding whitespace.
2. Require the uppercase `ST` prefix and exactly three digits.

For `location`, `genus` and `species`:

1. Remove surrounding whitespace.
2. Match permitted values without regard to letter case.
3. Write accepted values using the canonical spelling and case below.

Do not correct misspellings, infer missing values or replace an unrecognised value with the nearest permitted value.
For numeric fields, non-finite values such as `nan` and `inf` are invalid and must receive the corresponding `invalid <field>` reason.

Canonical locations:

- `Silwood Bottom`
- `Nash's Field`
- `Manor House`
- `Reactor Wood`

Permitted taxon pairs:

| Genus | Species |
| --- | --- |
| `Quercus` | `robur` |
| `Quercus` | `petraea` |
| `Acer` | `pseudoplatanus` |
| `Betula` | `pendula` |
| `Fagus` | `sylvatica` |
| `Fraxinus` | `excelsior` |

An accepted record is an oak when its canonical genus is exactly `Quercus`.

## Duplicate identifiers

Process input rows in file order. The first otherwise valid row with a record identifier may be accepted. Reject a later row whose identifier duplicates an already accepted row.

An invalid row does not reserve its identifier.

## Rejection reasons

Collect every applicable reason for an invalid row. Use the following exact text and order:

1. `missing record_id`
2. `invalid record_id`
3. `duplicate record_id`
4. `missing location`
5. `invalid location`
6. `missing genus`
7. `invalid genus`
8. `missing species`
9. `invalid species`
10. `invalid genus/species combination`
11. `missing distance_m`
12. `invalid distance_m`
13. `distance_m out of range`
14. `missing angle_degrees`
15. `invalid angle_degrees`
16. `angle_degrees out of range`

Do not add a range reason when the value is missing or cannot be converted to a number. Do not add `invalid genus/species combination` unless both values are individually recognised.

## Output files and formats

Create outputs in `results/`, replacing files created by an earlier run.

### `silwood_trees_clean.csv`

Use the input column order:

```text
record_id,location,genus,species,distance_m,angle_degrees
```

Write only accepted records, sorted by `record_id`. Write text values in canonical form. Write numeric values as valid decimal text; no particular number of trailing zeroes is required.

### `silwood_tree_issues.csv`

Use:

```text
source_row,record_id,reasons
```

`source_row` is the line number in the input CSV, where the header is line 1. Preserve the cleaned `record_id` when one is present. Join multiple reasons with `; ` in the required order. Write rejected rows in source-row order.

### `oak_species_counts.csv`

Use:

```text
species,count
```

Count accepted `Quercus` records only. Write one row per represented oak species, sorted by species.

## Reproducibility

- Importing the implementation module must not read files, print a report or create outputs.
- Running the program twice on unchanged input must produce equivalent outputs without duplicated rows.
- The program must create `results/` when it is absent.
- The supplied raw CSV must remain unchanged.
