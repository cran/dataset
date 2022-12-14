% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rights.R
\name{rights}
\alias{rights}
\alias{rights<-}
\title{Get/set the Rights of the object.}
\usage{
rights(x)

rights(x, overwrite = TRUE) <- value
}
\arguments{
\item{x}{An R object, such as a data.frame, a tibble, or a data.table.}

\item{overwrite}{If the \code{Rights} attribute should be overwritten. In case it is set to \code{FALSE},
it gives a message with the current \code{Rights} property instead of overwriting it.
Defaults to \code{TRUE} when the attribute is set to \code{value} regardless of previous
setting.}

\item{value}{The \code{Rights} as a character set.}
}
\value{
The \code{Rights} attribute as a character of length 1 is added to \code{x}.
}
\description{
Get/set the optional \code{Rights} property as an attribute to an
R object.
}
\details{
\code{Rights} corresponds to
\href{https://purl.org/dc/elements/1.1/rights}{dct:rights} and
\code{\link{datacite}} Rights. Information about rights held in and over the resource.
Typically, rights information includes a statement about various property rights associated with the resource,
including intellectual property rights.
}
\examples{
iris_dataset <- iris
rights(iris_dataset) <- "CC-BY-SA"
rights(iris_dataset)
}
\seealso{
Other Reference metadata functions: 
\code{\link{creator}()},
\code{\link{dataset_source}()},
\code{\link{description}()},
\code{\link{geolocation}()},
\code{\link{identifier}()},
\code{\link{language}},
\code{\link{publication_year}()},
\code{\link{publisher}()},
\code{\link{size}()},
\code{\link{version}()}
}
\concept{Reference metadata functions}
