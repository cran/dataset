#' @title Get/set the Rights of the object.
#' @description Get/set the optional \code{Rights} property as an attribute to an
#' R object.
#' @details \code{Rights} corresponds to
#' \href{https://www.dublincore.org/specifications/dublin-core/dcmi-terms/elements11/rights/}{dct:rights} and
#' \code{\link{datacite}} Rights. Information about rights held in and over the resource.
#' Typically, rights information includes a statement about various property
#' rights associated with the resource, including intellectual property rights.
#' @param x A semantically rich data frame object created by  \code{dataset::\link{dataset_df}} or
#'  \code{dataset::\link{as_dataset_df}}.
#' @param value The \code{Rights} as a character set.
#' @param overwrite If the \code{Rights} attribute should be overwritten. In case it
#' is set to \code{FALSE}, it gives a message with the current \code{Rights}
#' property instead of overwriting it. Defaults to \code{FALSE}.
#' @return The \code{Rights} attribute as a character of length 1 is added to \code{x}.
#' @examples
#' rights(orange_df) <- "CC-BY-SA"
#' rights(orange_df)
#' @family Reference metadata functions
#' @export
rights <- function(x) {
  assertthat::assert_that(is.dataset_df(x),
    msg = "rights(x): x must be a dataset object created with dataset_df() or as_dataset_df()."
  )

  DataBibentry <- get_bibentry(x)
  as.character(DataBibentry$rights)
}

#' @rdname rights
#' @export
`rights<-` <- function(x, overwrite = FALSE, value) {
  assertthat::assert_that(is.dataset_df(x),
    msg = "rights(x): x must be a dataset object created with dataset_f() or as_dataset_df()."
  )

  assertthat::assert_that(is.null(value) | length(value) == 1,
    msg = "rights(x): x must have length=1 (or set to NUL)."
  )

  DataBibentry <- invisible(get_bibentry(x))

  if (is.null(value)) {
    DataBibentry$rights <- ":unas"
    attr(x, "dataset_bibentry") <- DataBibentry
    return(invisible(x))
  }

  if (length(value) > 1) {
    stop("rights(x) <- value: value must be of length 1.")
  }

  is_unas <- DataBibentry$rights == ":unas"

  if (is.null(DataBibentry$rights)) {
    DataBibentry$rights <- value
  } else if (is_unas) {
    DataBibentry$rights <- value
  } else if (overwrite) {
    DataBibentry$rights <- value
  } else {
    message("The dataset has already a rights field: ", DataBibentry$rights)
  }

  attr(x, "attribtes_bibentry") <- DataBibentry
  invisible(x)
}
