#' Query Lixinger Chinese Company Data
#'
#' Retrieves company data from the Lixinger API for Chinese companies. It allows
#' for specification of financial statement types, markets, stock codes, and the
#' option to include delisted companies in the results.
#'
#' @details fs_type should be one of the following: 'bank', 'insurance',
#' 'security', 'non_financial', 'reit', 'other_financial'.
#'
#' @references
#' For more detailed information about the parameters and usage of the Lixinger API
#' that this function interfaces with, please visit the Lixinger API documentation:
#' \url{https://www.lixinger.com/open/api/doc?api-key=cn/company}
#'
#' @export
#' @param token Character string, API access authentication token.
#' @param fs_type Character string, type of financial statements, see Details.
#' @param mutual_markets Markets to include in the query. Options: 'ha'.
#' @param stock_codes Character vector, stock codes for data retrieval.
#' @param include_delisted A Boolean value indicating whether to include delisted
#'   companies in the results. If not provided, the API defaults to false.
#'
#' @return A tibble with the requested company data, with each market provided by
#'   mutual_markets unnested into longer format.
#'
#' @importFrom magrittr use_series
#' @importFrom tibble as_tibble
#' @importFrom tidyr unnest_longer
#' @examples
#' # Retrieve information for all stocks
#' lxr_cn_company()
#'
#' # Retrieve information for all stocks with a specific type of financial statements
#' lxr_cn_company(fs_type = "non_financial")
#'
#' # Retrieve information for specific stocks
#' lxr_cn_company(stock_codes = c("300750", "600519", "600157"))
#'
#' # Retrieve data for stocks in the Shanghai-Hong Kong Stock Connect (Shanghai segment)
#' lxr_cn_company(mutual_markets = "ha")
lxr_cn_company <-
  function(token = Sys.getenv("TOKEN_LIXINGER"),
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
      tidyr::unnest_longer(col = "mutualMarkets")
  }
