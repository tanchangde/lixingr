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
#' @export
#' @param token API token for authentication.
#' @param fsType (Optional) Type of financial statements to query. Options:
#'        'non_financial', 'bank', 'insurance', 'security', 'other_financial'.
#' @param mutualMarkets (Optional) Markets to include in the query. Options: 'ha'.
#' @param stockCodes (Optional) Vector of stock codes to query.
#' @param includeDelisted (Optional) Boolean indicating whether to include delisted
#'        companies in the results.
#'
#' @return A tibble with the requested company data, with each market provided by
#'         mutualMarkets unnested into longer format.
#'
#' @importFrom magrittr use_series
#' @importFrom tibble as_tibble
#' @importFrom tidyr unnest_longer
#' @importFrom rlang .data
#' @examples
#' # Retrieve information for all stocks
#' lxr_cn_company()
#'
#' # Retrieve information for all stocks with a specific type of financial statements
#' lxr_cn_company(fsType = "non_financial")
#'
#' # Retrieve information for specific stocks
#' lxr_cn_company(stockCodes = c("300750", "600519", "600157"))
#'
#' # Retrieve data for stocks in the Shanghai-Hong Kong Stock Connect (Shanghai segment)
#' lxr_cn_company(mutualMarkets = "ha")
lxr_cn_company <-
  function(token = NULL,
           fsType = NULL,
           mutualMarkets = NULL,
           stockCodes = NULL,
           includeDelisted = NULL) {
    url <- "https://open.lixinger.com/api/cn/company"
    lxr_query(
      url = url,
      token = token,
      fsType = fsType,
      mutualMarkets = mutualMarkets,
      stockCodes = stockCodes,
      includeDelisted = includeDelisted
    ) %>%
      magrittr::use_series("data") %>%
      tibble::as_tibble() %>%
      tidyr::unnest_longer(col = "mutualMarkets")
  }
