#!/usr/bin/env Rscript

# Check that the Week 3 observations examples still produce the expected results.

read_observations <- function(path) {
  data <- read.csv(
    path,
    colClasses = "character",
    na.strings = "",
    check.names = FALSE,
    stringsAsFactors = FALSE
  )

  required <- c("site", "date", "count")
  if (!identical(names(data), required)) {
    stop("Expected columns, in order: site,date,count", call. = FALSE)
  }
  if (any(is.na(data$site) | trimws(data$site) == "")) {
    stop("site must be non-empty", call. = FALSE)
  }
  if (any(is.na(data$date) | trimws(data$date) == "")) {
    stop("date must be non-empty", call. = FALSE)
  }

  known <- !is.na(data$count)
  if (any(!grepl("^(0|[1-9][0-9]*)$", data$count[known]))) {
    stop("count must be empty or a non-negative integer", call. = FALSE)
  }
  data$count[known] <- as.character(as.integer(data$count[known]))
  data
}

summarise_observations <- function(data) {
  data <- unique(data)
  sites <- unique(data$site)
  rows <- lapply(sites, function(site) {
    counts <- suppressWarnings(as.integer(data$count[data$site == site]))
    known <- !is.na(counts)
    data.frame(
      site = site,
      total_known = if (any(known)) sum(counts[known]) else NA_integer_,
      missing_count = sum(!known),
      stringsAsFactors = FALSE
    )
  })
  do.call(rbind, rows)
}

expect_row <- function(summary, site, total_known, missing_count) {
  row <- summary[summary$site == site, , drop = FALSE]
  stopifnot(nrow(row) == 1L)
  stopifnot(identical(row$total_known[[1]], total_known))
  stopifnot(identical(row$missing_count[[1]], missing_count))
}

ordinary <- read_observations("content/data/bootcamp_observations.csv")
stopifnot(sum(duplicated(ordinary)) == 1L)
ordinary_summary <- summarise_observations(ordinary)
expect_row(ordinary_summary, "A", 2L, 1L)
expect_row(ordinary_summary, "B", 0L, 0L)

boundary <- read_observations("content/data/bootcamp_observations_boundary.csv")
boundary_summary <- summarise_observations(boundary)
expect_row(boundary_summary, "C", NA_integer_, 2L)
expect_row(boundary_summary, "D", 0L, 0L)

invalid_error <- tryCatch(
  {
    read_observations("content/data/bootcamp_observations_invalid.csv")
    NULL
  },
  error = function(error) conditionMessage(error)
)
stopifnot(!is.null(invalid_error))
stopifnot(grepl("non-negative integer", invalid_error, fixed = TRUE))

cat("R observations checks passed\n")
