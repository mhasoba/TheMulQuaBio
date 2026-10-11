#!/usr/bin/env Rscript

# Build and query a small SQLite database from the project root.

required_packages <- c("DBI", "RSQLite")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))
]
if (length(missing_packages) > 0L) {
  stop(
    "Install the missing R package(s) before running this script: ",
    paste(missing_packages, collapse = ", ")
  )
}

input_path <- file.path("data", "resource.csv")
output_path <- file.path("results", "sql_in_r.sqlite")

if (!file.exists(input_path)) {
  stop("Missing input file: ", input_path, ". Start this script at the project root.")
}

dir.create("results", showWarnings = FALSE)
db <- DBI::dbConnect(RSQLite::SQLite(), dbname = output_path)
on.exit(DBI::dbDisconnect(db), add = TRUE)

# Recreate the example tables so that rerunning the script gives the same result.
invisible(DBI::dbExecute(db, "DROP TABLE IF EXISTS consumer"))
invisible(DBI::dbExecute(
  db,
  paste(
    "CREATE TABLE consumer (",
    "OriginalID INTEGER,",
    "ConKingdom TEXT,",
    "ConPhylum TEXT,",
    "ConSpecies TEXT)"
  )
))

consumers <- data.frame(
  OriginalID = 1:3,
  ConKingdom = rep("Animalia", 3),
  ConPhylum = c("Arthropoda", "Arthropoda", "Chordata"),
  ConSpecies = c(
    "Chaoborus trivittatus",
    "Chaoborus americanus",
    "Stizostedion vitreum"
  )
)
invisible(DBI::dbAppendTable(db, "consumer", consumers))

print(DBI::dbGetQuery(db, "SELECT * FROM consumer"))
print(DBI::dbGetQuery(db, "SELECT * FROM consumer WHERE ConPhylum = 'Chordata'"))

resources <- read.csv(input_path)
invisible(DBI::dbWriteTable(
  db,
  "resource",
  resources,
  overwrite = TRUE,
  row.names = FALSE
))

print(DBI::dbListTables(db))
print(DBI::dbListFields(db, "resource"))
print(utils::head(DBI::dbReadTable(db, "resource")))

stopifnot(
  DBI::dbGetQuery(db, "SELECT COUNT(*) AS n FROM consumer")$n == 3L,
  DBI::dbGetQuery(db, "SELECT COUNT(*) AS n FROM resource")$n == nrow(resources)
)

message("Database written to ", output_path)
