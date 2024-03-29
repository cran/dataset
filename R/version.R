#' @title Get/set the version of the object.
#' @description Get/set the optional \code{Version} property as an attribute to an R object.
#' @details \code{Version} is an optional property in DataCite 4.4. See:
#' \href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#15-version}{datacite:Size}.
#' It is not part of the "core" Dublin Core terms, but ...
#' \href{https://www.dublincore.org/specifications/dublin-core/dcmi-terms/}{Dublin Core metadata terms}.
#' @param x An R object, such as a data.frame, a tibble, or a data.table.
#' @param value The \code{Version} as a character set.
#' @param overwrite If the \code{Version} attribute should be overwritten. In case it is set to \code{FALSE},
#' it gives a message with the current\code{Version} property instead of overwriting it.
#' Defaults to \code{TRUE} when the attribute is set to \code{value} regardless of previous
#' setting.
#' @return The \code{Version} attribute as a character of length 1 is added to \code{x}.
#' @examples
#' iris_dataset <- iris
#' version(iris_dataset) <- "1.0"
#' version(iris_dataset)
#' @family Reference metadata functions
#' @export
version <- function(x) {
  attr(x, "Version")
}

#' @rdname version
#' @export
`version<-` <- function(x, overwrite = FALSE, value ) {

  if (is.null(value)) {
    attr(x, "Version") <- NULL
    return(x)
  }

  if ( length(value)>1) {
   stop("version(x) <- value: value must be a character string or a number that can be coerced into a character string of length=1.")
  }


  if ((is.null(attr(x, "Version"))) | overwrite ) {
    attr(x, "Version") <- value
  } else {
    message("The object already has a Version property:", version(x),
            "\nYou can set a new version with version(x, overwrite=TRUE) <- ", value)
  }

  x
}
