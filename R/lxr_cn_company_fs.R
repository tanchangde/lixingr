#' Query Financial Statements
#'
#' Fetches financial statement data for Chinese companies from Lixinger API.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger API
#' that this function interfaces with, please visit the Lixinger API documentation:
#' \url{https://www.lixinger.com/open/api/doc?api-key=cn/company/fs/non_financial}
#'
#' @param token (Required) Character string, API access authentication token.
#' @param fs_type (Optional) Character string, type of financial statements, see Details.
#' @param date (Optional) Date or character string, specific date or "latest" in "YYYY-MM-DD".
#' @param start_date (Optional) Date or character string, start date in "YYYY-MM-DD".
#' @param end_date (Optional) Date or character string, end date in "YYYY-MM-DD".
#' @param stock_codes (Required) Character vector, stock codes for data retrieval (max 100).
#' @param metrics (Required) Character vector, metrics to retrieve, as 'metricsList' in API.
#' @return A tibble of the flattened financial data.
#' @export
#' @details fs_type should be one of the following: 'bank', 'insurance',
#' 'security', 'non_financial', 'reit', 'other_financial'.
#' @examples
#' \dontrun{
#' lxr_cn_company_fs(token = "your_token",
#'                   fs_type = "non_financial",
#'                   date = "latest",
#'                   start_date = "2020-01-01",
#'                   end_date = "2020-12-31",
#'                   stock_codes = c("300750", "600519"),
#'                   metrics = c("q.ps.to.it", "q.bs.ar.c.y2"))
#'}
lxr_cn_company_fs <-
  function(token = NULL,
           fs_type = "non_financial",
           date = NULL,
           start_date = NULL,
           end_date = NULL,
           stock_codes = NULL,
           metrics = NULL) {
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
      metrics = metrics
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
