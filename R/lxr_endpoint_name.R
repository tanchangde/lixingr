#' Extract the API name from a Lixinger API URL
#'
#' This function takes a Lixinger API URL as input, and returns the API name,
#' which is the part of the URL after "api/". All slashes ("/") in the API name
#' are replaced with underscores ("_").
#'
#' @param api_endpoint A string of the Lixinger API URL.
#' @return A string of the API name.
#'
#' @importFrom magrittr extract2
lxr_endpoint_name <- function(endpoint) {
  endpoint_name <- stringr::str_match(endpoint, "api/(.*$)") %>%
    magrittr::extract2(2) %>%
    stringr::str_replace_all("/|-", "_")

  return(endpoint_name)
}
