#' Unnest Dataframes in List Columns
#'
#' @description Unnest a dataframe with list columns, where the list columns
#'   contain nested dataframes.
#'
#' @param df A dataframe with one or more list columns containing nested
#' dataframes to be unnested.
#' @return A dataframe where each list column has been unnested into
#' multiple rows.
#'
#' @importFrom dplyr select full_join row_number mutate
#' @importFrom tidyselect all_of
#' @importFrom tidyr unnest
#' @importFrom purrr keep
#' @importFrom rlang .data
lxr_unnest <- function(df) {
  list_cols <- df %>%
    purrr::keep(~ is.list(.x)) %>%
    names()
  non_list_cols <- setdiff(names(df), list_cols)

  if (length(list_cols) == 0) {
    return(df)
  }

  df_result <- NULL
  for (col in list_cols) {
    expanded_df <- df %>%
      dplyr::select(tidyselect::all_of(c(non_list_cols, col))) %>%
      dplyr::mutate(original_row_id = dplyr::row_number()) %>%
      tidyr::unnest(cols = tidyselect::all_of(col), names_sep = ".") %>%
      dplyr::group_by(.data$original_row_id) %>%
      dplyr::mutate(grouped_row_id = dplyr::row_number()) %>%
      dplyr::ungroup()

    if (is.null(df_result)) {
      df_result <- expanded_df
    } else {
      df_result <- dplyr::full_join(
        df_result,
        expanded_df,
        by = c("original_row_id", "grouped_row_id", non_list_cols)
      )
    }
  }

  df_result %>%
    dplyr::select(-"original_row_id", -"grouped_row_id")
}
