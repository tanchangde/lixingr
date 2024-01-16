#' Extract the endpoint name
#'
#' This function takes a Lixinger endpoint URL as input, and returns the
#' endpoint name, which is the part of the URL after "api/". All slashes ("/")
#' in the endpoint name are replaced with underscores ("_").
#'
#' @param endpoint A string of the Lixinger endpoint URL.
#' @return A string of the endpoint name.
#'
#' @importFrom magrittr extract2
lxr_endpoint_name <- function(endpoint) {
  endpoint_name <- stringr::str_match(endpoint, "api/(.*$)") %>%
    magrittr::extract2(2) %>%
    stringr::str_replace_all("/|-", "_")

  return(endpoint_name)
}