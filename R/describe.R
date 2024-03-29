#' @title Describe a dataset object
#' @description Print to the screen an easy-to-read summary of a
#' the attributes of a dataset.
#' @details
#' A convenience function to review the most important attributes of a dataset
#' object. The dataset class adds a wide range of metadata as attributes to
#' data.frame, tibble, data.table or similar R object that contains tabular data.
#' Overviewing these attributes becomes cumbersome with base
#' R \code{attributes()}.
#' @param x A dataset object created with \code{dataset::\link{dataset}}.
#' @return No object is returned, but they key attributes are printed on the screen.
#' @examples
#' describe(iris_dataset)
#' @export
describe <- function(x) {
  UseMethod("describe", x)
}

#' @rdname describe
#' @exportS3Method
describe.dataset <- function(x){

  empty_values <- c("", ":unas", ":tba")

  assertthat::assert_that(is.dataset(x),
                          msg="describe(ds): ds must be a dataset object.")

  DataBibentry <- attr(x, "DataBibentry")

  title_row <- if("version" %in% names(DataBibentry[[1]])) {
    paste0(cat(DataBibentry[[1]]$title
               , " [ version:",
               DataBibentry[[1]]$version, "]\n"))
  } else {
    cat(DataBibentry[[1]]$title, "\n")
  }


  col_num <- dim(x)[2]
  row_num <- dim(x)[1]
  row_num <- ifelse (row_num>1, paste0(row_num, " observations (rows)"), paste0(row_num, " observation (row)"))
  col_num <- ifelse (col_num>1, paste0(col_num, " variables (columns)"), paste0(col_num, " variable (column)"))
  cat(paste0(DataBibentry[[1]]$resourceType, " with ", row_num, " and ", col_num, ".\n"  ))

  dataset_description <- description(x)

  if(! is.null(dataset_description) & ! dataset_description %in% empty_values ) {
    cat(paste0("Description: ", as.character(dataset_description), "\n"))
  }

  dataset_author <- creator(x)

  if(! is.null(dataset_author) & ! dataset_author %in% empty_values ) {
    cat(paste0("Creator: ", as.character(dataset_author), "\n"))
  }

  dataset_publisher <- publisher(x)

  if(! is.null(dataset_publisher) & ! dataset_publisher %in% empty_values ) {
    cat(paste0("Publisher: ", as.character(dataset_publisher), "\n"))
  }

  dataset_rights <- rights(x)

  if(! is.null(dataset_rights) & ! dataset_rights %in% empty_values ) {
    cat(paste0("Rights: ", as.character(dataset_rights), "\n"))
  }

}
