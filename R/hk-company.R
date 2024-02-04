#' Hong Kong company API endpoints
#'
#' @description
#' These functions return the API endpoints for different aspects of a China
#' Hong Kong company.
#'
#' * `lxr_hk_company()` retrieve stock details.
#' * `hk_company_profile()` obtain company profile.
#' * `lxr_hk_company_candlestick()` obtain candlestick data.The ex-rights
#'   calculation is only applied to the prices for the selected time period;
#'   trading volume is not adjusted for ex-rights.
#' * `lxr_hk_company_employee()` obtain employee data.
#' * `lxr_hk_company_repurchase()` obtain repurchase data. Calculate the share
#'   capital as the total of H shares.
#' * `lxr_hk_company_short_selling()` retrieve short-selling data, with the
#'   capital stock calculated being the total H shares.
#' * `lxr_hk_company_operation_revenue_constitution()` obtain revenue
#'   composition data.
#' * `lxr_hk_company_indices()` get information on the stock index it belongs to.
#' * `lxr_hk_company_industries()` get information on the industry the stock
#'   belongs to.
#' * `lxr_hk_company_fundamental_statistics()` get fundamental analysis
#'   statistical data.
#' * `lxr_hk_company_announcement()` get the announcement information.
#' * `lxr_hk_company_fund_shareholders()` obtain information on domestic fund
#'   holdings.
#' * `lxr_hk_company_fund_collection_shareholders()` obtain the shareholding
#'   information of domestic fund companies."
#' * `lxr_hk_company_dividend()` get dividend information.
#' * `lxr_hk_company_split()` get split data.
#' * `lxr_hk_company_allotment()` obtain rights issue information.
#' * `lxr_hk_company_fundamental_non_financial()` gets fundamental data for
#'   non-financial companies, such as PE, PB, etc.
#' * `lxr_hk_company_fundamental_bank()` gets fundamental data for bank, such as
#'   PE, PB, etc.
#' * `lxr_hk_company_fundamental_security()` gets fundamental data for
#'   securities, such as PE, PB, etc.
#' * `lxr_hk_company_fundamental_insurance()` gets fundamental data for
#'   insurance company, such as PE, PB, etc.
#' * `lxr_hk_company_fundamental_reit()` obtain fundamental data of REITs, such
#'   as PE, PB, etc.
#' * `lxr_hk_company_fs_non_financial()` gets non-financial listed company
#'   financial data.
#' * `lxr_hk_company_fs_bank()` gets bank listed company financial data.
#' * `lxr_hk_company_fs_security` gets security listed company financial data.
#' * `lxr_hk_company_fs_insurance()` get insurance company financial data.
#' * `lxr_hk_company_fs_reit()` obtain financial data of REITs.
#' * `lxr_hk_company_fs_other_financial()` gets other financial listed company
#'   financial data.
#' * `lxr_hk_company_hot_tr_dri()` obtain dividend reinvestment yield data.
#' * `lxr_hk_company_hot_mm_ah()` obtain interconnectivity data.
#'
#' @return A string of the API endpoint.

#' @rdname lxr_hk_company
#' @export
lxr_hk_company <- function() {
  "https://open.lixinger.com/api/hk/company"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_profile <- function() {
  "https://open.lixinger.com/api/hk/company/profile"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_candlestick <- function() {
  "https://open.lixinger.com/api/hk/company/candlestick"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_employee <- function() {
  "https://open.lixinger.com/api/hk/company/employee"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_repurchase <- function() {
  "https://open.lixinger.com/api/hk/company/repurchase"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_short_selling <- function() {
  "https://open.lixinger.com/api/hk/company/short-selling"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_operation_revenue_constitution <- function() {
  "https://open.lixinger.com/api/hk/company/operation-revenue-constitution"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_indices <- function() {
  "https://open.lixinger.com/api/hk/company/indices"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_industries <- function() {
  "https://open.lixinger.com/api/hk/company/industries"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_statistics <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental-statistics"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_announcement <- function() {
  "https://open.lixinger.com/api/hk/company/announcement"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fund_shareholders <- function() {
  "https://open.lixinger.com/api/hk/company/fund-shareholders"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fund_collection_shareholders <- function() {
  "https://open.lixinger.com/api/hk/company/fund-collection-shareholders"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_dividend <- function() {
  "https://open.lixinger.com/api/hk/company/dividend"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_split <- function() {
  "https://open.lixinger.com/api/hk/company/split"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_allotment <- function() {
  "https://open.lixinger.com/api/hk/company/allotment"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_non_financial <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental/non_financial"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_bank <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental/bank"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_security <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental/security"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_insurance <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental/insurance"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fundamental_reit <- function() {
  "https://open.lixinger.com/api/hk/company/fundamental/reit"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_non_financial <- function() {
  "https://open.lixinger.com/api/hk/company/fs/non_financial"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_bank <- function() {
  "https://open.lixinger.com/api/hk/company/fs/bank"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_security <- function() {
  "https://open.lixinger.com/api/hk/company/fs/security"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_insurance <- function() {
  "https://open.lixinger.com/api/hk/company/fs/insurance"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_reit <- function() {
  "https://open.lixinger.com/api/hk/company/fs/reit"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_fs_other_financial <- function() {
  "https://open.lixinger.com/api/hk/company/fs/other_financial"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_hot_tr_dri <- function() {
  "https://open.lixinger.com/api/hk/company/hot/tr_dri"
}

#' @rdname lxr_hk_company
#' @export
lxr_hk_company_hot_mm_ah <- function() {
  "https://open.lixinger.com/api/hk/company/hot/mm_ah"
}
