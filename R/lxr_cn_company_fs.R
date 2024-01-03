#' Query Financial Statements
#'
#' Fetches financial statement data for Chinese companies from Lixinger API.
#'
#' @details fs_type should be one of the following: 'bank', 'insurance',
#' 'security', 'non_financial', 'reit', 'other_financial'.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger API
#' that this function interfaces with, please visit the Lixinger API documentation:
#' \url{https://www.lixinger.com/open/api/doc?api-key=cn/company/fs/non_financial}
#'
#' @param token Character string, API access authentication token.
#' @param fs_type Character string, type of financial statements, see Details.
#' @param date Character string, specific date or "latest" in "YYYY-MM-DD" format.
#' @param start_date Character string, start date in "YYYY-MM-DD" format.
#' @param end_date Character string, end date in "YYYY-MM-DD" format.
#' @param stock_codes Character vector, stock codes for data retrieval (max 100).
#' @param metrics_list Character vector, metrics to retrieve.
#' @return A tibble of the flattened financial data.
#' @export
#'
#' @examples
#' # Fetch data for a specific date
#' lxr_cn_company_fs(
#'   date = "2023-09-30",
#'   stock_codes = c("300750", "600519", "600157"),
#'   metrics_list = c("q.ps.toi.t")
#' )
#'
#' # Fetch data over a date range
#' lxr_cn_company_fs(
#'   start_date = "2022-09-30",
#'   end_date = "2023-09-30",
#'   stock_codes = "300750",
#'   metrics_list = "q.ps.toi.t"
#' )
lxr_cn_company_fs <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
           fs_type = "non_financial",
           date = NULL,
           start_date = NULL,
           end_date = NULL,
           stock_codes,
           metrics_list) {

    valid_fs_types <- c("bank", "insurance", "security",
                        "non_financial", "reit", "other_financial")
    if(!fs_type %in% valid_fs_types) {
      stop("Unknown `financial_report_type`")
    }

    url_base <- "https://open.lixinger.com/api/cn/company/fs/"
    url = paste0(url_base, fs_type)

    lxr_query(
      url = url,
      token = token,
      date = date,
      start_date = start_date,
      end_date = end_date,
      stock_codes = stock_codes,
      metrics_list = metrics_list
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
