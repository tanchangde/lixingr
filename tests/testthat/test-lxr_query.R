test_that("Basic Functionality Test", {
  result <- lxr_query(api_endpoint = lxr_cn_company(),
  stock_codes = c("300750", "600519", "600157"))
  expect_s3_class(result, "tbl_df")
  common_columns <- c("exchange", "market")
  expect_true(all(common_columns %in% names(result)))
})

test_that("Invalid Parameters Should Return Error", {
  expect_error(lxr_query(api_endpoint = lxr_cn_company_dividend(),
  invalid_params = "invalid"))
})

test_that("Missing Parameters Should Return Error", {
  expect_error(lxr_query(api_endpoint = lxr_cn_company_equity_change(),
    start_date = "2022-09-20", limit = 1314))
})