## ----setupdefined, include = FALSE--------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load---------------------------------------------------------------------
library(dataset)

## ----definedvector------------------------------------------------------------
gdp_1 <- defined(
  c(3897, 7365),
  label = "Gross Domestic Product",
  unit = "million dollars",
  concept = "http://data.europa.eu/83i/aa/GDP"
)

cat("The print method:\n")
print(gdp_1)
cat("And the summary:\n")
summary(gdp_1)

## ----definedattributes--------------------------------------------------------
attributes(gdp_1)
cat("Get the label only: ")
var_label(gdp_1)
cat("Get the unit only: ")
var_unit(gdp_1)
cat("Get the concept definition only: ")
var_concept(gdp_1)

## ----combine------------------------------------------------------------------
a <- defined(1:3, label = "Length", unit = "metres")
b <- defined(4:6, label = "Length", unit = "metres")

c(a, b)

## ----newexample---------------------------------------------------------------
gdp_2 <- defined(2034, label = "Gross Domestic Product")

## ----error, eval=FALSE--------------------------------------------------------
# c(gdp_1, gdp_2)

## ----smgdp, gpd2--------------------------------------------------------------
var_unit(gdp_2) <- "million dollars"

## ----vardef2------------------------------------------------------------------
var_concept(gdp_2) <- "http://data.europa.eu/83i/aa/GDP"

## ----concat-------------------------------------------------------------------
summary(c(gdp_1, gdp_2))

## ----country------------------------------------------------------------------
country <- defined(c("AD", "LI", "SM"),
  label = "Country name",
  concept = "http://data.europa.eu/bna/c_6c2bb82d",
  namespace = "https://www.geonames.org/countries/$1/"
)

## ----characters---------------------------------------------------------------
countries <- defined(
  c("AD", "LI"),
  label = "Country code",
  namespace = "https://www.geonames.org/countries/$1/"
)

countries
as_character(countries)

## ----basicmethods-------------------------------------------------------------
gdp_1[1:2]
gdp_1 > 5000
as.vector(gdp_1)
as.list(gdp_1)

## ----coerce-char--------------------------------------------------------------
as_character(country)
as_character(c(gdp_1, gdp_2))

## ----coerce-num---------------------------------------------------------------
as_numeric(c(gdp_1, gdp_2))

