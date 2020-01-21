#' Pull BITRE data
#'
#' Uses the CKAN data.gov.au API to pull records - tuned for the BITRE API.
#'
#' Retrieves a dataframe, with some limited filtering capabilities
#' @export
#' @import httr glue dplyr
#' @param base_url The base data.gov.au API URL
#' @param resource_id The specific resource ID code from the data.gov.au website
#' @param limit The number of rows you want to pull
#' @param records_format leave this as objects for the moment
#' @param offset the rownumber start
#' @param sort a text string, in SQL style, indicating how you'd like to sort the records
#' @examples
#' \dontrun{
#' data <- pull_bitre_data <- function(base_url = url, resource_id = id)
#' }
#' @return
#' This function will return a data frame of the BITRE on time performance data.
#' @author Matt Simmons mattsimmons@email.com
#'
#'
#'

pull_bitre_data <- function(base_url, resource_id, limit = 5000, offset = 1,
                                sort = "Year desc, Month_Num desc, Airline desc, Departing_Port asc, Arriving_Port asc", records_format = "objects") {



  query_list <- list(resource_id = resource_id,
                     limit = limit,
                     offset = offset,
                     #fields = "Year",
                     #q = '"Year": "2019"',
                     #filters = '"Year": "2019", "Departures_Delayed": "22"',
                     sort = sort,
                     records_format = records_format)

  search_url <- httr::modify_url(url = base_url, query = query_list)

  print(glue::glue("Pulling {limit} records with offset {offset}, sorted by {sort} returned as {records_format}"))

  query_result <- httr::GET(search_url)

  if (httr::http_error(query_result)) stop("GET request returned an error")

  data <- httr::content(query_result) %>%
    .$result %>%
    .$records %>%
    bind_rows()

  return(data)

}
