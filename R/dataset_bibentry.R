#' @title Get the bibliographic entries of a dataset
#' @description A dataset constructed with \code{\link{dataset}} records most of the
#' dataset-level metadata in a \code{bibentry} object.
#' A dataset constructed with \code{\link{dataset}} records most of the
#' dataset-level metadata in a bibentry object. This class is defined in the
#' _utils_ package, and it is installed by default with R;
#' using the gives wide interoperability with other packages and allows
#' printing or saving the bibliographic record in HTML, BibLatex and other
#' formats. For further information see \code{utils::\link[utils]{bibentry}}.
#' @param x A dataset object created with \code{dataset::\link{dataset}}.
#' @return The \code{\link[utils]{bibentry}} object of the dataset.
#' @importFrom utils bibentry
#' @examples
#' ds <- dataset(iris,
#'         title = "The iris Dataset",
#'         author = c(
#'            person(family ="Anderson",
#'                   given ="Edgar",
#'                   role = "aut")
#'                  ),
#'          identifier = "https://doi.org/10.1111/j.1469-1809.1936.tb02137.x",
#'          year = "1935",
#'          version = "1.0",
#'          description = "The famous dataset that is distributed with R.",
#'          url = "https://en.wikipedia.org/wiki/Iris_flower_data_set",
#'          resourceType = "Dataset"
#'          )
#'
#' dataset_bibentry(ds)
#' @export

dataset_bibentry <- function(x) {

  DataBibentry <- attr(x, "DataBibentry")
  DataBibentry
}
