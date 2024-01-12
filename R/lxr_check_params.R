#' Check Query Parameters
#'
#' This function checks if the provided query parameters are valid and complete.
#' It compares the names of the query parameters with the valid and required
#' parameters for the specified API endpoint. If there are invalid or missing
#' parameters, it will stop the function and return an error message.
#'
#' @param query_params A named list of query parameters.
#' @param valid_params A character vector of valid parameter names.
#' @param required_params A character vector of required parameter names.
#'
#' @return This function does not return a value. If the check is successful,
#'   the function will complete silently. If there are invalid or missing
#'   parameters, the function will stop and return an error message.
lxr_check_params <- function(query_params, valid_params, required_params) {
  if (!all(names(query_params) %in% valid_params)) {
    invalid_params <- setdiff(names(query_params), valid_params)
    message <- glue::glue(
      "Invalid parameters: {paste(invalid_params, collapse = ', ')} \n",
      "Valid parameters are: {paste(valid_params, collapse = ', ')}"
    )
    usethis::ui_stop(message)
  }

  if (!is.null(required_params) &&
    !all(required_params %in% names(query_params))) {
    missing_required_params <- setdiff(required_params, names(query_params))
    message <- glue::glue(
      "Missing required parameters: ",
      "{paste(missing_required_params, collapse = ', ')}."
    )
    usethis::ui_stop(message)
  }
}
