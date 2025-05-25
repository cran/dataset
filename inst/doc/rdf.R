## ----setupvignette, include = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if (!requireNamespace("rdflib", quietly = TRUE)) {
  stop("Please install 'rdflib' to run this vignette.")
}

if (!requireNamespace("jsonld", quietly = TRUE)) {
  stop("Please install 'jsonld' to run this vignette.")
}

## ----setup--------------------------------------------------------------------
library(dataset)
library(rdflib)
library(jsonld)

## ----orangedf-----------------------------------------------------------------
data(orange_df)
orange_df[1, ]

## ----triples------------------------------------------------------------------
dataset_to_triples(orange_df[1:2, ])[1:3, ]

## ----defined------------------------------------------------------------------
gdp_vector <- defined(
  c(3897, 7365, 6753),
  label = "Gross Domestic Product",
  unit = "https://rdf.vegdata.no/V440/v440-doc/v440-brudata-owl-doc/unit_MillionUSD.html",
  concept = "http://data.europa.eu/83i/aa/GDP"
)

## ----ntriples-----------------------------------------------------------------
n_triple(
  s = "https://doi.org/10.5281/zenodo.10396807", # permanent, global ID of the dataset
  p = "http://purl.org/dc/terms/description", # library definition of 'description'
  o = "The famous (Fisher's or Anderson's) iris data set."
) # literal string

## ----bibliography-------------------------------------------------------------
as_dublincore(iris_dataset, type = "ntriples")

## ----prov---------------------------------------------------------------------
provenance(iris_dataset)

## ----rdf----------------------------------------------------------------------
# initialise an rdf triplestore:
dataset_describe <- rdf()

# open a temporary file:
temp_prov <- tempfile()

# describe the dataset in temporary file:
describe(iris_dataset, temp_prov)

# parse temporary file into the RDF triplestore;
rdf_parse(rdf = dataset_describe, doc = temp_prov, format = "ntriples")

# show RDF triples:
dataset_describe

## ----jsonld-------------------------------------------------------------------
options(rdf_print_format = "jsonld")
dataset_describe

## -----------------------------------------------------------------------------
n_triples(dataset_to_triples(iris[1:4, ]))

