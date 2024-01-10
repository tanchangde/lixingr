#' Generate request parameters for Lixinger API
#'
#' This function generates a list of valid and required parameters for the
#' specified LXR API. The parameters are determined based on the API function.
#'
#' @param api_endpoint A function representing the Lixinger API.
#'
#' @return A list containing two elements: 'valid_params' and 'required_params'.
#' 'valid_params' is a vector of strings representing the names of the valid
#' parameters for the API. 'required_params' is a vector of strings representing
#' the names of the required parameters for the API.
#'
#' @examples
#' lxr_request_params(api_endpoint = lxr_cn_company())
#' 
#' @export
lxr_request_params <- function(api_endpoint) {
  api_name <- lxr_api_name(api_endpoint)

  fs_params <- list(
    valid_params = c("date", "startDate", "endDate", "limit", "stockCodes",
      "metricsList"),
    required_params = c("stockCodes", "metricsList")
  )

  switch(api_name,
    cn_company = list(
      valid_params = c(
        "fsType", "mutualMarkets", "stockCodes",
        "includeDelisted"
      ),
      required_params = NULL
    ),
    cn_company_equity_change = list(
      valid_params = c("startDate", "endDate", "limit", "stockCode"),
      required_params = c("startDate", "stockCode")
    ),
    cn_company_candlestick = list(
      valid_params = c(
        "type", "startDate", "endDate", "adjustForwardDate",
        "adjustBackwardDate", "limit", "stockCode"
      ),
      required_params = c("type", "startDate", "stockCode")
    ),
    cn_company_dividend = list(
      valid_params = c("startDate", "endDate", "limit", "stockCode"),
      required_params = c("startDate", "stockCode")
    ),
    cn_company_fs_non_financial = fs_params,
    cn_company_fs_bank = fs_params,
    cn_company_fs_security = fs_params,
    cn_company_fs_insurance = fs_params,
    cn_company_fs_other_financial = fs_params
  )
}