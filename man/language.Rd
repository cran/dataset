% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/language.R
\name{language}
\alias{language}
\alias{language<-}
\title{Get/Set the primary language of the dataset}
\usage{
language(x)

language(x, iso_639_code = "639-3") <- value
}
\arguments{
\item{x}{An R object, such as a data.frame, a tibble, or a character vector.}

\item{iso_639_code}{Defaults to \code{ISO 639-3}, alternative is \code{ISO 639-1}.}

\item{value}{The language to be added to the object attributes, added by name, or
as a 2- or 3-character code for the language. You can add a language code or language name,
and the parameter is normalized to \code{tolower(language)}. (The ISO 639 standard capitalizes
language names and uses lower case for the codes.)}
}
\value{
The Language is added to the \code{x} as
\code{ISO 639-1}, the Datacite recommendation, or \code{ISO 639-3} used by the
Zenodo data repository.
}
\description{
Add the optional Language property as an attribute to an R object.
}
\details{
Language is an optional property in
\href{https://support.datacite.org/docs/schema-optional-properties-v43#13-size}{DataCite 4.3} and
it is part of the "core" of the
\href{https://www.dublincore.org/specifications/dublin-core/dcmi-terms/}{Dublin Core metadata terms}.
The language parameter is validated against the \code{[ISOcodes]{ISO_639_2}} table.\cr
The attribute \code{language} is added to the object. It will be exported into DataCite
applications in a capitalized \code{Lanugage} format.
}
\examples{
iris_dataset <- iris
language(iris_dataset) <- "English"
language(iris_dataset)
}
\seealso{
Other Reference metadata functions: 
\code{\link{creator}()},
\code{\link{dataset_source}()},
\code{\link{description}()},
\code{\link{geolocation}()},
\code{\link{identifier}()},
\code{\link{publication_year}()},
\code{\link{publisher}()},
\code{\link{rights}()},
\code{\link{size}()},
\code{\link{version}()}
}
\concept{Reference metadata functions}
