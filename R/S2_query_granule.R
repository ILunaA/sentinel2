#' Query database for 'granule'
#'
#' Implements the query options for granule described in the wiki.
#' @param atmCorr  logical if TRUE only results for atmospherically corrected
#'   data are returned.
#' @param broken logical, TRUE if the granule is marked as broken
#'   (almost for sure you want to use FALSE, the default).
#' @param cloudCovMin integer minimum cloud coverage from 0 to 100.
#' @param cloudCovMax integer maximum cloud coverage from 0 to 100.
#' @param dateMax character end date of format "YYYY-MM-DD".
#' @param dateMin character start date of format "YYYY-MM-DD".
#' @param geometry geometry which should intersect with granules. Can be a
#'   geoJSON geometry string (e.g. {"type":"Point","coordinates":[16.5,48.5]}),
#'   the path to a Point/Polygon shapefile, a SpatialPoints object or a
#'   SpatialPolygons object.
#' @param granule character ESA granule id.
#' @param granuleId integer internal metadata database granule id.
#' @param orbitNo integer from 1 to 143.
#' @param owned logical when TRUE only already bought granules will be returned.
#' @param product chracter ESA product id.
#' @param productId integer internal metadata database product id.
#' @param regionId region of interest id (overrides the \code{geometry} parameter,
#'   if \code{dateMin}, \code{dateMax} or \code{cloudCovMax} are not specified,
#'   they are taken from the region of interest settings)
#' @param retGeometry logical should product geometry be included in the response?
#' @param utm character UTM zone, e.g. 33U, 01C.
#' @param dateSingle character date of format "YYYY-MM-DD", specifies a single
#'   date and will override \code{dateMin} and \code{dateMax}.
#' @param spatial character, R package name (\code{sp} or \code{sf}) to the
#'   format used by which granule geometries should be converted. Be aware that
#'   such conversion may take quite some time for large number of returned
#'   granules.
#' @param ... further arguments not implemented directly - see
#'   the \href{https://s2.boku.eodc.eu/wiki/#!granule.md#GET_https://s2.boku.eodc.eu/granule}{API doc}.
#' @return data.frame describing matching granules.
#' @export

S2_query_granule = function(
  atmCorr      = NULL,
  broken       = FALSE,
  cloudCovMin  = NULL,
  cloudCovMax  = NULL,
  dateMax      = NULL,
  dateMin      = NULL,
  geometry     = NULL,
  granule      = NULL,
  granuleId    = NULL,
  orbitNo      = NULL,
  owned        = FALSE,
  product      = NULL,
  productId    = NULL,
  regionId     = NULL,
  retGeometry  = FALSE,
  utm          = NULL,
  dateSingle   = NULL,
  spatial      = NULL,
  ...
){
  # check inputs ---------------------------------------------------------------
  if (!is.null(spatial)) {
    retGeometry = TRUE
  }

  if (!is.null(dateSingle)) {
    check_date(dateSingle)
    dateMin    = dateSingle
    dateMax    = dateSingle
    dateSingle = NULL
  }

  if (!is.null(dateMin) && !is.null(dateMax) && check_date(dateMin) > check_date(dateMax)) {
    stop("'dateMin' (", dateMin, ") larger than 'dateMax' (", dateMax, ")")
  }

  # prepare json geometry ------------------------------------------------------
  if (!is.null(geometry)) {
    geometry = roi_to_jgeom(geometry)
  }

  # make named query list ------------------------------------------------------
  query = c(as.list(environment()), list(...))
  query = query[!sapply(query, is.null)]

  # return query list ----------------------------------------------------------
  rtrn = S2_do_query(query = query, path = 'granule')
  if (nrow(rtrn) == 0) {
    rtrn$granuleId = integer()
  }

  if (!is.null(spatial) & nrow(rtrn) > 0) {
    rtrn$geometry = geojson2geometry(rtrn$geometry, spatial)
  }

  return(rtrn)
}
