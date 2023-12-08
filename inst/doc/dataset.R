## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(dataset)

## ----data-frame-example-------------------------------------------------------
foo <- data.frame( x = c(1,2), y = c(3,4))
attr(foo, "Title") <- "My Foo Object"
attributes(foo)

## ----iris---------------------------------------------------------------------
describe(iris_dataset)
publisher(iris_dataset)

## ----include=FALSE, message=FALSE---------------------------------------------
library(here)
library(knitr)

## ----eurostat-example, message=FALSE------------------------------------------
rd_e_gerdtot <- eurostat::get_eurostat('rd_e_gerdtot')
head(rd_e_gerdtot)

## ----eval=FALSE---------------------------------------------------------------
#  dimensions(rd_e_gerdtot) <- c("geo", "time", "sectperf")

## ----eval=FALSE---------------------------------------------------------------
#  measures(rd_e_gerdtot) <- "value"

## ----attributes, eval=FALSE---------------------------------------------------
#  attributes_measures(rd_e_gerdtot) <- "unit"
#  datacite(rd_e_gerdtot)

## ----datacite, include=TRUE, eval=TRUE----------------------------------------
toc <- eurostat::get_eurostat_toc()
rd_e_gerdtot_reference <- toc[which(toc$code == "rd_e_gerdtot"),]

rd_e_gerdtot_bibentry <- datacite(
  Title = 'GERD by sector of performance', 
  Creator = person("Daniel", "Antal"), 
  Identifier = 'eurostat_rd_e_gerdtot', 
  Publisher = 'Eurostat', 
  PublicationYear = substr(rd_e_gerdtot_reference$`last update of data`, 7,11), 
  Subject = subject_create("Reserach", 
                           subjectScheme = "LC Subject Headings", 
                           schemeURI = "http://id.loc.gov/authorities/subjects", 
                           valueURI = "http://id.loc.gov/authorities/subjects/sh85113021"), 
  Language = "English")

## ----print-datacite, results='asis'-------------------------------------------
datacite(rd_e_gerdtot_bibentry, "Bibtex")

## ----structure, echo=FALSE, message=FALSE-------------------------------------
include_graphics(here("vignettes", "dataset_structure.png"))

## ----dimreduction, echo=FALSE, message=FALSE----------------------------------
include_graphics(here("vignettes", "RDF_chart_1.png"))

