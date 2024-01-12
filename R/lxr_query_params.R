#' Generate query parameters for Lixinger API
#'
#' This function generates a list of valid and required parameters for the
#' specified Lixinger API. The parameters are determined based on the API
#' function.
#'
#' @param endpoint A function representing the Lixinger API.
#'
#' @return A list containing two elements: 'valid_params' and 'required_params'.
#' 'valid_params' is a vector of strings representing the names of the valid
#' parameters for the API. 'required_params' is a vector of strings representing
#' the names of the required parameters for the API.
#'
#' @examples
#' lxr_query_params(endpoint = lxr_cn_company())
#'
#' @export
lxr_query_params <- function(endpoint) {
  endpoint_name <- lxr_endpoint_name(endpoint)

  common_params <- list(
    valid_params = c("startDate", "endDate", "limit", "stockCode"),
    required_params = c("startDate", "stockCode")
  )
  fs_params <- list(
    valid_params = c(
      "date", "startDate", "endDate", "limit", "stockCodes",
      "metricsList"
    ),
    required_params = c("stockCodes", "metricsList")
  )

  switch(endpoint_name,
    cn_company = list(
      valid_params = c(
        "fsType", "mutualMarkets", "stockCodes", "includeDelisted"
      ),
      required_params = NULL
    ),
    cn_company_equity_change = common_params,
    cn_company_candlestick = list(
      valid_params = c(
        "type", "startDate", "endDate", "adjustForwardDate",
        "adjustBackwardDate", "limit", "stockCode"
      ),
      required_params = c("type", "startDate", "stockCode")
    ),
    cn_company_shareholders_num = common_params,
    cn_company_senior_executive_shares_change = common_params,
    cn_company_block_deal = common_params,
    cn_company_pledge = common_params,
    cn_company_operation_revenue_constitution = common_params,
    cn_company_operating_data = common_params,
    cn_company_dividend = common_params,
    cn_company_fs_non_financial = fs_params,
    cn_company_fs_bank = fs_params,
    cn_company_fs_security = fs_params,
    cn_company_fs_insurance = fs_params,
    cn_company_fs_other_financial = fs_params,
    cn_company_indices = list(
      valid_params = c("stockCode", "date"),
      required_params = c("stockCode")
    )
  )
}
