#' Query Lixinger Chinese Company Data
#'
#' Retrieves company data from the Lixinger API for Chinese companies. It allows
#' for specification of financial statement types, markets, stock codes, and the
#' option to include delisted companies in the results.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger API
#' that this function interfaces with, please visit the Lixinger API documentation:
#' \url{https://www.lixinger.com/open/api/doc?api-key=cn/company}
#'
#' @param token Mandatory API token for authentication.
#' @param fs_type Type of financial statements to query (optional). Options:
#'        'non_financial', 'bank', 'insurance', 'security', 'other_financial'.
#' @param mutual_markets Markets to include in the query (optional). Options: 'ha'.
#' @param stock_codes Vector of stock codes to query (optional).
#' @param include_delisted Boolean indicating whether to include delisted
#'        companies in the results (optional, defaults to FALSE).
#'
#' @return A tibble with the requested company data, with each market provided by
#'         mutualMarkets unnested into longer format.
#'
#
#' @examples
#' \dontrun{
#' lxr_cn_company(
#'   token = "your_api_token",
#'   stock_codes = c("300750", "600519", "600157")
#'   )
#'}
#'
#' @importFrom magrittr use_series
#' @importFrom tibble as_tibble
#' @importFrom tidyr unnest_longer
#' @importFrom rlang .data
#' @export
lxr_cn_company <-
  function(token = NULL,
           fs_type = NULL,
           mutual_markets = NULL,
           stock_codes = NULL,
           include_delisted = NULL) {
    url <- "https://open.lixinger.com/api/cn/company"
    lxr_query(
      url = url,
      token = token,
      fs_type = fs_type,
      mutual_markets = mutual_markets,
      stock_codes = stock_codes,
      include_delisted = include_delisted
    ) %>%
      magrittr::use_series("data") %>%
      tibble::as_tibble() %>%
      tidyr::unnest_longer(col = .data$mutualMarkets)
  }
