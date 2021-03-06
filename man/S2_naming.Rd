% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/S2_naming.R
\name{S2_naming}
\alias{S2_naming}
\title{S2_granule_naming}
\usage{
S2_naming(x, order = list("date", "utm", "orbit", Id = "granuleId"),
  prefix = "GRANULE", suffix = ifelse(as.numeric(x$atmCorr) == 0,
  "L1C", "L2A"), extension = NULL)
}
\arguments{
\item{x}{is the returned data \code{S2_query_granule} or \code{S2_query_image}}

\item{order}{character vector representing the desired naming order. Allowed
values are '"date", "utm", "orbit", "granuleId", "productId", "cloudCov",
"atmCorr", "resolution", "band"'.
If an element in 'order' is named, the name of the element is used
as prefix for its value (without any separator). (The 'time' portion of 'date'
will be truncated to avoid spaces and colons in the filename.)}

\item{prefix}{character 'GRANULE' by default}

\item{suffix}{character by default turns to 'L1C', if '\code{atmCorr = 0.0}'.
If '\code{atmCorr != 0.0}' in x, 'suffix' will become 'L2A'.}

\item{extension}{character optional filename extension}
}
\value{
character name
}
\description{
Creates a filename to store a downloaded 'granule', based on query response
for a single 'granuleId'
}
\details{
This function allows to alter the automatic naming behavior for
  downloaded granules. Useful, when it is desired to add a custom prefix /
  suffix or make files be easier sortable by utm zone Id instead of
  acquision date.
}
