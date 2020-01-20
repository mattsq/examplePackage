#' retrieveCurrentPackagesData
#'
#' Retrieves all currently stored packages and writes them to a file for use by refreshFromOldPackages
#'
#' Retrieves all currently stored packages and writes them to a file for use by refreshFromOldPackages
#' @export
#' @importFrom utils installed.packages write.csv
#' @param file The name of the file that the packages will be written to
#' @examples
#' \dontrun{
#' retrieveCurrentPackagesData()
#' retrieveCurrentPackagesData(file = "another-file.csv")
#' }
#' @return
#' This function writes down a file to the file location with all currently installed packages.
#' @author Matt Simmons mattsimmons@email.com
#'
#'
#'

retrieveCurrentPackagesData <- function(file = "Current_Packages.csv") {
  # Run this in your old installation
  utils:::installed.packages() %>%
    as.data.frame() %>%
    utils:::write.csv(file)

}
