% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset_download.R
\name{dataset_download}
\alias{dataset_download}
\alias{dataset_download_csv}
\title{Download data into a dataset}
\usage{
dataset_download(
  Title,
  Dimensions = NULL,
  Measures = NULL,
  Attributes = NULL,
  Identifier = NULL,
  url,
  type = "csv",
  ...
)

dataset_download_csv(
  url,
  Title,
  Dimensions = NULL,
  Measures = NULL,
  Attributes = NULL,
  Identifier = NULL,
  type = "csv",
  destfile = NULL,
  method = "auto",
  quiet = TRUE,
  mode = "wb",
  cacheOK = TRUE
)
}
\arguments{
\item{Title}{\href{https://purl.org/dc/elements/1.1/title}{dct:title}, a name given to the resource.
\code{\link{datacite}} allows the use of alternate titles, too. See \code{\link{dataset_title}}.}

\item{Dimensions}{The name or column number of the dimensions within the dataset.}

\item{Measures}{The name or column number of the measures within the dataset.}

\item{Attributes}{The name or column number of the attributes within the dataset.}

\item{Identifier}{An unambiguous reference to the resource within a given context.
Recommended practice is to identify the resource by means of a string conforming to an
identification system. Examples include International Standard Book Number (ISBN),
Digital Object Identifier (DOI), and Uniform Resource Name (URN).
Select and identifier scheme from
\href{https://www.ukoln.ac.uk/metadata/dcmi-ieee/identifiers/index.html}{registered URI schemes maintained by IANA}.
More details: \href{https://www.ukoln.ac.uk/metadata/dcmi-ieee/identifiers/}{Guidelines for using resource identifiers in Dublin Core metadata and IEEE LOM}.
Similar to \code{Identifier} in \code{\link{datacite}}. See \code{\link{identifier}}.}

\item{url}{a \code{\link{character}} string (or longer vector e.g.,
    for the \code{"libcurl"} method) naming the URL of a resource to be
    downloaded.}

\item{type}{A file type.  Currently only \code{csv} is implemented that
invokes \code{utils::download.file}.}

\item{...}{allow additional arguments to be passed, unused.}

\item{destfile}{a character string (or vector, see the \code{url}
    argument) with the file path where the downloaded file is to be
    saved.  Tilde-expansion is performed.}

\item{method}{Method to be used for downloading files.  Current
    download methods are \code{"internal"}, \code{"wininet"} (Windows
    only) \code{"libcurl"}, \code{"wget"} and \code{"curl"}, and there
    is a value \code{"auto"}: see \sQuote{Details} and \sQuote{Note}.

    The method can also be set through the option
    \code{"download.file.method"}: see \code{\link{options}()}.
  }

\item{quiet}{If \code{TRUE}, suppress status messages (if any), and
    the progress bar.}

\item{mode}{character.  The mode with which to write the file.  Useful
    values are \code{"w"}, \code{"wb"} (binary), \code{"a"} (append) and
    \code{"ab"}.  Not used for methods \code{"wget"} and \code{"curl"}.
    See also \sQuote{Details}, notably about using \code{"wb"} for Windows.
  }

\item{cacheOK}{logical.  Is a server-side cached value acceptable?}
}
\value{
A \code{\link{dataset}} with the downloaded dataset.
}
\description{
A wrapper around \code{\link{dataset}} and
an import function.
}
\examples{
\donttest{
dest_file <- file.path(tempdir(), "iris.csv")
dataset_download(
  url = "https://zenodo.org/record/7421899/files/iris.csv?download=1",
  Dimensions = NULL,
  Measures = c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width" ),
  Attributes = "Species",
  Title = "Iris Dataset",
  Publisher = "American Iris Society",
  Identifier = "https://doi.org/10.1111/j.1469-1809.1936.tb02137.x",
  destfile = dest_file
)
}
}
\keyword{internal}
