#' Query Equity Change Data for Chinese Companies
#'
#' Retrieves changes in equity from the Lixinger API for listed Chinese
#' companies.
#'
#' @param token API token for authentication (string).
#' @param startDate Start date for the query in "YYYY-MM-DD" format (string).
#' @param endDate Optional end date for the query in "YYYY-MM-DD" format. If
#'   not provided, the API defaults to the last Monday (string). The time span
#'   between `startDate` and `endDate` must not exceed 10 years.
#' @param limit Optional integer specifying the maximum number of records to
#'   return.
#' @param stockCode The stock code of the company (string).
#'
#' @return A tibble with flattened API response data.
#' @export
#'
#' @examples
#' lxr_cn_company_equity_change(startDate = "2022-09-20",
#'                              limit = 20,
#'                              stockCode = "002352")
lxr_cn_company_equity_change <-
  function(token = NULL,
           startDate = NULL,
           endDate = NULL,
           limit = NULL,
           stockCode = NULL) {
    url <- "https://open.lixinger.com/api/cn/company/equity-change"

    lxr_query(
      url = url,
      token = token,
      startDate = startDate,
      endDate = endDate,
      stockCode = stockCode
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
