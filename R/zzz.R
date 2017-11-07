#' AntaresRClient
#'
#' A client to interact with the Antares Infrastructure
#'
#' @docType package
#' @name AntaresRClient
#' @import R6 futile.logger testthat RCurl rjson
#' @author Alejandro Baranek <abaranek@dc.uba.ar>, Leonardo Javier Belen <leobelen@gmail.com>


#' Executes code while loading the package.
#'
#' @param libname Library name
#' @param pkgname Package name
.onLoad <- function(libname, pkgname) {
  futile.logger::flog.appender(futile.logger::appender.tee("AntaresClient.log"), name = "data.io")
  futile.logger::flog.threshold(futile.logger::DEBUG)
}
