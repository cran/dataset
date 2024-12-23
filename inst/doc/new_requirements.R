## ----vignettesetup, include = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----smallcountrydataset------------------------------------------------------
options(sciphen=4)
small_country_dataset <- dataset_df(
  country_name = defined(
    c("AD", "LI"),
    definition = "http://data.europa.eu/bna/c_6c2bb82d", 
    namespace = "https://www.geonames.org/countries/$1/"), 
  gdp = defined(
    c(3897, 7365), 
    label = "Gross Domestic Product", 
    unit = "million dollars", 
    definition = "http://data.europa.eu/83i/aa/GDP"), 
  population = defined(
    c(77543, 40015), 
    label = "Population",
    definition = "http://data.europa.eu/bna/c_f2b50efd"), 
  dataset_bibentry = dublincore(
        creator = person(given="Jane", family="Doe"), 
        title = "Small Country Dataset", 
        publisher = "Reprex"
  )
)

## ----summaryhavenunit---------------------------------------------------------
summary(small_country_dataset$gdp)

## ----percapita----------------------------------------------------------------
small_country_dataset$gdp_capita <- defined(
  small_country_dataset$gdp*1e6 / small_country_dataset$population, 
  unit = "dollar", 
  label = "GDP Per Capita")

## ----smallmusiciandataset1----------------------------------------------------
small_country_musicians <- data.frame(
  qid = c("Q275912", "Q116196078"),
  artist_name = defined(
    c("Marta Roure", "wavvyboi"), 
    definition = "https://www.wikidata.org/wiki/Property:P2093"), 
  location = defined(
    c("Andorra", "Lichtenstein"), 
    definition = "https://www.wikidata.org/wiki/Property:P276"), 
  date_of_birth = defined(
    c(as.Date("1981-01-16"), as.Date("1998-04-28")), 
      definition = "https://www.wikidata.org/wiki/Property:P569")
)

small_country_musicians$age <- defined(
  2024-as.integer(substr(as.character(small_country_musicians$date_of_birth), 1,4)), 
  label = "Age in 2024")


## ----summarymusicians---------------------------------------------------------
summary(small_country_musicians)

## ----installwbdataset, eval=FALSE---------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("dataobservatory-eu/wbdataset")

## ----examplewbdataset, eval=FALSE---------------------------------------------
#  library(wbdataset)
#  get_item(qid=c("Q228", "Q347"),
#           language=c("en", "nl"),
#           creator=person("Jane Doe"),
#           title="Small Countries")

## ----smallcountrydataset2-----------------------------------------------------
small_country_musicians <- data.frame(
  qid = c("Q275912", "Q116196078"),
  label = c("Marta Roure", "wavvyboi"), 
  P276 = c("Andorra", "Lichtenstein"), 
  P569 = c(as.Date("1981-01-16"), as.Date("1998-04-28"))
)

## And the age
small_country_musicians$P3629 <- 2024-as.integer(substr(small_country_musicians$P569, 1,4))

small_country_musicians

## ----smallcountrydataset3-----------------------------------------------------
small_country_musicians <- data.frame(
  qid = c("Q275912", "Q116196078"),
  label = c("Marta Roure", "wavvyboi"), 
  P276 = c("Q228", "Q347"), 
  P569 = c(as.Date("1981-01-16"), as.Date("1998-04-28"))
)

## And the age
small_country_musicians$P3629 <- 2024-as.integer(substr(small_country_musicians$P569, 1,4))

small_country_musicians$P569 <- dataset::xsd_convert(small_country_musicians$P569)
small_country_musicians$P3629 <- dataset::xsd_convert(small_country_musicians$P3629)

small_country_musicians

## ----definecountry------------------------------------------------------------
small_country_musicians$P276 <- paste0("https://www.wikidata.org/wiki/", small_country_musicians$P276)
small_country_musicians[, 2:4]

