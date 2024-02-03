#' China Hong Kong company API endpoints
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
