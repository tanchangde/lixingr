#' Lixinger Chinese Company Candlestick Data
#'
#' @description
#' This function queries the Lixinger API for candlestick data of Chinese companies.
#'
#' @param token A string specifying the authentication token for the API.
#' @param type A string defining the type of candlestick data to retrieve.
#'   The possible values are 'ex_rights', 'lxr_fc_rights', 'fc_rights', and
#'   'bc_rights'.
#' @param start_date A Date object indicating the start date for data retrieval.
#'   Dates should be in 'YYYY-MM-DD' format.The time span between `start_date`
#'   and `end_date` must not exceed 10 years.
#' @param end_date End date for the query in "YYYY-MM-DD" format. If not provided,
#'  the API defaults to the last Monday.
#' @param adjust_forward_date A string representing the date in "YYYY-MM-DD" format
#'   for forward adjustment of the data range.
#' @param adjust_backward_date A string representing the date in "YYYY-MM-DD" format
#'   for backward adjustment of the data range.
#' @param limit An integer specifying the maximum number of records to retrieve.
#' @param stock_code A string representing the stock code to query.
#'
#' @return A tibble (tbl_df) containing the flattened candlestick data.
#'
#' @examples
#' result <- lxr_cn_company_candlestick(
#'   type = "lxr_fc_rights",
#'   start_date = "2023-01-03",
#'   end_date = "2024-01-03",
#'   stock_code = "300750"
#' )
#'
#' @export
lxr_cn_company_candlestick <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
           type,
           start_date = NULL,
           end_date = NULL,
           adjust_forward_date = NULL,
           adjust_backward_date = NULL,
           limit = NULL,
           stock_code) {
    url <- "https://open.lixinger.com/api/cn/company/candlestick"
    lxr_query(
      url = url,
      token = token,
      type = type,
      start_date = start_date,
      end_date = end_date,
      adjust_forward_date = adjust_forward_date,
      adjust_backward_date = adjust_backward_date,
      limit = limit,
      stock_code = stock_code
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
