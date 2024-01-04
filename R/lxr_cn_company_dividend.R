#' Query Chinese Company Dividend Data
#'
#' This function queries the Lixinger API for dividend data of Chinese
#' companies.
#'
#' @param token A character string. The user's unique API token.
#' @param start_date A character string in the format "YYYY-MM-DD". The start
#'   date of the date range for which to retrieve data. The time span between
#'   `start_date` and `end_date` must not exceed 10 years.
#' @param end_date A character string in the format "YYYY-MM-DD". The end
#'   date of the date range for which to retrieve data.and the default value is
#'   the date of the last Monday.
#' @param limit An integer. The maximum number of recent data records to
#'   return. It only takes effect when the requested data is a date range.
#' @param stock_code A character string. The stock code of the company.
#'   Please refer to the Stock Information API for valid stock codes.
#'
#' @return A tibble. The company's dividend data within the specified
#'   date range.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger
#' API that this function interfaces with, please visit the Lixinger
#' [Doc](https://www.lixinger.com/open/api/doc?api-key=cn/company/dividend).
#'
#' @examples
#' lxr_cn_company_dividend(
#'   start_date = "2020-01-01",
#'   end_date = "2024-12-31",
#'   stock_code = "300750"
#' )
#'
#' @export
lxr_cn_company_dividend <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
           start_date,
           end_date = NULL,
           limit = NULL,
           stock_code) {
    url <- "https://open.lixinger.com/api/cn/company/dividend"
    lxr_query(
      url = url,
      token = token,
      start_date = start_date,
      end_date = end_date,
      limit = limit,
      stock_code = stock_code
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble() %>%
      dplyr::mutate(
        stockCode = stock_code
      )
  }
