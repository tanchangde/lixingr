#' Query Equity Change Data for Chinese Companies
#'
#' Retrieves changes in equity from the Lixinger API for listed Chinese
#' companies.
#'
#' @param token API token for authentication (string).
#' @param start_date Start date for the query in "YYYY-MM-DD" format (string).
#' @param end_date End date for the query in "YYYY-MM-DD" format. If
#'   not provided, the API defaults to the last Monday (string). The time span
#'   between `start_date` and `end_date` must not exceed 10 years.
#' @param limit Integer specifying the maximum number of records to
#'   return.
#' @param stock_code The stock code of the company (string).
#'
#' @return A tibble with flattened API response data.
#' @export
#'
#' @examples
#' lxr_cn_company_equity_change(start_date = "2022-09-20",
#'                              limit = 20,
#'                              stock_code = "002352")
lxr_cn_company_equity_change <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
           start_date,
           end_date = NULL,
           limit = NULL,
           stock_code) {

    url <- "https://open.lixinger.com/api/cn/company/equity-change"

    lxr_query(
      url = url,
      token = token,
      start_date = start_date,
      end_date = end_date,
      stock_code = stock_code
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
