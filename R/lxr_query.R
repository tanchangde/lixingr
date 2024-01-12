#' Perform Lixinger API Query
#'
#' Sends a request to the Lixinger API to retrieve financial data.
#'
#' @details
#' The function constructs an HTTP request to the specified Lixinger API
#' endpoint. It validates the query parameters against the parameters
#' defined in 'lxr_query_params'. It supports automatic retries and
#' timeout settings. The function also handles the conversion of
#' additional query parameters to the required JSON format.
#'
#' @param api_endpoint API endpoint URL for the Lixinger service.
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
#'   data frame containing the Lixinger API response data. If `flatten` is
#'   `FALSE`, the function returns the raw JSON response.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger
#' API that this function interfaces with, please visit the Lixinger
#' [API documentation](https://www.lixinger.com/open/api/).
#'
#' @examples
#' # Retrieve information for all stocks
#' lxr_query(api_endpoint = lxr_cn_company())
#'
#' # Retrieve information for all stocks with a specific type of financial
#' # statements
#' lxr_query(api_endpoint = lxr_cn_company(), fs_type = "non_financial")
#'
#' # Retrieve information for specific stocks
#' lxr_query(api_endpoint = lxr_cn_company(), stock_codes = c(
#'   "300750",
#'   "600519", "600157"
#' ))
#'
#' @importFrom jsonlite unbox
#' @importFrom httr2 request req_timeout req_retry req_headers req_body_json
#'   req_perform resp_body_json
#' @importFrom magrittr "%>%"
#' @importFrom rlang list2
#' @importFrom purrr imap discard map_chr
#' @importFrom stringr str_sub str_replace_all
#' @importFrom usethis ui_stop
#' @importFrom glue glue
#'
#' @export
lxr_query <- function(
    api_endpoint, token = Sys.getenv("TOKEN_LIXINGER"),
    flatten = TRUE, timeout = 9, max_tries = 5, ...) {
  query_params <- rlang::list2(...) %>% purrr::discard(is.null)
  names(query_params) <- purrr::map_chr(
    names(query_params),
    ~ stringr::str_replace_all(
      .x, "_[a-z]",
      ~ toupper(stringr::str_sub(.x, start = -1))
    )
  )

  endpoint_params <- lxr_query_params(api_endpoint)
  endpoint_valid_params <- endpoint_params$valid_params
  endpoint_required_params <- endpoint_params$required_params
  lxr_check_params(query_params, endpoint_valid_params, endpoint_required_params)

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
      response <- httr2::request(api_endpoint) %>%
        httr2::req_timeout(timeout) %>%
        httr2::req_retry(max_tries) %>%
        httr2::req_headers("Content-Type" = "application/json") %>%
        httr2::req_body_json(data = request_params, auto_unbox = FALSE) %>%
        httr2::req_perform()
    },
    error = function(e) {
      message <- glue::glue("REQUEST ERROR: {e$message}")
      usethis::ui_stop(message)
    }
  )

  content <- httr2::resp_body_json(response, simplifyVector = TRUE)

  if (flatten) {
    result <- content %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  } else {
    result <- content
  }

  return(result)
}
