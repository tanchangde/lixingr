test_that("Basic Functionality", {
  result <- lxr_cn_company_candlestick(
    type = "lxr_fc_rights",
    start_date = "2023-01-03",
    end_date = "2024-01-03",
    stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})
