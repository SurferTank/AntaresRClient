# Config infraestructure for AntaresClient

#' The class that holds all the configuration.
#' It is not accessible directly but through get_config_value
#'
#' @import ini
#' @importFrom R6 R6Class
AntaresClientConfigurator.class <- R6::R6Class("AntaresClientConfigurator", public = list(file.path = NA,
                                                                                ini.handler = NA, default.values = NA,
                                                                                initialize = function(directory = paste(Sys.getenv("HOME"),
                                                                                                                        "/.r/RAntaresClient/", sep = ""), config.filename = "config.ini") {
                                                                                  dir.create(directory, showWarnings = FALSE, recursive = TRUE)
                                                                                  self$file.path = paste(directory, config.filename, sep = "")
                                                                                  if (file.exists(self$file.path)) {
                                                                                    self$ini.handler = ini::read.ini(self$file.path)
                                                                                  } else {
                                                                                    file.copy(from = "../extdata/default-config.ini", to=self$file.path)
                                                                                    self$ini.handler = read.ini(self$file.path)
                                                                                  }

                                                                                }, get_value = function(section, code) {
                                                                                  self$ini.handler[[section]][[code]]
                                                                                }))

#' Gets a value from the configurator object or returns NA otherwise.
#'
#' @param code Parameter code
#' @param default.value a default value in case it cannot be found.
#' @param is.dir triggers directories creation
#' @import futile.logger ini
get_config_value <- function(section, code) {
  if (!exists("AntaresClientConfigurator")) {
    AntaresClientConfigurator <<- AntaresClientConfigurator.class$new()
  }
  AntaresClientConfigurator$get_value(section, code)
}




