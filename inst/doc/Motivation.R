## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
if (!requireNamespace("dplyr", quietly = TRUE) || !requireNamespace("tidyr", quietly = TRUE)) {
  stop("Please install 'dplyr' and 'tidyr' to run this vignette.")
}

library(dplyr)
library(tidyr)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----example-ambiguity--------------------------------------------------------
data.frame(
  geo = c("LI", "SM"),
  CPI = c("0.8", "0.9"),
  GNI = c("8976", "9672")
)

## ----smallcountrydataset------------------------------------------------------
options(sciphen = 4)
small_country_dataset <- dataset_df(
  country_name = defined(
    c("AD", "LI"),
    concept = "http://data.europa.eu/bna/c_6c2bb82d",
    namespace = "https://www.geonames.org/countries/$1/"
  ),
  gdp = defined(
    c(3897, 7365),
    label = "Gross Domestic Product",
    unit = "million dollars",
    concept = "http://data.europa.eu/83i/aa/GDP"
  ),
  population = defined(
    c(77543, 40015),
    label = "Population",
    concept = "http://data.europa.eu/bna/c_f2b50efd"
  ),
  dataset_bibentry = dublincore(
    creator = person(given = "Jane", family = "Doe"),
    title = "Small Country Dataset",
    publisher = "Reprex"
  )
)

## ----percapita----------------------------------------------------------------
small_country_dataset$gdp_capita <- defined(
  small_country_dataset$gdp * 1e6 / small_country_dataset$population,
  unit = "dollar",
  label = "GDP Per Capita"
)

## ----gdpexmampel, warning=FALSE, message=FALSE--------------------------------
library(tibble)

# Dataset D (GDP in billions of USD)
D <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "CAN", "USA", "CAN", "USA", "CAN"),
  country_name = c("United States", "Canada", "United States", "Canada", "United States", "Canada"),
  GDP = c(21000, 2000, 22000, 2100, 23000, 2200) # GDP in billions of USD
)

# Dataset E (GDP in billions of EUR)
E <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "FRA", "USA", "FRA", "USA", "FRA"),
  country_name = c("United States", "France", "United States", "France", "United States", "France"),
  GDP = c(18000, 2500, 19000, 2600, 20000, 2700) # GDP in billions of EUR
)

## ----ambigousjoin-------------------------------------------------------------
full_join(D, E)

## ----strintc, eval=FALSE------------------------------------------------------
# GDP_D <- defined(c(21000, 2000, 22000, 2100, 23000, 2200), unit = "M_USD")
# GDP_E <- defined(c(18000, 2500, 19000, 2600, 20000, 2700), unit = "M_EUR")
# c(GDP_D, GDP_E)

## ----errormessage-------------------------------------------------------------
message("Error in c.haven_labelled_defined(GDP_D, GDP_E) :
  c.haven_labelled_defined(x,y): x,y must have no unit or the same unit")

## ----matchigunits-------------------------------------------------------------
GDP_F <- defined(c(21000, 2000, 22000, 2100, 23000, 2200), unit = "M_EUR")
GDP_E <- defined(c(18000, 2500, 19000, 2600, 20000, 2700), unit = "M_EUR")
c(GDP_F, GDP_E)

## ----d-enriched---------------------------------------------------------------
D_enriched <- dataset_df(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "CAN", "USA", "CAN", "USA", "CAN"),
  country_name = c("United States", "Canada", "United States", "Canada", "United States", "Canada"),
  GDP = c(21000, 2000, 22000, 2100, 23000, 2200),
  dataset_bibentry = dataset::dublincore(
    title = "North American GDP Dataset",
    description = "Dataset containing GDP data for North American countries.",
    creator = person("Daniel", "Antal"), # Replace with the actual creator
    publisher = "Reprex",
    dataset_date = Sys.Date(),
    subject = "GDP"
  )
)

D_enriched

## ----ambigousjoinwithdplyr----------------------------------------------------
library(tibble)

# Dataset D (GDP in billions of USD)
D <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "CAN", "USA", "CAN", "USA", "CAN"),
  country_name = c(
    "United States", "Canada", "United States",
    "Canada", "United States", "Canada"
  ),
  GDP = c(21000, 2000, 22000, 2100, 23000, 2200) # GDP in billions of USD
)

# Dataset E (GDP in billions of EUR)
E <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "FRA", "USA", "FRA", "USA", "FRA"),
  country_name = c("United States", "France", "United States", "France", "United States", "France"),
  GDP = c(18000, 2500, 19000, 2600, 20000, 2700) # GDP in billions of EUR
)

joined_data <- dplyr::full_join(D, E)
joined_data

## ----two-gdp-datasets---------------------------------------------------------
library(tibble)

# Dataset D (GDP in billions of USD)
D <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "CAN", "USA", "CAN", "USA", "CAN"),
  country_name = c(
    "United States", "Canada", "United States",
    "Canada", "United States", "Canada"
  ),
  GDP = c(21000, 2000, 22000, 2100, 23000, 2200) # GDP in billions of USD
)

# Dataset E (GDP in billions of EUR)
E <- tibble(
  year = c(2020, 2020, 2021, 2021, 2022, 2022),
  geocode = c("USA", "FRA", "USA", "FRA", "USA", "FRA"),
  country_name = c(
    "United States", "France", "United States",
    "France", "United States", "France"
  ),
  GDP = c(18000, 2500, 19000, 2600, 20000, 2700) # GDP in billions of EUR
)

# Combine datasets
combined <- bind_rows(D, E)

# Convert all to character *before* pivoting
combined_char <- combined %>%
  mutate(across(everything(), as.character))

# Rename geocode to subject
combined_subject <- combined_char %>%
  rename(subject = geocode)

# Pivot longer, excluding the subject (triples are named, but predicates are not renamed yet)
named_triples <- combined_subject %>%
  pivot_longer(
    cols = c(year, country_name, GDP),
    names_to = "predicate",
    values_to = "object"
  )

# Replace geocodes with Geonames IDs and add datatype annotations
geonames_mapping <- tibble(
  subject = c("USA", "CAN", "FRA"),
  geonames_id = c("6252001", "6251999", "2988317")
)

rdf_triples <- named_triples %>%
  left_join(geonames_mapping, by = "subject") %>%
  mutate(
    subject = paste0("geonames:", geonames_id),
    predicate = case_when(
      predicate == "year" ~ "sdmx:TIME_PERIOD",
      predicate == "country_name" ~ "schema:name",
      predicate == "GDP" ~ "sdmx:OBS_VALUE",
      TRUE ~ predicate
    ),
    object = case_when(
      predicate == "sdmx:TIME_PERIOD" ~ paste0("\"", object, "\"^^<http://www.w3.org/2001/XMLSchema#gYear>"),
      predicate == "sdmx:OBS_VALUE" ~ paste0("\"", object, "\"^^<http://www.w3.org/2001/XMLSchema#double>"),
      TRUE ~ object
    )
  ) %>%
  select(subject, predicate, object)

print("RDF Triples (subject, predicate, object):")
print(rdf_triples)

## ----smallmusiciandataset1----------------------------------------------------
small_country_musicians <- data.frame(
  qid = c("Q275912", "Q116196078"),
  artist_name = defined(
    c("Marta Roure", "wavvyboi"),
    concept = "https://www.wikidata.org/wiki/Property:P2093"
  ),
  location = defined(
    c("Andorra", "Lichtenstein"),
    concept = "https://www.wikidata.org/wiki/Property:P276"
  ),
  date_of_birth = defined(
    c(as.Date("1981-01-16"), as.Date("1998-04-28")),
    concept = "https://www.wikidata.org/wiki/Property:P569"
  )
)

small_country_musicians$age <- defined(
  2024 - as.integer(
    substr(
      as.character(small_country_musicians$date_of_birth),
      1, 4
    )
  ),
  label = "Age in 2024"
)

