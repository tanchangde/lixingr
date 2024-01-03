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
#' @param timeout Timeout for the request, in seconds. Defaults to 9
#' seconds.
#' @param max_tries Number of retry attempts in case of request failure, defaults
#'   to 5 attempts.
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
lxr_query <- function(url, token = Sys.getenv("TOKEN_LIXINGER"), timeout = 9,
                      max_tries = 5, ...) {

  array_params <- c("stockCodes", "mutualMarkets", "metricsList")

  query_params <- rlang::list2(...) %>% purrr::discard(is.null)
  names(query_params) <- purrr::map_chr(names(query_params),
    ~ stringr::str_replace_all(.x, "_([a-z])",
      ~ toupper(stringr::str_sub(.x, start = -1))))

  request_params <- rlang::list2(token = token, !!!query_params) %>%
    purrr::imap(~ {
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
      httr2::req_retry(max_tries) %>%
      httr2::req_headers("Content-Type" = "application/json") %>%
      httr2::req_body_json(data = request_params, auto_unbox = FALSE) %>%
      httr2::req_perform()
  }, error = function(e) {
    stop("REQUEST ERROR:", e$message, call. = FALSE)
  })

  content <- httr2::resp_body_json(response, simplifyVector = TRUE)

  return(content)
}

