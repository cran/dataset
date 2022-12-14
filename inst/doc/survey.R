## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)
library(declared)

## ---- eval=FALSE--------------------------------------------------------------
#  remotes::install_github('dusadrian/declared')

## ----vectordefinition---------------------------------------------------------
obs_id <- c("Saschia Iemand", "Jane Doe", "Jack Doe", "Pim Iemand", "Matti Virtanen" )
sex <- declared ( c(1,1,0,-1,1), 
                  labels = c(Male = 0, Female = 1, DK = -1), 
                  na_values = -1)
geo <- c("NL-ZH", "IE-05", "GB-NIR", "NL-ZH", "FI1C")

## ----declareddefinition-------------------------------------------------------
difficulty_bills <- declared (
  c(0,1,2,-1,0), 
  labels = c(Never = 0, Time_to_time = 1, Always = 2, DK = -1)
  )
age_exact <- declared (
  c( 34,45,21,55,-1), 
  labels = c( A = 34,A = 45,A  = 21, A= 55, DK = -1)
)
listen_spotify <- declared (
  c(0,1,9,0,1),
  labels = c( No = 0, Yes = 1,Inap = 9), 
  na_values = 9
)

## ----dataframedefinition------------------------------------------------------
raw_survey <- data.frame ( 
  obs_id = obs_id, 
  geo = geo, 
  listen_spotify = listen_spotify,
  sex = sex,
  age_exact = age_exact, 
  difficulty_bills = difficulty_bills
)

survey_dataset  <- dataset( x= raw_survey,
                            Dimensions = "geo", 
                            Measures = c("listen_spotify", "sex",
                                         "age_exact", "difficulty_bills"), 
                            Attributes = NULL, 
                            sdmx_attributes = "geo", 
                            Title = "Tiny Survey", 
                            Creator = person("Jane", "Doe"))

## ----dublincore---------------------------------------------------------------
dublincore(survey_dataset)

## -----------------------------------------------------------------------------
# This is not valied in declared
listen_spotify <- declared(
  c(0,1,9,0,1),
  labels = c( No = 0, Yes = 1,Inap = 9, DK =-1), 
  na_values = c(9, -1)
  )

## ----printadecleared----------------------------------------------------------
print(listen_spotify)

## ----concatenatedeclared------------------------------------------------------
c(listen_spotify, declared(
  c(-1,-1,-1),
  labels = c( No = 0, Yes = 1,Inap = 9, DK =-1)
  ))

## ----summarizedeclared--------------------------------------------------------
summary(listen_spotify)

## ----dataciteadataset---------------------------------------------------------
survey_dataset <- dublincore_add(survey_dataset, 
                               Title = "Tiny Survey", 
                               Creator = person("Daniel", "Antal"), 
                               Identifier = "https://doi.org/xxxx.yyyyy",
                               Publisher = "Reprex", 
                               Date = 2022, 
                               Subject = "Surveys", 
                               Language = "en")

## ----showdublincore-----------------------------------------------------------
dublincore(survey_dataset)

## ----summarizedataset---------------------------------------------------------
summary(survey_dataset)

