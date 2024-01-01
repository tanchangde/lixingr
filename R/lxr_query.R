#' Lixinger API Query
#'
#' Sends a request to the Lixinger API to retrieve financial data based on user-
#' specified parameters, such as financial statement type, market, stock codes,
#' and whether to include delisted stocks.
#'
#' @param url API endpoint URL for the Lixinger service.
#' @param token Mandatory API authentication token.
#' @param fs_type Optional type of financial statements to retrieve ('non_financial',
#'        'bank', 'insurance', 'security', 'other_financial').
#' @param mutual_markets Optional markets to include, e.g., 'ha'.
#' @param stock_codes Optional stock codes to query, as a vector.
#' @param include_delisted Optional flag to include delisted stocks.
#' @param timeout Optional API request timeout in seconds, defaults to 9.
#' @param date Optional specific date for the data retrieval in 'YYYY-MM-DD' format
#'        or 'latest'. When not specified, defaults to 'latest'. If 'date' is provided,
#'        'start_date' and 'end_date' should not be provided, and vice versa.
#' @param start_date Optional starting date for the data range in 'YYYY-MM-DD' format.
#'        Must be used in conjunction with end_date.
#' @param end_date Optional ending date for the data range in 'YYYY-MM-DD' format.
#'        Must be used in conjunction with start_date.
#' @param metrics Optional character vector representing the metrics to be retrieved,
#'        each formatted as 'granularity.tableName.fieldName.expressionCalculateType'.
#' @param max_tries Optional number of retry attempts, defaults to 5.
#'
#' @return A list structure containing the Lixinger API response in a parsed JSON format.
#'
#' @examples
#' \dontrun{
#' lxr_query(url = "https://open.lixinger.com/api/cn/company",
#'           token = "your_api_token",
#'           stock_codes = c("300750", "600519", "600157"))
#'}
#'
#' @export
#'
#' @importFrom jsonlite unbox
#' @importFrom httr2 request req_timeout req_retry req_headers req_body_json
#' req_perform resp_body_json
#' @importFrom magrittr "%>%"
#'
#' @note An API token is required to access Lixinger services. A valid API endpoint
#'       URL is also needed. Providing an invalid `token` or `url` will cause an error.
#'
lxr_query <- function(url = NULL,
                      token = NULL,
                      fs_type = NULL,
                      mutual_markets = NULL,
                      stock_codes = NULL,
                      include_delisted = NULL,
                      date = NULL,
                      start_date = NULL,
                      end_date = NULL,
                      metrics = NULL,
                      timeout = 9,
                      max_tries = 5) {
  query_body <- list()
  if (is.null(token)) {
    query_body$token <- unbox(Sys.getenv("TOKEN_LIXINGER"))
  } else {
    query_body$token <- unbox(token)
  }
  if (!is.null(fs_type)) {
    query_body$fsType <- jsonlite::unbox(fs_type)
  }
  if (!is.null(mutual_markets)) {
    query_body$mutualMarkets <- mutual_markets
  }
  if (!is.null(stock_codes)) {
    query_body$stockCodes <- stock_codes
  }
  if (!is.null(include_delisted)) {
    query_body$includeDelisted <- jsonlite::unbox(include_delisted)
  }
  if (!is.null(date)) {
    query_body$date <- jsonlite::unbox(date)
  }
  if (!is.null(start_date)) {
    query_body$startDate <- jsonlite::unbox(start_date)
  }
  if (!is.null(end_date)) {
    query_body$endDate <- jsonlite::unbox(end_date)
  }
  if (!is.null(metrics)) {
    query_body$metricsList <- metrics
  }

  tryCatch({
    response <- httr2::request(url) %>%
      httr2::req_timeout(timeout) %>%
      httr2::req_retry(max_tries) %>%
      httr2::req_headers("Content-Type" = "application/json") %>%
      httr2::req_body_json(query_body, auto_unbox = FALSE) %>%
      httr2::req_perform()
  }, error = function(e) {
    stop("REQUEST ERROR:", e$message, call. = FALSE)
  })

  content <- httr2::resp_body_json(response, simplifyVector = TRUE)

  return(content)
}
