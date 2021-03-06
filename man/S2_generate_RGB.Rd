% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/S2_generate_RGB.R
\name{S2_generate_RGB}
\alias{S2_generate_RGB}
\title{Generate RGB image and download}
\usage{
S2_generate_RGB(granuleId, destfile = NULL, resolution = c("highest",
  "lowest"), atmCorr = TRUE, r = "B08", g = "B04", b = "B03",
  ra = 20, ga = 20, ba = 20, rb = 20, gb = 20, bb = 20,
  overwrite = FALSE)
}
\arguments{
\item{granuleId}{integer the granuleId for which to create the RGB composite}

\item{destfile}{character path to the output file. If destfile is a path to
an existing directory, a filename will be automatically generated. If NULL,
the file will be saved to the current working directory using an
automatically generated name. If a filename is supplied, it will be
recognized by its '.tiff' extension.}

\item{resolution}{character one of \code{c("highest", "lowest")}. Images may
exist for several resolutions (10m, 20m, 60m), for some Sentinel-2 bands.
Using "highest" will use the highest available spatial resolution for each
band, "lowest"  will use the lowest available spatial resolution for each
band.}

\item{atmCorr}{0 (default) or 1, if atmospherically corrected bands should be
used}

\item{r}{character red band, e.g. "B08"}

\item{g}{character green band, e.g. "B04"}

\item{b}{character blue band, e.g. "B03"}

\item{ra}{see wiki}

\item{ga}{see wiki}

\item{ba}{see wiki}

\item{rb}{see wiki}

\item{gb}{see wiki}

\item{bb}{see wiki}

\item{overwrite}{logical, should existing files be overwritten?}
}
\description{
Generates 8-bit/channel composite image (see 'https://s2.boku.eodc.eu/wiki/'
  for details)
}
