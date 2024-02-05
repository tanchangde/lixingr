#' Generate query parameters for lixinger API
#'
#' This function generates a list of valid and required parameters for the
#' specified lixinger API. The parameters are determined based on the API
#' function.
#'
#' @param endpoint A function representing the lixinger API.
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

  min_params <- list(
    valid_params = "stockCodes", required_params = "stockCodes"
  )
  common_params <- list(
    valid_params = c("startDate", "endDate", "limit", "stockCode"),
    required_params = c("startDate", "stockCode")
  )
  fs_params <- list(
    valid_params = c(
      "date", "startDate", "endDate", "limit", "stockCodes", "metricsList"
    ),
    required_params = c("stockCodes", "metricsList")
  )
  fundamental_params <- list(
    valid_params = c(
      "date", "startDate", "endDate", "adjustForwardDate",
      "adjustBackwardDate", "limit", "stockCodes", "metricsList"
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
    cn_company_profile = min_params,
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
    ),
    cn_company_industries = list(
      valid_params = c("stockCode", "date"),
      required_params = c("stockCode")
    ),
    cn_company_fundamental_statistics = list(
      valid_params = c("stockCodes", "granularity", "metricsList"),
      required_params = c("stockCodes", "granularity", "metricsList")
    ),
    cn_company_trading_abnormal = list(
      valid_params = c("startDate", "endDate", "limit", "stockCode"),
      required_params = c("startDate", "stockCode")
    ),
    cn_company_announcement = common_params,
    cn_company_measures = common_params,
    cn_company_inquiry = common_params,
    cn_company_majority_shareholders = common_params,
    cn_company_nolimit_shareholders = common_params,
    cn_company_fund_shareholders = common_params,
    cn_company_fund_collection_shareholders = common_params,
    cn_company_allotment = common_params,
    cn_company_customers = common_params,
    cn_company_suppliers = common_params,
    cn_company_fundamental_non_financial = fundamental_params,
    cn_company_fundamental_bank = fundamental_params,
    cn_company_fundamental_security = fundamental_params,
    cn_company_fundamental_insurance = fundamental_params,
    cn_company_fundamental_other_financial = fundamental_params,
    cn_company_hot_tr_dri = min_params,
    cn_company_hot_mm_ha = min_params,
    cn_company_hot_mtasl = min_params,
    cn_company_hot_shnc = min_params,
    cn_company_hot_esc = min_params,
    cn_company_hot_elr = min_params,
    cn_company_hot_ple = min_params,
    cn_company_hot_df = min_params,
    cn_company_margin_trading_and_securities_lending = common_params,
    hk_company = list(
      valid_params = c(
        "fsType", "mutualMarkets", "stockCodes", "includeDelisted"
      ),
      required_params = NULL
    ),
    hk_company_profile = min_params,
    hk_company_candlestick = list(
      valid_params = c(
        "type", "startDate", "endDate", "adjustForwardDate",
        "adjustBackwardDate", "limit", "stockCode"
      ),
      required_params = c("type", "startDate", "stockCode")
    ),
    hk_company_employee = common_params,
    hk_company_repurchase = common_params,
    hk_company_short_selling = common_params,
    hk_company_operation_revenue_constitution = common_params,
    hk_company_indices = list(
      valid_params = c("stockCode", "date"),
      required_params = c("stockCode")
    ),
    hk_company_industries = list(
      valid_params = c("stockCode", "date"),
      required_params = c("stockCode")
    ),
    hk_company_fundamental_statistics = list(
      valid_params = c("stockCodes", "granularity", "metricsList"),
      required_params = c("stockCodes", "granularity", "metricsList")
    ),
    hk_company_announcement = common_params,
    hk_company_fund_shareholders = common_params,
    hk_company_fund_collection_shareholders = common_params,
    hk_company_dividend = common_params,
    hk_company_split = common_params,
    hk_company_allotment = common_params,
    hk_company_fundamental_non_financial = fundamental_params,
    hk_company_fundamental_bank = fundamental_params,
    hk_company_fundamental_security = fundamental_params,
    hk_company_fundamental_insurance = fundamental_params,
    hk_company_fundamental_reit = fundamental_params,
    hk_company_fs_non_financial = fs_params,
    hk_company_fs_bank = fs_params,
    hk_company_fs_security = fs_params,
    hk_company_fs_insurance = fs_params,
    hk_company_fs_reit = fs_params,
    hk_company_fs_other_financial = fs_params,
    hk_company_hot_tr_dri = min_params,
    hk_company_hot_mm_ah = min_params,
    hk_company_hot_ss = min_params,
    hk_company_mutual_market = common_params
  )
}
