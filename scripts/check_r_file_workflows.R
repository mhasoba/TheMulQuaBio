#!/usr/bin/env Rscript

# Run the supplied R file examples in a fresh coursework project.

repository_root <- normalizePath(".")
required_files <- c(
  "content/code/basic_io.R",
  "content/code/data_wrang.R",
  "content/data/trees.csv",
  "content/data/pound_hill_data.csv",
  "content/data/pound_hill_meta_data.csv"
)

missing_files <- required_files[!file.exists(required_files)]
if (length(missing_files) > 0) {
  stop(
    "Run this check from the MQB repository root. Missing: ",
    paste(missing_files, collapse = ", "),
    call. = FALSE
  )
}

project_root <- tempfile("mqb-r-file-workflows-")
dir.create(project_root)
for (directory in c("code", "data", "results")) {
  dir.create(file.path(project_root, directory))
}
on.exit(unlink(project_root, recursive = TRUE), add = TRUE)

stopifnot(
  all(file.copy(
    file.path(repository_root, "content/code", c("basic_io.R", "data_wrang.R")),
    file.path(project_root, "code"),
    overwrite = TRUE
  )),
  all(file.copy(
    file.path(
      repository_root,
      "content/data",
      c("trees.csv", "pound_hill_data.csv", "pound_hill_meta_data.csv")
    ),
    file.path(project_root, "data"),
    overwrite = TRUE
  ))
)

run_script <- function(path) {
  output <- system2(
    Sys.which("Rscript"),
    path,
    stdout = TRUE,
    stderr = TRUE
  )
  status <- attr(output, "status")
  if (!is.null(status) && status != 0) {
    stop(paste(output, collapse = "\n"), call. = FALSE)
  }
  invisible(output)
}

original_directory <- setwd(project_root)
on.exit(setwd(original_directory), add = TRUE)

run_script("code/basic_io.R")
basic_output <- file.path("results", "MyData.csv")
stopifnot(file.exists(basic_output), file.info(basic_output)$size > 0)

run_script("code/data_wrang.R")
wrangled_output <- read.csv(file.path("results", "pound_hill_long.csv"))
stopifnot(
  nrow(wrangled_output) == 2419L,
  identical(
    names(wrangled_output),
    c("Cultivation", "Block", "Plot", "Quadrat", "Species", "Count")
  ),
  !anyNA(wrangled_output$Count)
)

cat("R file workflow checks passed\n")
