## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(dataset)
library(here)
description(iris_dataset) <- "This famous (Fisher's or Anderson's) iris data set 
gives the measurements in centimeters of the variables sepal length and width 
and petal length and width, respectively, for 50 flowers from each of 
three species of iris."

## ---- eval=FALSE--------------------------------------------------------------
#  library(dataspice)
#  dataset_to_dataspice <- function(
#      ds,
#      fileName = "https://zenodo.org/record/7421899/files/iris.csv?download=1",
#      aux_path = file.path(tempdir()),
#      geographicDescription = "Gaspe Peninsula, Canada",
#      dataspice_path = here::here("dataspice"),
#      southBoundCoord = "47.976593",
#      northBoundCoord = "49.2526866",
#      eastBoundCoord = "-64.504089",
#      westBoundCoord = "-66.7947692",
#      startDate = "1935",
#      endDate = "1935",
#      var_labels = c(
#        "Measurement of sepal lenght (cm)",
#        "Measurement of sepal width (cm)",
#        "Measurement of petal length (cm)",
#        "Measurement of petal width (cm)",
#        "Name of species, iris [species]"
#      ),
#      unitText = c(rep("centimeter", 4), NA_character_)
#  ) {
#    access <- data.frame(
#    fileName = fileName,
#    name = NA_character_,
#    contentUrl	= NA_character_,
#    encodingFormat = NA_character_
#  )
#  
#  write.csv(x = access,
#            file = file.path(aux_path, "access.csv"),
#            row.names = F)
#  
#  title_text <- dataset_title(ds)$Title[1]
#  if (is.null(title_text)) title_text <- "Unknown"
#  
#  biblio <- data.frame(
#    title	= title_text,
#    description	= description(ds),
#    datePublished	= attr(ds, "Issued"),
#    citation = NA_character_,
#    keywords = NA_character_,
#    license	= rights(ds),
#    funder = NA_character_,
#    geographicDescription	= geographicDescription,
#    northBoundCoord 	= northBoundCoord,
#    eastBoundCoord		= eastBoundCoord,
#    southBoundCoord		= southBoundCoord,
#    westBoundCoord		= westBoundCoord,
#    wktString	= NA_character_,
#    startDate		= startDate,
#    endDate	= endDate
#  )
#  
#  write.csv(x = biblio, file = file.path(aux_path, "biblio.csv"), row.names = F)
#  
#  creators <- data.frame(
#    id = NA_character_,
#    name = as.character(creator(ds)),
#    affiliation  = NA_character_
#  )
#  
#  write.csv(x = creators,
#            file = file.path(aux_path, "creators.csv"),
#            row.names = F)
#  
#  variableName = names(ds)
#  
#  attributes <- data.frame(
#    fileName = rep(NA_character_, length(variableName)),
#    variableName = 	variableName,
#    description	= var_labels,
#    unitText = unitText
#  )
#  
#  write.csv(x = attributes,
#            file = file.path(aux_path, "attributes.csv"),
#            row.names = F)
#  
#  write_spice(aux_path)
#  file.copy(file.path(aux_path, "dataspice.json"),
#            file.path(dataspice_path, "dataspice.json"),
#            overwrite = T)
#  
#  build_site(path = file.path(dataspice_path, "dataspice.json"),
#             out_path = here::here("dataspice", "index.html"))
#  }
#  

## ---- eval=FALSE--------------------------------------------------------------
#  dataset_to_dataspice(iris_dataset)

