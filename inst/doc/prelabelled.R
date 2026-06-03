## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)

## ----countrydata1-------------------------------------------------------------
country_data_1 <- data.frame(
  country = c("Andorra", "LI", "San Marino", "AD", "Liechtenstein"),
  time = c(2020, 2020, 2020, 2021, 2021),
  value = c(1.2, 2.4, 3.1, 1.3, 2.5)
  )

## ----countrymap1--------------------------------------------------------------
country_map <- c(
  "Andorra" = "AD",
  "Liechtenstein" = "LI",
  "San Marino" = "SM"
)

country_data_1$country <-
  prelabel(
    country_data_1$country,
    labels = country_map
  )

## ----printcountrydata1--------------------------------------------------------
print(country_data_1$country)

## ----countrydata2-------------------------------------------------------------
country_data_2 <- data.frame(
  country = as.character(country_data_1$country),
  time = country_data_1$time,
  value = country_data_1$value
)

country_data_2

## ----countrydata3-------------------------------------------------------------
country_data_3 <- data.frame(
  country = c(
    "AD", "AND", "LI", "LIE", "SMR", "San Marino"
  ),
  time = c(2020, 2020, 2020, 2021, 2021, 2021),
  value = c(1, 2, 3, 4, 5, 6)
)

## ----countrymap3--------------------------------------------------------------
country_map_3 <- c(
  "Andorra" = "AD",
  "Andorra" = "AND",
  "Liechtenstein" = "LI",
  "San Marino" = "SM",
  "San Marino" = "SMR"
)

prelabelled_country <- prelabel(
  country_data_3$country,
  labels = country_map_3
)

## -----------------------------------------------------------------------------
prelabelled_country

## -----------------------------------------------------------------------------
as.character(prelabelled_country)

## -----------------------------------------------------------------------------
as_character(prelabelled_country)

