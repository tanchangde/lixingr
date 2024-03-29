#' Perform lixinger API query
#'
#' Sends a request to the lixinger API to retrieve financial data.
#'
#' @details
#' The function constructs an HTTP request to the specified lixinger API
#' endpoint. It validates the query parameters against the parameters
#' defined in \link{lxr_query_params}. It supports automatic retries and
#' timeout settings. The function also handles the conversion of
#' additional query parameters to the required JSON format.
#'
#' @param endpoint endpoint URL for the lixinger API.
#' @param token API authentication token. If not provided, the function will
#'   attempt to use the 'TOKEN_LIXINGER' environment variable.
#' @param flatten Logical flag indicating whether to return the API response as
#'   a flattened data frame. If TRUE (default), the function will convert the
#'   nested JSON response into a flat data frame. If FALSE, the function will
#'   return the JSON response.
#' @param timeout Timeout for the request, in seconds. Defaults to 9
#'   seconds.
#' @param max_tries Number of retry attempts in case of request failure,
#'   defaults to 5 attempts.
#' @param ... Additional parameters for the query. They are validated
#'   against the valid and required parameters for the specified
#'   API endpoint. Invalid or missing parameters will result in an error.
#'   Parameter names can be provided in either snake_case or camelCase format.
#'   For example, both 'stock_codes' and 'stockCodes' are acceptable.
#'
#' @return If `flatten` is `TRUE` (default), the function returns a flattened
#'   data frame containing the lixinger API response data. If `flatten` is
#'   `FALSE`, the function returns the raw JSON response.
#'
#' @references
#' For more detailed information about the parameters and usage of the lixinger
#' API that this function interfaces with, please visit the lixinger
#' [API documentation](https://www.lixinger.com/open/api/).
#'
#' @examples
#' # Retrieve information for all stocks
#' lxr_query(endpoint = lxr_cn_company())
#'
#' # Retrieve information for all stocks with a specific type of financial
#' # statements
#' lxr_query(endpoint = lxr_cn_company(), fs_type = "non_financial")
#'
#' # Retrieve information for specific stocks
#' lxr_query(
#'   endpoint = lxr_cn_company(),
#'   stock_codes = c("300750", "600519", "600157")
#' )
#'
#' @export
lxr_query <- function(
    endpoint, token = Sys.getenv("TOKEN_LIXINGER"),
    flatten = TRUE, timeout = 9, max_tries = 5, ...) {
  query_params <- rlang::list2(...) %>% purrr::discard(is.null)
  names(query_params) <- purrr::map_chr(
    names(query_params),
    ~ stringr::str_replace_all(
      .x, "_[a-z]",
      ~ toupper(stringr::str_sub(.x, start = -1))
    )
  )

  endpoint_params <- lxr_query_params(endpoint)
  endpoint_valid_params <- endpoint_params$valid_params
  endpoint_required_params <- endpoint_params$required_params
  lxr_check_query_params(
    query_params, endpoint_valid_params, endpoint_required_params
  )

  array_params <- c("stockCodes", "mutualMarkets", "metricsList")
  request_params <- rlang::list2(token = token, !!!query_params) %>%
    purrr::imap(~ {
      param_name <- .y
      if (!param_name %in% array_params) {
        jsonlite::unbox(.x)
      } else {
        .x
      }
    })

  tryCatch(
    {
      response <- httr2::request(endpoint) %>%
        httr2::req_timeout(timeout) %>%
        httr2::req_retry(max_tries) %>%
        httr2::req_headers("Content-Type" = "application/json") %>%
        httr2::req_body_json(data = request_params, auto_unbox = FALSE) %>%
        httr2::req_perform()
    },
    error = function(e) {
      message <- glue::glue("{e$message}")
      usethis::ui_stop(message)
    }
  )

  if (flatten) {
    resp_data <- httr2::resp_body_json(response, simplifyVector = TRUE) %>%
      magrittr::use_series("data")
    if (length(resp_data) > 0) {
      result <- resp_data %>%
        jsonlite::flatten() %>%
        lxr_unnest() %>%
        tibble::as_tibble()
    } else {
      usethis::ui_stop("Query was successful, but no data returned.")
    }
  } else {
    result <- httr2::resp_body_json(response)
  }

  return(result)
}
