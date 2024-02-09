#' Extract the endpoint name
#'
#' This function takes a lixinger endpoint URL as input. It first extracts the
#' part of the URL after "api/". Then, all slashes ("/") and hyphens ("-") in
#' this part are replaced with underscores ("_"). The result is returned as the
#' endpoint name.
#'
#' @param endpoint A string of the Lixinger endpoint URL.
#'
#' @return A string of the endpoint name.
lxr_endpoint_name <- function(endpoint) {
  endpoint_name <- stringr::str_match(endpoint, "api/(.*$)") %>%
    magrittr::extract2(2) %>%
    stringr::str_replace_all("/|-", "_")

  return(endpoint_name)
}
