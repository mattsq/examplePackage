#' refreshFromOldPackages
#'
#' Uses a csv containing package names to install packages en-masse. Use in conjunction with refreshFromOldPackages
#'
#' Uses a csv containing package names to install packages en-masse. Use in conjunction with refreshFromOldPackages
#' @export
#' @importFrom utils read.csv installed.packages install.packages
#' @param old_file The name of the file that will be used to install packages.
#' @examples
#' \dontrun{
#' write.csv(data.frame(Package = "dplyr"), "Current_Packages.csv")
#' refreshFromOldPackages()
#' }
#' @return
#' This function installs all the packages from the csv.
#' @author Matt Simmons mattsimmons@email.com
#'
#'

refreshFromOldPackages <- function(old_file = "Current_Packages.csv") {
  # run this in your new installation after running the previous

  old <- utils:::read.csv(old_file, stringsasFactors = FALSE)
  old <- old$Package
  old <- as.character(old)

  new <- as.character(as.data.frame(utils:::installed.packages())$Package)

  required <- old[which(!(new %in% old))]
  utils:::install.packages(required)
}
