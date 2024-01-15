#' China Mainland company API endpoints
#'
#' @description
#' These functions return the API endpoints for different aspects of a Mainland
#' company.
#'
#' * `lxr_cn_company()` gets stock detailed information.
#' * `lxr_cn_company_equity_change()` gets equity change data.
#' * `lxr_cn_company_candlestick()` gets stock K line data.
#' * `lxr_cn_company_shareholders_num()` gets number of shareholders data.
#' * `lxr_cn_company_senior_executive_shares_change()` gets senior executive
#'   shares change data.
#' * `lxr_cn_company_block_deal()` gets block deal data.
#' * `lxr_cn_company_pledge()` gets equity pledge data.
#' * `lxr_cn_company_operation_revenue_constitution()` gets operation revenue
#'   constitution data.
#' * `lxr_cn_company_operating_data()` gets operating data information.
#' * `lxr_cn_company_dividend()` gets dividend information.
#' * `lxr_cn_company_fs_non_financial()` gets non-financial listed company
#'   financial data.
#' * `lxr_cn_company_fs_bank()` gets bank listed company financial data.
#' * `lxr_cn_company_fs_security()` gets security listed company financial data.
#' * `lxr_cn_company_fs_insurance()` gets insurance listed company financial data.
#' * `lxr_cn_company_fs_other_financial()` gets other financial listed company
#'   financial data.
#' * `lxr_cn_company_indices()` gets stock indices information.
#' * `lxr_cn_company_industries()` gets stock industry information.
#' * `lxr_cn_company_fundamental_statistics()` gets stock fundamental
#'   statistics data.
#' * `lxr_cn_company_trading_abnormal()` gets trading abnormal data.
#'
#' @return A string of the API endpoint.
#' @rdname lxr_cn_company
#' @export
lxr_cn_company <- function() {
  "https://open.lixinger.com/api/cn/company"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_equity_change <- function() {
  "https://open.lixinger.com/api/cn/company/equity-change"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_candlestick <- function() {
  "https://open.lixinger.com/api/cn/company/candlestick"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_shareholders_num <- function() {
  "https://open.lixinger.com/api/cn/company/shareholders-num"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_senior_executive_shares_change <- function() {
  "https://open.lixinger.com/api/cn/company/senior-executive-shares-change"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_block_deal <- function() {
  "https://open.lixinger.com/api/cn/company/block-deal"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_pledge <- function() {
  "https://open.lixinger.com/api/cn/company/pledge"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_operation_revenue_constitution <- function() {
  "https://open.lixinger.com/api/cn/company/operation-revenue-constitution"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_operating_data <- function() {
  "https://open.lixinger.com/api/cn/company/operating-data"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_dividend <- function() {
  "https://open.lixinger.com/api/cn/company/dividend"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fs_non_financial <- function() {
  "https://open.lixinger.com/api/cn/company/fs/non_financial"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fs_bank <- function() {
  "https://open.lixinger.com/api/cn/company/fs/bank"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fs_security <- function() {
  "https://open.lixinger.com/api/cn/company/fs/security"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fs_insurance <- function() {
  "https://open.lixinger.com/api/cn/company/fs/insurance"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fs_other_financial <- function() {
  "https://open.lixinger.com/api/cn/company/fs/other_financial"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_indices <- function() {
  "https://open.lixinger.com/api/cn/company/indices"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_industries <- function() {
  "https://open.lixinger.com/api/cn/company/industries"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_fundamental_statistics <- function() {
  "https://open.lixinger.com/api/cn/company/fundamental-statistics"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_trading_abnormal <- function() {
  "https://open.lixinger.com/api/cn/company/trading-abnormal"
}

#' @rdname lxr_cn_company
#' @export
lxr_cn_company_announcement <- function() {
  "https://open.lixinger.com/api/cn/company/announcement"
}
