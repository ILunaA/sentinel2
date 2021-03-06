% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/S2_query_angle.R
\name{S2_query_angle}
\alias{S2_query_angle}
\title{Prepare a list to query database for 'angle'}
\usage{
S2_query_angle(angleType = NULL, band = NULL, broken = FALSE,
  dateMax = NULL, dateMin = NULL, geometry = NULL, granule = NULL,
  granuleId = NULL, orbitNo = NULL, product = NULL,
  productId = NULL, regionId = NULL, retGeometry = FALSE,
  utm = NULL, dateSingle = NULL, ...)
}
\arguments{
\item{angleType}{see wiki}

\item{band}{see wiki}

\item{broken}{see wiki}

\item{dateMax}{see wiki}

\item{dateMin}{see wiki}

\item{geometry}{see wiki}

\item{granule}{see wiki}

\item{granuleId}{see wiki}

\item{orbitNo}{see wiki}

\item{product}{see wiki}

\item{productId}{see wiki}

\item{regionId}{region of interest id (overrides the \code{geometry} parameter,
if \code{dateMin} or \code{dateMax} are not specified, they are taken from the region of interest settings)}

\item{retGeometry}{logical should product geometry be included in the response?}

\item{utm}{see wiki}

\item{dateSingle}{character date of format "YYYY-MM-DD", specifies a single
date and will override \code{dateMin} and \code{dateMax}.}

\item{...}{further arguments, none implemented}
}
\value{
list of query arguments
}
\description{
Implements the query options for 'angle' found in the wiki
}
