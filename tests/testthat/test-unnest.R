test_that("nested dataframes in list columns should be fully expanded", {
  result <- lxr_query(
    endpoint = lxr_cn_company_trading_abnormal(),
    start_date = "2018-06-15", end_date = "2018-06-17", stock_code = "300750"
  ) %>% purrr::none(is.list)
  expect_true(result)
})
