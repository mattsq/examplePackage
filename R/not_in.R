#' Not In
#'
#' This is the opposite of in
#'
#' It does the opposite of what in does.
#' @param x a value
#' @param table a vector or table of values
#' @import purrr
#' @export
#' @examples
#' x <- 1
#' y <- c(2,3,4)
#' x %not in% y
#' @return
#' This function true if x is not in y
#' @author Matt Simmons mattsimmons@email.com
#' @seealso \link[base]{%in%}
#'
#'

library(purrr)
`%not in%` <- purrr:::negate(`%in%`)
