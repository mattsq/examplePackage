#' Password Generator
#'
#' Creates a QF-valid password
#'
#' Creates a random password that will be accepted by various corporate systems
#' @param password_length the length in characters of the password
#' @export
#' @importFrom stats rbinom runif
#' @examples
#' x <- password_gen()
#' y <- password_gen(password_length = 3)
#' @return
#' This returns a random password of length password_length
#' @author Matt Simmons mattsimmons@email.com
#'
#'

password_gen <- function(password_length = 8) {

  # function to randomly uppercase or lowercase letters
  randomUpper <- function(x) if(rbinom(1,1,prob = 0.5) == 1) toupper(x) else x

  # input initialization
  letters <- letters
  vowels <- c("a","e","i","o","u")
  numbers <- as.character(1:9)
  password <- character()

  # iterate over password length
  for (k in 1:password_length) {
    # draw a random number between 1 and 3 using the uniform distribution
    draw <- ceiling(runif(1, min = 0, max = 3))
    if (draw == 1) {
      # if it's one, draw a random letter and randomly upper/lowercase it
      char <- randomUpper(letters[ceiling(runif(1,0,26))])
    } else if (draw == 2) {
      # if it's two, take a random number from 1-9
      char <- numbers[ceiling(runif(1,0,9))]
    } else if (draw == 3) {
      # if it's three, draw a random vowel and randomly case
      # this just biases the draw towards letters, and vowels in particular
      char <- randomUpper(vowels[ceiling(runif(1,0,5))])
    } else print("ERROR") # to make sure we don't draw a weird number
    # combine the draw with the existing draws
    password <- c(password,char)
  }
  # paste the whole thing together and return the string
  password <- paste(password,sep = "", collapse = "")
}
