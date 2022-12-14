## ---- include = FALSE---------------------------------------------------------
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
dataset_title(iris_dataset)
publisher(iris_dataset)

## ---- include=FALSE, message=FALSE--------------------------------------------
library(here)
library(knitr)

## ----eurostat-example, message=FALSE------------------------------------------
rd_e_gerdtot <- eurostat::get_eurostat('rd_e_gerdtot')
head(rd_e_gerdtot)

## -----------------------------------------------------------------------------
dimensions(rd_e_gerdtot) <- c("geo", "time", "sectperf")

## -----------------------------------------------------------------------------
measures(rd_e_gerdtot) <- "value"

## ----attributes---------------------------------------------------------------
attributes_measures(rd_e_gerdtot) <- "unit"
datacite(rd_e_gerdtot)

## ----datacite, include=TRUE---------------------------------------------------
toc <- eurostat::get_eurostat_toc()
rd_e_gerdtot_reference <- toc[which(toc$code == "rd_e_gerdtot"),]

datacite_add(rd_e_gerdtot, 
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

## -----------------------------------------------------------------------------
datacite(rd_e_gerdtot)

## ----structure, echo=FALSE, message=FALSE-------------------------------------
include_graphics(here("vignettes", "dataset_structure.png"))

## ----dimreduction, echo=FALSE, message=FALSE----------------------------------
include_graphics(here("vignettes", "RDF_chart_1.png"))

