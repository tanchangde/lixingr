#' Hong Kong company API endpoints
#'
#' @description
#' These functions return the API endpoints for different aspects of a China
#' Hong Kong company.
#'
#' * `lxr_hk_company()` retrieve stock details.
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
#'
#' @return A string of the API endpoint.

#' @rdname lxr_hk_company
#' @export
lxr_hk_company <- function() {
  "https://open.lixinger.com/api/hk/company"
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
