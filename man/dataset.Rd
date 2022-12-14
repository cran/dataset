% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset.R
\name{dataset}
\alias{dataset}
\alias{is.dataset}
\alias{as.data.frame}
\alias{as.data.frame.dataset}
\alias{subset.dataset}
\alias{[.dataset}
\alias{summary.dataset}
\alias{print.dataset}
\title{Structure a data frame to dataset}
\usage{
dataset(
  x,
  Dimensions = NULL,
  Measures = NULL,
  Attributes = NULL,
  sdmx_attributes = NULL,
  Title = NULL,
  Label = NULL,
  Creator = NULL,
  Publisher = NULL,
  Issued = NULL,
  Identifier = NULL,
  Subject = NULL,
  Type = "DCMITYPE:Dataset"
)

is.dataset(x)

as.data.frame(x, ...)

\method{as.data.frame}{dataset}(x, ...)

\method{subset}{dataset}(x, ...)

\method{[}{dataset}(x, i, j, ...)

\method{summary}{dataset}(object, ...)

\method{print}{dataset}(x, ...)
}
\arguments{
\item{x}{A data.frame or inherited tibble, data.frame, or a structured list.}

\item{Dimensions}{The name or column number of the dimensions within the dataset.}

\item{Measures}{The name or column number of the measures within the dataset.}

\item{Attributes}{The name or column number of the attributes within the dataset.}

\item{sdmx_attributes}{The optional dimensions and attributes that conform with
SDMX. \code{c("time", "geo")} will mark the "time" and "geo" attributes as conforming to
sdmx. See \href{https://raw.githubusercontent.com/UKGovLD/publishing-statistical-data/master/specs/src/main/vocab/sdmx-attribute.ttl}{sdmx-attribute}.}

\item{Title}{\href{https://purl.org/dc/elements/1.1/title}{dct:title}, a name given to the resource.
\code{\link{datacite}} allows the use of alternate titles, too. See \code{\link{dataset_title}}.}

\item{Label}{may be used to provide a human-readable version of the dataset's name.
A text description (optionally with a language tag) as defined by
\href{https://www.w3.org/TR/rdf-schema/#ch_label}{rdfs:label}.}

\item{Creator}{An entity primarily responsible for making the resource. \href{https://purl.org/dc/elements/1.1/creator}{dct:creator}
Corresponds to \code{Creator} in \code{\link{datacite}}. See \code{\link{creator}}.}

\item{Publisher}{Corresponds to \href{https://www.dublincore.org/specifications/dublin-core/dcmi-terms/#publisher}{dct:publisher}
and Publisher in DataCite.
The name of the entity that holds, archives, publishes prints, distributes, releases,
issues, or produces the resource. This property will be used to formulate the citation,
so consider the prominence of the role. For software, use \code{Publisher} for the
code repository. If there is an entity other than a code repository, that
"holds, archives, publishes, prints, distributes, releases, issues, or produces" the
code, use the property Contributor/contributorType/hostingInstitution for the code
repository. See \code{\link{publisher}}.}

\item{Issued}{Corresponds to \href{https://purl.org/dc/elements/1.1/date}{dct:date}.}

\item{Identifier}{An unambiguous reference to the resource within a given context.
Recommended practice is to identify the resource by means of a string conforming to an
identification system. Examples include International Standard Book Number (ISBN),
Digital Object Identifier (DOI), and Uniform Resource Name (URN).
Select and identifier scheme from
\href{https://www.ukoln.ac.uk/metadata/dcmi-ieee/identifiers/index.html}{registered URI schemes maintained by IANA}.
More details: \href{https://www.ukoln.ac.uk/metadata/dcmi-ieee/identifiers/}{Guidelines for using resource identifiers in Dublin Core metadata and IEEE LOM}.
Similar to \code{Identifier} in \code{\link{datacite}}. See \code{\link{identifier}}.}

\item{Subject}{Recommended for discovery in DataCite. Subject, keyword, classification code, or key
phrase describing the resource. Similar to \href{https://purl.org/dc/elements/1.1/subject}{dct:subject}. \cr
Use \code{\link{subject}} to properly add a key phrase from a controlled vocabulary
and create structured Subject objects with \code{\link{subject_create}}.}

\item{Type}{It is set by default to \href{https://purl.org/dc/dcmitype/Dataset}{DCMITYPE:Dataset}.}

\item{...}{Other parameters for the \code{print}, \code{summary} and \code{as.data.frame} methods.}

\item{i}{elements to extract or replace: numeric, character, empty or logical.}

\item{j}{elements to extract or replace: numeric, character, empty or logical.}

\item{object}{an object for which a summary is desired.}
}
\value{
A data frame-like object with structural and referential metadata.
}
\description{
A DataSet is a collection of statistical data that corresponds to a defined structure.
}
\details{
Loosely follows the \href{https://www.w3.org/TR/vocab-data-cube/}{The RDF Data Cube Vocabulary},
but without the definition of data slices.\cr
\code{\link{bibentry_dataset}} is a wrapper around \code{\link[utils:bibentry]{bibentry}} to correctly turn the
metadata of the dataset into a bibentry object.\cr
\code{as.data.frame} coerces a dataset into a data.frame in a way that the metadata attributes
are retained.
}
\examples{
my_dataset <- dataset (
    x = data.frame (time = rep(c(2019:2022),2),
                    geo = c(rep("NL",4), rep("BE",4)),
                    value = c(1,3,2,4,2,3,1,5),
                    unit = rep("NR",8),
                    freq = rep("A",8)),
    Dimensions = c(1,2),
    Measures = 3,
    Attributes = c(4,5),
    sdmx_attributes = c("time", "freq"),
    Title = "Example dataset",
    Creator = person("Jane", "Doe"),
    Publisher = "Publishing Co.",
    Issued = as.Date("2022-07-14")
)
## iris_dataset is a dataset class version of iris
as.data.frame(iris_dataset)
}
\seealso{
iris_dataset

Other dataset functions: 
\code{\link{dataset_local_id}()},
\code{\link{dataset_uri}()}
}
\concept{dataset functions}
