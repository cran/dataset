#' @title Get/set the Geolocation of the object.
#' @description Get/set the optional \code{Geolocation} property as an attribute to an
#' R object.
#' @details The \code{Geolocation} is recommended for discovery in DataCite.
#' Spatial region or named place where the data was gathered
#' or about which the data is focused.
#' @param x An R object, such as a data.frame, a tibble, or a data.table.
#' @param value The  \code{Geolocation} as a character string.
#' @param overwrite If the attributes should be overwritten. In case it is set to \code{FALSE},
#' it gives a message with the current \code{Geolocation} property instead of overwriting it.
#' Defaults to \code{TRUE} when the attribute is set to \code{value} regardless of previous
#' setting.
#' @return The \code{Geolocation} attribute as a character of length 1 is added to \code{x}.
#' @examples
#' iris_dataset <- iris
#' geolocation(iris_dataset) <- "US"
#' geolocation(iris_dataset)
#'
#' geolocation(iris_dataset, overwrite = FALSE) <- "GB"
#'
#' @family Reference metadata functions
#' @export
geolocation <- function(x) {
  attr(x, "Geolocation")
}

#' @rdname geolocation
#' @export
`geolocation<-` <- function(x,  overwrite = TRUE, value) {

  if (is.null(attr(x, "Geolocation"))) {
    if (is.null(value)) {
      attr(x, "Geolocation") <- NA_character_
    } else {
      attr(x, "Geolocation") <- value
    }
  } else if ( overwrite ) {
    attr(x, "Geolocation") <- value
  } else {
    message ("The dataset has already an Geolocation: ",  geolocation(x) )
  }
  x
}
