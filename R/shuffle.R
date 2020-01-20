#' shuffle
#'
#' shuffle a dataset
#'
#' Takes a dataset and randomly orders the rows. Good to make sure there's no row-dependence before partitioning.
#' @param data a data frame
#' @param seed a random seed to fix the shuffling - optional
#' @export
#' @examples
#' df <- data.frame(x = 1:100, y = 101:200)
#' shuffled_df <- shuffle(df)
#' @return
#' Returns the dataframe, shuffled.
#' @author Matt Simmons mattsimmons@email.com
#'
#'

shuffle <- function(data, seed = NA) {

  if (is.not.na(seed)) set.seed(seed)

  # Shuffle row indices: rows
  rows <- sample(nrow(data), replace = TRUE)
  # Randomly order data
  data <- data[rows,]

}
