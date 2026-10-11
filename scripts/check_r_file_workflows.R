#!/usr/bin/env Rscript

# Run the supplied R file examples in a fresh coursework project.

repository_root <- normalizePath(".")
required_files <- c(
  "content/code/basic_io.R",
  "content/code/anova.R",
  "content/code/data_wrang.R",
  "content/code/exp_design.R",
  "content/code/fmr.R",
  "content/code/glm.R",
  "content/code/model_simp.R",
  "content/code/mul_expl.R",
  "content/code/mul_expl_inter.R",
  "content/code/regress.R",
  "content/code/sql_in_r.R",
  "content/code/test_r.R",
  "content/code/test_r.py",
  "content/code/t_f_tests.R",
  "content/data/genome_size.csv",
  "content/data/aedes_fecund.csv",
  "content/data/albatross_grow.csv",
  "content/data/mammal_data.csv",
  "content/data/prac_data.csv",
  "content/data/resource.csv",
  "content/data/trees.csv",
  "content/data/nagy_et_al_1999.csv",
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
    file.path(
      repository_root,
      "content/code",
      c(
        "anova.R",
        "basic_io.R",
        "data_wrang.R",
        "exp_design.R",
        "fmr.R",
        "glm.R",
        "model_simp.R",
        "mul_expl.R",
        "mul_expl_inter.R",
        "regress.R",
        "sql_in_r.R",
        "test_r.R",
        "test_r.py",
        "t_f_tests.R"
      )
    ),
    file.path(project_root, "code"),
    overwrite = TRUE
  )),
  all(file.copy(
    file.path(
      repository_root,
      "content/data",
      c(
        "aedes_fecund.csv",
        "albatross_grow.csv",
        "genome_size.csv",
        "mammal_data.csv",
        "prac_data.csv",
        "resource.csv",
        "trees.csv",
        "nagy_et_al_1999.csv",
        "pound_hill_data.csv",
        "pound_hill_meta_data.csv"
      )
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

run_script("code/fmr.R")
fmr_output <- file.path("results", "fmr_plot.pdf")
stopifnot(file.exists(fmr_output), file.info(fmr_output)$size > 0)

genome_input <- read.csv(file.path("data", "genome_size.csv"))
stopifnot(
  nrow(genome_input) == 100L,
  ncol(genome_input) == 16L,
  all(c("GenomeSize", "BodyWeight", "Suborder") %in% names(genome_input))
)

run_script("code/exp_design.R")
experimental_design_pdf <- file.path("results", "genome_size.pdf")
experimental_design_data <- file.path("results", "genome_size.rda")
stopifnot(
  file.exists(experimental_design_pdf),
  file.info(experimental_design_pdf)$size > 0,
  file.exists(experimental_design_data),
  file.info(experimental_design_data)$size > 0,
  !file.exists("Rplots.pdf")
)
experimental_design_environment <- new.env(parent = emptyenv())
experimental_design_objects <- load(
  experimental_design_data,
  envir = experimental_design_environment
)
stopifnot(
  setequal(experimental_design_objects, c("genome", "myColours", "mySymbols")),
  "genome_size" %in% names(experimental_design_environment$genome),
  identical(
    experimental_design_environment$genome$genome_size,
    genome_input$GenomeSize
  )
)

albatross_input <- read.csv(file.path("data", "albatross_grow.csv"))
aedes_input <- read.csv(file.path("data", "aedes_fecund.csv"))
stopifnot(
  nrow(albatross_input) == 100L,
  ncol(albatross_input) == 7L,
  all(c("age", "wt", "ID") %in% names(albatross_input)),
  nrow(aedes_input) == 30L,
  ncol(aedes_input) == 3L,
  identical(names(aedes_input), c("T", "EFD", "ref"))
)

run_script("code/t_f_tests.R")
t_f_output <- file.path("results", "t_f_tests.pdf")
stopifnot(file.exists(t_f_output), file.info(t_f_output)$size > 0)

run_script("code/regress.R")
regression_output <- file.path("results", "regression.pdf")
stopifnot(file.exists(regression_output), file.info(regression_output)$size > 0)

mammal_input <- read.csv(file.path("data", "mammal_data.csv"))
stopifnot(
  nrow(mammal_input) == 379L,
  ncol(mammal_input) == 9L,
  all(c("meanCvalue", "GroundDwelling", "TrophicLevel") %in% names(mammal_input))
)

run_script("code/anova.R")
anova_output <- file.path("results", "anova.pdf")
mammal_snapshot <- file.path("results", "mammals.rdata")
stopifnot(
  file.exists(anova_output),
  file.info(anova_output)$size > 0,
  file.exists(mammal_snapshot),
  file.info(mammal_snapshot)$size > 0
)
snapshot_environment <- new.env(parent = emptyenv())
loaded_objects <- load(mammal_snapshot, envir = snapshot_environment)
stopifnot(
  identical(loaded_objects, "mammals"),
  "logCvalue" %in% names(snapshot_environment$mammals),
  nrow(snapshot_environment$mammals) == nrow(mammal_input)
)

run_script("code/mul_expl.R")
multiple_output <- file.path("results", "multiple_explanatory_variables.pdf")
stopifnot(file.exists(multiple_output), file.info(multiple_output)$size > 0)

run_script("code/mul_expl_inter.R")
interaction_output <- file.path("results", "multiple_variables_interactions.pdf")
stopifnot(file.exists(interaction_output), file.info(interaction_output)$size > 0)

run_script("code/model_simp.R")
model_simplification_pdf <- file.path("results", "model_simplification.pdf")
minimum_model_path <- file.path("results", "minimum_adequate_model.rda")
stopifnot(
  file.exists(model_simplification_pdf),
  file.info(model_simplification_pdf)$size > 0,
  file.exists(minimum_model_path),
  file.info(minimum_model_path)$size > 0
)
minimum_model_environment <- new.env(parent = emptyenv())
minimum_model_objects <- load(minimum_model_path, envir = minimum_model_environment)
stopifnot(
  identical(minimum_model_objects, "model6"),
  inherits(minimum_model_environment$model6, "lm")
)

colony_input <- read.csv(file.path("data", "prac_data.csv"))
stopifnot(
  nrow(colony_input) == 680L,
  ncol(colony_input) == 5L,
  all(c("Strain", "Treatment", "ColonyCount", "HaloLawn") %in% names(colony_input))
)

run_script("code/glm.R")
glm_output <- file.path("results", "glm.pdf")
stopifnot(file.exists(glm_output), file.info(glm_output)$size > 0)

run_script("code/sql_in_r.R")
run_script("code/sql_in_r.R")
database_output <- file.path("results", "sql_in_r.sqlite")
stopifnot(file.exists(database_output), file.info(database_output)$size > 0)
database_connection <- DBI::dbConnect(RSQLite::SQLite(), database_output)
stopifnot(
  setequal(DBI::dbListTables(database_connection), c("consumer", "resource")),
  DBI::dbGetQuery(database_connection, "SELECT COUNT(*) AS n FROM consumer")$n == 3L,
  DBI::dbGetQuery(database_connection, "SELECT COUNT(*) AS n FROM resource")$n == 2336L
)
DBI::dbDisconnect(database_connection)

python_output <- system2(
  Sys.which("python3"),
  "code/test_r.py",
  stdout = TRUE,
  stderr = TRUE
)
python_status <- attr(python_output, "status")
if (!is.null(python_status) && python_status != 0) {
  stop(paste(python_output, collapse = "\n"), call. = FALSE)
}
stopifnot(
  any(grepl("Return code: 0", python_output, fixed = TRUE)),
  file.exists(file.path("results", "test_r.rout")),
  file.exists(file.path("results", "test_r_errFile.rout")),
  grepl(
    "Hello, this is R!",
    paste(readLines(file.path("results", "test_r.rout")), collapse = "\n"),
    fixed = TRUE
  )
)

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
