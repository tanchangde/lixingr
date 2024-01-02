#' Lixinger API Query
#'
#' Sends a request to the Lixinger API to retrieve financial data.
#'
#' @details
#' The function constructs an HTTP request to the specified Lixinger API endpoint.
#' It supports automatic retries and timeout settings. The function also handles
#' the conversion of additional query parameters to the required JSON format.
#'
#' @param url API endpoint URL for the Lixinger service.
#' @param token API authentication token. If not provided, the function will
#' attempt to use the 'TOKEN_LIXINGER' environment variable.
#' @param timeout Optional timeout for the request, in seconds. Defaults to 9
#' seconds.
#' @param maxTries Optional number of retry attempts in case of request failure.
#' Defaults to 5 attempts.
#' @param ... Additional parameters for the query.
#'
#' @return A list containing the Lixinger API response in a parsed JSON format.
#'
#' @importFrom jsonlite unbox
#' @importFrom httr2 request req_timeout req_retry req_headers req_body_json
#' req_perform resp_body_json
#' @importFrom magrittr "%>%"
#' @importFrom rlang list2
#' @importFrom purrr imap discard
lxr_query <- function(url = NULL, token = NULL, timeout = 9, maxTries = 5, ...) {
  array_params <- c("stockCodes", "mutualMarkets", "metricsList")
  token <- if (is.null(token)) Sys.getenv("TOKEN_LIXINGER") else token

  query_params <- rlang::list2(token = token, ...) %>%
    purrr::discard(is.null) %>%
    purrr::imap( ~ {
      param_name <- .y
      if (!param_name %in% array_params) {
        jsonlite::unbox(.x)
      } else {
        .x
      }
    })

  tryCatch({
    response <- httr2::request(url) %>%
      httr2::req_timeout(timeout) %>%
      httr2::req_retry(maxTries) %>%
      httr2::req_headers("Content-Type" = "application/json") %>%
      httr2::req_body_json(data = query_params, auto_unbox = FALSE) %>%
      httr2::req_perform()
  }, error = function(e) {
    stop("REQUEST ERROR:", e$message, call. = FALSE)
  })

  content <- httr2::resp_body_json(response, simplifyVector = TRUE)
  return(content)
}

