## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----createdataasetdf---------------------------------------------------------
small_country_dataset <- dataset_df(
  country_name = defined(
    c("AD", "LI"),
    label = "Country name",
    definition = "http://data.europa.eu/bna/c_6c2bb82d", 
    namespace = "https://www.geonames.org/countries/$1/"), 
  gdp = defined(
    c(3897, 7365), 
    label = "Gross Domestic Product", 
    unit = "million dollars", 
    definition = "http://data.europa.eu/83i/aa/GDP"),
  dataset_bibentry = dublincore(
    title = "Small Country Dataset", 
    creator = person("Jane", "Doe"), 
    publisher = "Example Inc.")
  )

## ----varlabel-----------------------------------------------------------------
var_label(small_country_dataset$gdp)

## ----varunit------------------------------------------------------------------
var_unit(small_country_dataset$gdp)

## ----vardefinition------------------------------------------------------------
var_definition(small_country_dataset$gdp)

## ----language-----------------------------------------------------------------
language(small_country_dataset) <- "en"

## ----bibentry-----------------------------------------------------------------
print(get_bibentry(small_country_dataset), "bibtex" )

## ----install-wbdataset, eval=FALSE--------------------------------------------
#  devtools::install_github("dataobservatory-eu/wbdataset")

## ----tuRtle-installation, eval=FALSE------------------------------------------
#  remotes::install_github("dataobservatory-eu/tuRtle", build = FALSE)

## ----createdf, eval=FALSE-----------------------------------------------------
#  library(tuRtle)
#  tdf <- data.frame (s = c("eg:01","eg:02",  "eg:01", "eg:02", "eg:01" ),
#                     p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
#                     o = c("qb:Observation",
#                           "qb:Observation",
#                           "\"1\"^^<xs:decimal>",
#                           "\"2\"^^<xs:decimal>",
#                           '"Example observation"')
#                     )
#  
#  knitr::kable(tdf)

## ----writettl, eval=FALSE-----------------------------------------------------
#  example_file<- file.path(tempdir(), "example_ttl.ttl")
#  ttl_write(tdf=tdf, ttl_namespace=NULL, file_path=example_file)
#  
#  readLines(example_file)

