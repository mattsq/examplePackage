% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crush.R
\name{crush}
\alias{crush}
\title{Crush}
\usage{
crush()
}
\value{
This function doesn't return anything - it only has side-effects, removing all objects in memory in the local environment.
}
\description{
Removes all objects in the environment.
}
\details{
Removes every single object in the environment. Same as the broom icon in RStio.
}
\examples{
x <- 1
y <- 2
crush()
}
\author{
Matt Simmons mattsimmons@email.com
}
