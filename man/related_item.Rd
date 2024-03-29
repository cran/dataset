% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/related_item.R
\name{related_item}
\alias{related_item}
\title{Create a related item}
\usage{
related_item(
  Identifier,
  Creator,
  Title,
  relatedIdentifierType,
  relationType,
  schemeURI = NA_character_,
  schemeType = NA_character_,
  resourceTypeGeneral = NA_character_,
  PublicationYear = NULL,
  Volume = NULL,
  Issue = NULL,
  Number = NULL,
  numberType = NULL,
  firstPage = NULL,
  lastPage = NULL,
  Publisher = NULL,
  Edition = NULL,
  Contributor = NULL
)
}
\arguments{
\item{Identifier}{The Identifier is a unique string that identifies a resource. For software, determine
whether the identifier is for a specific version of a piece of software, (per the
\href{https://force11.org/info/software-citation-principles-published-2016/}{Force11 Software Citation Principles},
or for all versions. Similar to \code{dct:title} in \code{\link[=dublincore]{dublincore()}}.}

\item{Creator}{The main researchers involved in producing the data, or the authors of the publication, in
priority order. To supply multiple creators, repeat this property.}

\item{Title}{The name(s) or title(s) by which a resource is known. May be the
title of a dataset or the name of a piece of software.
Similar to
\href{https://www.dublincore.org/specifications/dublin-core/dcmi-terms/elements11/title/}{dct:title}.\cr}

\item{relatedIdentifierType}{See \href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#12a-relatedidentifiertype}{relatedIdentifierType}.}

\item{relationType}{See \href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#12b-relationtype}{relationType}.}

\item{schemeURI}{See \href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#12d-schemeuri}{schemeURI}.}

\item{schemeType}{See \href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#12e-schemetype}{schemeType}.}

\item{resourceTypeGeneral}{The general type of a resource or file.}

\item{PublicationYear}{The year when the data was or will be made publicly available in
\code{YYYY} format.See \code{\link[=publication_year]{publication_year()}}.}

\item{Volume}{The volume of the related item (optional).}

\item{Issue}{The issue number of the related item (optional).}

\item{Number}{The number of the related item (optional).}

\item{numberType}{The type of the number (optional).}

\item{firstPage}{The first page of the related item (optional).}

\item{lastPage}{The first page of the related item (optional).}

\item{Publisher}{The name of the entity that holds, archives, publishes prints,
distributes, releases, issues, or produces the resource. This property will be used to
formulate the citation, so consider the prominence of the role.
For software, use Publisher for the code repository. Mandatory in DataCite, and similar to
\code{dct:publisher}. See \code{\link[=publisher]{publisher()}}.}

\item{Edition}{The edition of the related item (optional).}

\item{Contributor}{Recommended for discovery. The institution or person responsible for collecting, managing, distributing, or otherwise contributing to the development of the resource.}
}
\value{
a related item.
}
\description{
Create a
\href{https://support.datacite.org/docs/datacite-metadata-schema-v44-recommended-and-optional-properties#12-relatedidentifier}{RelatedIdentifier},
attribute, which is recommended for discovery in \code{DataCite}.
}
\examples{
my_item <- related_item (Identifier = "https://zenodo.org/record/5703222#.YZYkm2DMLIU",
                         Creator = person ("Daniel", "Antal", role = "aut"),
                         Publisher = "Zenodo",
                         PublicationYear = 2022,
                         relatedIdentifierType = "DOI",
                         relationType = "CompiledBy",
                         schemeURI = "URI",
                         resourceTypeGeneral = "Dataset")
}
\seealso{
Other metadata functions: 
\code{\link{datacite}()},
\code{\link{dublincore}()}
}
\concept{metadata functions}
