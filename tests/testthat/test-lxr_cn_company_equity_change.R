test_that("Basic Functionality", {
  result <- lxr_cn_company_equity_change(
    start_date = "2022-09-20",
    limit = 1314,
    stock_code = "002352"
  )
  expect_s3_class(result, "tbl_df")
})
