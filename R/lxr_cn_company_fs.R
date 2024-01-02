#' Query Financial Statements
#'
#' Fetches financial statement data for Chinese companies from Lixinger API.
#'
#' @details fsType should be one of the following: 'bank', 'insurance',
#' 'security', 'non_financial', 'reit', 'other_financial'.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger API
#' that this function interfaces with, please visit the Lixinger API documentation:
#' \url{https://www.lixinger.com/open/api/doc?api-key=cn/company/fs/non_financial}
#'
#' @param token Character string, API access authentication token.
#' @param fsType Character string, type of financial statements, see Details.
#' @param date Character string, specific date or "latest" in "YYYY-MM-DD" format.
#' @param startDate Character string, start date in "YYYY-MM-DD" format.
#' @param endDate Character string, end date in "YYYY-MM-DD" format.
#' @param stockCodes Character vector, stock codes for data retrieval (max 100).
#' @param metricsList Character vector, metrics to retrieve.
#' @return A tibble of the flattened financial data.
#' @export
#'
#' @examples
#' # Fetch data for a specific date
#' lxr_cn_company_fs(
#'   date = "2023-09-30",
#'   stockCodes = c("300750", "600519", "600157"),
#'   metricsList = c("q.ps.toi.t")
#' )
#'
#' # Fetch data over a date range
#' lxr_cn_company_fs(
#'   startDate = "2022-09-30",
#'   endDate = "2023-09-30",
#'   stockCodes = "300750",
#'   metricsList = "q.ps.toi.t"
#' )
lxr_cn_company_fs <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
           fsType = "non_financial",
           date = NULL,
           startDate = NULL,
           endDate = NULL,
           stockCodes,
           metricsList) {
    valid_fs_types <- c("bank", "insurance", "security",
                        "non_financial", "reit", "other_financial")
    if(!fsType %in% valid_fs_types) {
      stop("Unknown `financial_report_type`")
    }

    url_base <- "https://open.lixinger.com/api/cn/company/fs/"
    url = paste0(url_base, fsType)

    lxr_query(
      url = url,
      token = token,
      date = date,
      startDate = startDate,
      endDate = endDate,
      stockCodes = stockCodes,
      metricsList = metricsList
    ) %>%
      magrittr::use_series("data") %>%
      jsonlite::flatten() %>%
      tibble::as_tibble()
  }
