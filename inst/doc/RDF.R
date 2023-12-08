## ----setupRDFvignette, include = FALSE----------------------------------------
library(knitr)
knitr::opts_chunk$set(
  collapse = TRUE,
  message  = FALSE,
  comment = "#>",
  out.width = '90%'
)
library(here)
library(readxl)
library(kableExtra)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----importexamplexlsx--------------------------------------------------------
example_df <- readxl::read_excel(
  system.file("extdata", "rdf_example.xlsx", package = "dataset"),
  sheet = "dataset-wide")

