## ----setupknitr, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## -----------------------------------------------------------------------------
iris_ds <- dataset(x=iris, 
                   Dimensions=NULL, 
                   Measures=c("Sepal.Length", "Sepal.Width", 
                              "Petal.Length", "Petal.Width"),
                   Attributes = "Species", 
                   Title = "Iris Dataset", 
                   Label = "The famous iris dataset used in R examples")

dublincore(iris_ds)

## ----createdataset------------------------------------------------------------
iris_ds <- datacite_add(iris,
                        Title = "Iris Dataset",
                        Creator = person(family ="Anderson", given ="Edgar", role = "aut"),
                        Identifier = "https://doi.org/10.1111/j.1469-1809.1936.tb02137.x",
                        Publisher= "American Iris Society",
                        PublicationYear = 1935,
                        Geolocation = "US",
                        Language = "en", 
                        Version = "1.0")

datacite(iris_ds)

## ---- message=FALSE, eval=FALSE-----------------------------------------------
#  library(data.table)

## ---- eval=FALSE--------------------------------------------------------------
#  datacite_add(x = data.table::data.table(iris),
#               Title = "Iris Dataset",
#               Creator =  person(family ="Anderson", given ="Edgar", role = "aut"))

## ----showattributes-----------------------------------------------------------
dct_iris <- dublincore_add(
  x = iris,
  Title = "Iris Dataset",
  Creator = person("Edgar", "Anderson", role = "aut"),
  Publisher = "American Iris Society",
  Identifier = "https://doi.org/10.1111/j.1469-1809.1936.tb02137.x",
  Date = 1935,
  Language = "en"
)

dublincore(dct_iris)

## ----datacite-----------------------------------------------------------------
iris_dataset <- datacite_add(
  x = iris,
  Title = "Iris Dataset",
  Creator = person("Anderson", "Edgar", role = "aut"),
  Publisher= "American Iris Society",
  Identifier = "https://doi.org/10.1111/j.1469-1809.1936.tb02137.x",
  PublicationYear = 1935,
  Description = "This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.",
  Language = "en")

## -----------------------------------------------------------------------------
datacite(iris_dataset)

## ----bibentry-----------------------------------------------------------------
iris_bibentry <- bibentry_dataset(iris_dataset)
toBibtex(iris_bibentry)

## ----bibliography, results='asis'---------------------------------------------
print(iris_bibentry, sytle="html")

## ----petalexample-------------------------------------------------------------
petal_length <- dataset(subset(iris, 
                               select = c("Petal.Length", "Species")), 
        Dimensions = NULL, 
        Measures   = "Petal.Length", 
        Attributes = "Species")

petal_width <- dataset(subset(iris, 
                              select = c("Petal.Width", "Species")), 
        Dimensions = NULL, 
        Measures   = "Petal.Width", 
        Attribute  = "Species")

## ----loaddplyr, message=FALSE-------------------------------------------------
require(dplyr)

## ----petalexampleprint--------------------------------------------------------
petal_length %>%
  left_join (petal_width, by = c("Species")) %>%
  sample_n(10)

