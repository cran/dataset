## ----setupRDFvignette, include = FALSE----------------------------------------
library(knitr)
knitr::opts_chunk$set(
  collapse = TRUE,
  message  = FALSE,
  comment = "#>",
  out.width = '90%'
)
library(here)
library(readxl)
library(kableExtra)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----importexamplexlsx--------------------------------------------------------
example_df <- readxl::read_excel(
  system.file("extdata", "rdf_example.xlsx", package = "dataset"), 
  sheet = "dataset-wide")

## ----printexampledataset------------------------------------------------------
example_dataset <- dataset (
  x = example_df,
  Dimensions = c("time", "geo", "sex"),
  Measures = "value", 
  Attributes = c("freq", "status")
)

attr(example_dataset, "local_id") <- 'rowid'

## ----dimreduction, echo=FALSE, message=FALSE----------------------------------
include_graphics(here("vignettes", "RDF_chart_1.png"))

## ----localid, message=FALSE---------------------------------------------------
example_ds <- dataset_uri(ds = example_dataset) 
example_ds

## ----subsetting---------------------------------------------------------------
subset( example_ds, select = c("URI", "value"))

## ----nqfile-------------------------------------------------------------------
nq_file <- file.path(tempdir(), "triple_file.nq")

## ----rdflib-------------------------------------------------------------------
library(rdflib)
rdf <- rdf()

for ( i in seq_len(nrow(example_ds))) {
  rdf %>% 
  rdf_add("", 
          predicate = example_ds$URI[i], 
          object = example_ds$value[i])
}

rdf_serialize(rdf, doc = nq_file)

## ----parsenqfile--------------------------------------------------------------
rdf_parse(nq_file) 

## ----longform-----------------------------------------------------------------
library(dplyr)
long_dataset <- example_dataset %>%
  select ( -.data$value) %>%
  mutate_all( as.character)  %>%
  tidyr::pivot_longer(cols = any_of(c("geo", "sex", "time", "unit", "freq", "status")), 
                      names_to = "predicate",
                      values_to = "object") %>%
  bind_rows( example_dataset %>%
  select ( all_of(c("rowid","value"))) %>%
    mutate_all(as.character) %>%
  tidyr::pivot_longer(cols = any_of(c("value")), 
                      names_to = "predicate",
                      values_to = "object") %>%
    mutate ( object = as.character(object))) %>%
  rename ( URI = .data$rowid) %>%
  mutate ( URI = paste0("https:://example.org/my_data/", .data$URI))

long_dataset %>% head()

## ----dimreduction2, echo=FALSE, message=FALSE, out.width='75%'----------------
knitr::include_graphics(here("vignettes", "RDF_chart_2.png"))

## ----rdf2---------------------------------------------------------------------
rdf2 <- rdf()

for ( i in seq_len(nrow(long_dataset))) {
  rdf2 %>% 
     rdf_add(subject = long_dataset$URI[i],
             predicate = long_dataset$predicate[i], 
             object = long_dataset$object[i])
}

rdf2

## ---- include=FALSE-----------------------------------------------------------
rdf <- NULL
rdf2 <- NULL

## ----statcodelistsexample, eval=FALSE-----------------------------------------
#  set.seed(2022)
#  library(statcodelists)
#  
#  example_long %>%
#     filter (.data$component == "sex") %>%
#     left_join(statcodelists::CL_SEX %>%
#                rename ( value = .data$id ),
#              by = "value") %>%
#    bind_rows (
#      example_long %>%
#        filter (.data$component == "freq") %>%
#        left_join(statcodelists::CL_FREQ %>%
#                dplyr::rename ( value = .data$id ),
#              by = "value")
#    )  %>%
#      bind_rows (
#      example_long %>%
#        filter (.data$component == "status") %>%
#        left_join(statcodelists::CL_OBS_STATUS %>%
#                dplyr::rename ( value = .data$id ),
#              by = "value")
#    ) %>%
#    group_by (.data$component) %>%
#    sample_frac( size = 0.3 ) %>%
#    kableExtra::kbl() %>%
#    kableExtra::kable_paper()
#  

