#' China Hong Kong company API endpoints
#'
#' @description
#' These functions return the API endpoints for different aspects of a China
#' Hong Kong company.
#'
#' * `lxr_hk_company()` retrieve stock details.
#'
#' @return A string of the API endpoint.

#' @rdname lxr_hk_company
#' @export
lxr_hk_company <- function() {
  "https://open.lixinger.com/api/hk/company"
}
