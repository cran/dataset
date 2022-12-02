## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, eval=FALSE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
#  library(dataset)

## ----createdataset------------------------------------------------------------
#  temp_path <- file.path(tempdir(), "iris.csv")
#  write.csv(iris, file = temp_path, row.names = F)
#  file.exists(temp_path)
#  iris_ds <- read_dataset(
#    dataset_id = "iris_dataset",
#    obs_id = NULL,
#    dimensions = NULL,
#    measures = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
#    attributes = "Species",
#    Title = "Iris Dataset",
#    unit = list(code = "MM", label = "millimeter"),
#    .f = "utils::read.csv", file = temp_path )

## -----------------------------------------------------------------------------
#  print(attributes(iris_ds))

## ----useafunction-------------------------------------------------------------
#  iris_summary <- use_function(dataset = iris_ds, .f = "summary")

## ----showhistory--------------------------------------------------------------
#  knitr::kable(attr(iris_summary, "Date"))

