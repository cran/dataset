% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset_prov.R
\name{dataset_prov}
\alias{dataset_prov}
\title{Create a dataset provenance}
\usage{
dataset_prov(
  x = NULL,
  dataset_id = "eg:dataset#",
  author,
  start_time = Sys.time(),
  end_time = Sys.time()
)
}
\arguments{
\item{x}{dataset object created by \code{\link[=dataset]{dataset()}} or \code{\link[=as_dataset]{as_dataset()}}.}

\item{author}{A single person or a vector of persons as authors, declared with
\code{\link[utils:person]{person}}.}

\item{start_time}{Starting time of the dataset creation process.}

\item{end_time}{Ending time fo the dataset creation process.}
}
\value{
A triple-format data.frame with the provenance information.
}
\description{
Create a Turtle format description of the dataset's provenance.
}
\keyword{internal}
