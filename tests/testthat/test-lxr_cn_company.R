test_that("invalid parameters should return error", {
  expect_error(lxr_query(
    api_endpoint = lxr_cn_company_dividend(),
    invalid_params = "invalid"
  ))
})

test_that("missing parameters should return error", {
  expect_error(lxr_query(
    api_endpoint = lxr_cn_company_equity_change(),
    start_date = "2022-09-20", limit = 1314
  ))
})

test_that("test cn_company", {
  result <- lxr_query(
    api_endpoint = lxr_cn_company(),
    stock_codes = c("300750", "600519", "600157")
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_equity_change", {
  result <- lxr_query(
    api_endpoint = lxr_cn_company_equity_change(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_dividend", {
  result <- lxr_query(
    api_endpoint = lxr_cn_company_dividend(),
    start_date = "2023-01-11", end_date = "2024-01-11", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fs_non_financial", {
  result <- lxr_query(
    api_endpoint = lxr_cn_company_fs_non_financial(),
    date = "2022-09-30", stock_codes = c("300750", "600519", "600157"),
    metrics_list = c("q.ps.toi.t")
  )
  expect_s3_class(result, "tbl_df")
})
