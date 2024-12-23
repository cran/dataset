## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## -----------------------------------------------------------------------------
gdp_1 = defined(
    c(3897, 7365), 
    label = "Gross Domestic Product", 
    unit = "million dollars", 
    definition = "http://data.europa.eu/83i/aa/GDP")

## -----------------------------------------------------------------------------
attributes(gdp_1)
cat("Get the label only: ")
var_label(gdp_1)
cat("Get the unit only: ")
var_unit(gdp_1)
cat("Get the definition only: ")
var_definition(gdp_1)

## -----------------------------------------------------------------------------
gdp_2 <- defined(2034, label = "Gross Domestic Product")

## ----eval=FALSE---------------------------------------------------------------
#  c(gdp_1, gdp_2)
#  Error in `vec_c()`:
#  ! Can't combine `..1` <haven_labelled_defined> and `..2` <haven_labelled_defined>.
#  ✖ Some attributes are incompatible.

## ----gpd2---------------------------------------------------------------------
var_unit(gdp_2) <- "million dollars"

## ----vardef2------------------------------------------------------------------
var_definition(gdp_2) <- "http://data.europa.eu/83i/aa/GDP"

## ----c------------------------------------------------------------------------
summary(c(gdp_1, gdp_2))

## ----country------------------------------------------------------------------
country = defined(c("AD", "LI", "SM"), 
                  label = "Country name", 
                  definition = "http://data.europa.eu/bna/c_6c2bb82d", 
                  namespace = "https://www.geonames.org/countries/$1/")

## ----coerce-char--------------------------------------------------------------
as_character(country)
as_character(c(gdp_1, gdp_2))

## ----coerce-num---------------------------------------------------------------
as_numeric(c(gdp_1, gdp_2))

