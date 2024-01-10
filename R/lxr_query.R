#' Perform Lixinger API Query
#'
#' Sends a request to the Lixinger API to retrieve financial data.
#'
#' @details
#' The function constructs an HTTP request to the specified Lixinger API
#' endpoint. It validates the query parameters against the parameters
#' defined in 'lxr_request_params'. It supports automatic retries and
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
#'
#' @return A list containing the Lixinger API response in a parsed JSON format.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger
#' API that this function interfaces with, please visit the Lixinger
#' [API documentation](https://www.lixinger.com/open/api/)
#' .
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

  params <- lxr_request_params(api_endpoint)
  valid_params <- params$valid_params
  required_params <- params$required_params

  if (!all(names(query_params) %in% valid_params)) {
    invalid_params <- setdiff(names(query_params), valid_params)
    message <- glue::glue(
      "Invalid parameters: {paste(invalid_params, collapse = ', ')} \n",
      "Valid parameters are: {paste(valid_params, collapse = ', ')}"
    )
    usethis::ui_stop(message)
  }

  if (!is.null(required_params) &&
    !all(required_params %in% names(query_params))) {
    missing_required_params <- setdiff(required_params, names(query_params))
    message <- glue::glue(
      "Missing required parameters: ",
      "{paste(missing_required_params, collapse = ', ')}."
    )
    usethis::ui_stop(message)
  }

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
