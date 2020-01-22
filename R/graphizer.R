#' Graphizer
#'
#' Silly function that generates an arbitrary graph
#'
#' Generates a list of people with 'qualities' and then creates probable edges based on how far their qualities are from each other
#' @export
#' @import igraph
#' @param n_people The number of vertexes. Can't be more than 26.
#' @param n_qualities The number of qualities to compare. Can't be more than 26.
#' @param n_quality_levels The number of possible levels those qualities can have
#' @param n_rounds The number of times to try to generate an edge by comparing two vertexes qualities
#' @examples
#' \dontrun{
#' g <- graphizer(10, 10, 10, 100)
#' }
#' @return
#' This function will return an igraph graph.
#' @author Matt Simmons mattsimmons@email.com
#'
#'
#'

graphizer <- function(n_people, n_qualities, n_quality_levels, n_rounds) {

  people <- LETTERS[1:n_people]

  qualities <- n_qualities

  df <- matrix(NA, nrow = length(people), ncol = qualities)

  rownames(df) <- people

  possible_quality_levels <- LETTERS[1:n_quality_levels]

  for (k in 1:(qualities)) {
    df[ , k] <- sample(x = possible_quality_levels, size = length(people), replace = TRUE)
  }

  rounds <- n_rounds

  edges <- matrix(NA, nrow = rounds, ncol = 2)

  for (i in 1:rounds) {

    pair <- sample(people, size = 2)

    quality_1 <- df[pair[1],]
    quality_2 <- df[pair[2],]

    scores <- numeric(qualities)

    for (k in 1:qualities) {
      word_1 <- which(quality_1[k] == LETTERS)
      word_2 <- which(quality_2[k] == LETTERS)
      scores[k] <- abs(word_1-word_2) + if(quality_1[k] == "A") 1 else 0
    }

    total_score <- sum(scores)/(qualities*length(possible_quality_levels))

    join <- rbinom(n = 1, size = 1, prob = total_score)

    if (join == 1) {
      edges[i,] <- pair
    }
  }

  final_edges <- na.omit(edges)
  g <- graph_from_edgelist(final_edges)
  return(g)
}
