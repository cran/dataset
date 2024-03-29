
#' @rdname dataset
#' @export
as_dataset <- function(x,
                       author,
                       title,
                       publisher = NULL,
                       year = NULL,
                       identifier = NULL,
                       description = NULL,
                       version = NULL,
                       datasubject = NULL,
                       language = NULL,
                       datasource = NULL,
                       rights = NULL) {
  UseMethod("as_dataset", x)
}

#' @rdname dataset
#' @importFrom utils bibentry
#' @export
as_dataset.data.frame <- function(x,
                                  author,
                                  title,
                                  publisher = NULL,
                                  year = NULL,
                                  identifier = NULL,
                                  description = NULL,
                                  version = NULL,
                                  datasubject = NULL,
                                  language = NULL,
                                  datasource = NULL,
                                  rights = NULL) {

  start_time <- Sys.time()

  DataBibentry  <- as_bibentry(bibtype="Misc",
                               title = title,
                               author = author,
                               publisher = publisher,
                               year = year,
                               resourceType = "Dataset",
                               identifier = identifier,
                               version = version,
                               description  = description,
                               language = language,
                               datasource = datasource,
                               rights = rights)

  if (is.null(datasubject)) datasubject <- new_Subject("")

  end_time <- Sys.time()
  provenance <- provenance_add(start_time=start_time,
                               end_time=end_time,
                               informed_by = datasource)

  new_dataset(x,
              DataBibentry = DataBibentry,
              datasubject  = datasubject,
              provenance   = provenance)

}
