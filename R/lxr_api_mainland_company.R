#' Mainland company API endpoints
#'
#' These functions return the API endpoints for different aspects of a Mainland
#' company.
#'
#' @return A string of the API endpoint.
#' @rdname cn_company_endpoints
#' @export
lxr_cn_company <- function() {
  "https://open.lixinger.com/api/cn/company"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_equity_change <- function() {
  "https://open.lixinger.com/api/cn/company/equity-change"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_candlestick <- function() {
  "https://open.lixinger.com/api/cn/company/candlestick"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_dividend <- function() {
  "https://open.lixinger.com/api/cn/company/dividend"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_fs_non_financial <- function() {
  "https://open.lixinger.com/api/cn/company/fs/non_financial"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_fs_bank <- function() {
  "https://open.lixinger.com/api/cn/company/fs/bank"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_fs_security <- function() {
  "https://open.lixinger.com/api/cn/company/fs/security"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_fs_insurance <- function() {
  "https://open.lixinger.com/api/cn/company/fs/insurance"
}

#' @rdname cn_company_endpoints
#' @export
lxr_cn_company_fs_other_financial <- function() {
  "https://open.lixinger.com/api/cn/company/fs/other_financial"
}
