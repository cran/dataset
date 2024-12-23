## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)
iris_dataset_2 <- iris_dataset

## ----bibentryprint------------------------------------------------------------
print(get_bibentry(iris_dataset_2), "Bibtex")

## ----get-title----------------------------------------------------------------
dataset_title(iris_dataset)

## ----change-title-------------------------------------------------------------
dataset_title(iris_dataset_2, overwrite=TRUE) <- "The Famous Iris Dataset"
get_bibentry(iris_dataset_2)

## ----creator------------------------------------------------------------------
creator(iris_dataset)

## ----creator-modify-----------------------------------------------------------
iris_dataset_2 <- iris_dataset
# Add a new creator, with overwriting existing authorship information:
creator(iris_dataset_2, overwrite=TRUE) <- person("Jane", "Doe", role = "aut")

# Add a new creator, without overwriting existing authorship information:
creator(iris_dataset_2, overwrite=FALSE) <- person("John", "Doe", role = "ctb")

# The two new creation contributors:
creator(iris_dataset_2)

## ----irispublicationyear------------------------------------------------------
publication_year(iris_dataset_2)

## ----publicationyeardefault---------------------------------------------------
# Revert to default (unassigned):
publication_year(iris_dataset_2) <- NULL

# Get the default value:
publication_year(iris_dataset_2) 

## ----language-----------------------------------------------------------------
# Get the language:
language(iris_dataset)

# Reset the language:
language(iris_dataset_2) <- "French"
language(iris_dataset_2)

## ----rights-------------------------------------------------------------------
# Add rights statement to the dataset
rights(iris_dataset_2, overwrite = TRUE)  <- "GNU-2"

## ----prevent-overwrite--------------------------------------------------------
rights(iris_dataset_2) <- "CC0"
rights(iris_dataset_2)

## ----overwrite----------------------------------------------------------------
rights(iris_dataset_2, overwrite = TRUE)  <- "GNU-2"

## ----rightsubproperties-------------------------------------------------------
list ( schemeURI="https://spdx.org/licenses/",
       rightsIdentifierScheme="SPDX",
       rightsIdentifier="CC-BY-4.0",
       rightsURI="https://creativecommons.org/licenses/by/4.0/")

## ----printdescription---------------------------------------------------------
description(iris_dataset)

## -----------------------------------------------------------------------------
subject(iris_dataset)

## -----------------------------------------------------------------------------
subject_create(
  term = "data sets", 
  subjectScheme = "Library of Congress Subject Headings (LCSH)", 
  schemeURI = "https://id.loc.gov/authorities/subjects.html",
  valueURI = "http://id.loc.gov/authorities/subjects/sh2018002256"
)

## ----identifier---------------------------------------------------------------
# Add rights statement to the dataset
identifier(iris_dataset_2)

## ----datacite-----------------------------------------------------------------
print(as_datacite(iris_dataset), "Bibtex")

## ----dc-----------------------------------------------------------------------
print(as_dublincore(iris_dataset), "Bibtex")

