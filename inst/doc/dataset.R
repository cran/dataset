## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## ---- include=FALSE-----------------------------------------------------------
library(here)
library(knitr)

## ---- message=FALSE-----------------------------------------------------------
rd_e_gerdtot <- eurostat::get_eurostat('rd_e_gerdtot')
head(rd_e_gerdtot)

## -----------------------------------------------------------------------------
dimensions(rd_e_gerdtot) <- c("geo", "time", "sectperf")

## -----------------------------------------------------------------------------
measures(rd_e_gerdtot) <- "value"

## -----------------------------------------------------------------------------
attributes_measures(rd_e_gerdtot) <- "unit"
datacite(rd_e_gerdtot)

## ---- include=TRUE------------------------------------------------------------
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

