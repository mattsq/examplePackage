#' Crush
#'
#' Removes all objects in the environment.
#'
#' Removes every single object in the environment. Same as the broom icon in RStio.
#' @export
#' @examples
#' x <- 1
#' y <- 2
#' crush()
#' @return
#' This function doesn't return anything - it only has side-effects, removing all objects in memory in the local environment.
#' @author Matt Simmons mattsimmons@email.com
#'
#'
#'

crush <- function() rm(list = ls())
