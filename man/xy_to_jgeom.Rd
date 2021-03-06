% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xy_to_jgeom.R
\name{xy_to_jgeom}
\alias{xy_to_jgeom}
\title{Convert xy coordinates to json geometry}
\usage{
xy_to_jgeom(xy, round = Inf)
}
\arguments{
\item{xy}{named vector matrix of 'x' and 'y' coordinates assumed to be projected
(4326, WGS-84)}

\item{round}{number of digits to round coordinates to}
}
\value{
a json geometry string of type 'MultiPoint'
}
\description{
Turn a xy coordinates vector (1 point) or matrix (multiple points) into a
  json geometry string
}
\note{
Elements of vector/columns of matrix must be named 'x' and 'y'
}
