## ----setupvignette, include = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----smallcountries-----------------------------------------------------------
small_country_dataset <- dataset_df(
  country_name = defined(c("AD", "LI"),
    label = "Country name",
    concept = "http://data.europa.eu/bna/c_6c2bb82d",
    namespace = "https://www.geonames.org/countries/$1/"
  ),
  gdp = defined(c(3897, 7365),
    label = "Gross Domestic Product",
    unit = "million dollars",
    concept = "http://data.europa.eu/83i/aa/GDP"
  ),
  dataset_bibentry = dublincore(
    title = "Small Country Dataset",
    creator = person("Jane", "Doe"),
    publisher = "Example Inc."
  )
)

## ----serialisation------------------------------------------------------------
triples <- dataset_to_triples(small_country_dataset)

n_triples(mapply(n_triple, triples$s, triples$p, triples$o))

