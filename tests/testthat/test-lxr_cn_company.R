test_that("test cn_company", {
  result <- lxr_query(
    endpoint = lxr_cn_company(),
    stock_codes = c("300750", "600519", "600157")
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_equity_change", {
  result <- lxr_query(
    endpoint = lxr_cn_company_equity_change(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_candlestick", {
  result <- lxr_query(
    endpoint = lxr_cn_company_candlestick(),
    type = "lxr_fc_rights", start_date = "2022-09-20", end_date = "2023-09-20",
    stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_shareholders_num", {
  result <- lxr_query(
    endpoint = lxr_cn_company_shareholders_num(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_senior_executive_shares_change", {
  result <- lxr_query(
    endpoint = lxr_cn_company_senior_executive_shares_change(),
    start_date = "2021-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_block_deal", {
  result <- lxr_query(
    endpoint = lxr_cn_company_block_deal(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_operation_revenue_constitution", {
  result <- lxr_query(
    endpoint = lxr_cn_company_operation_revenue_constitution(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_operating_data", {
  result <- lxr_query(
    endpoint = lxr_cn_company_operating_data(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "600157"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_pledge", {
  result <- lxr_query(
    endpoint = lxr_cn_company_pledge(),
    start_date = "2022-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_dividend", {
  result <- lxr_query(
    endpoint = lxr_cn_company_dividend(),
    start_date = "2023-01-11", end_date = "2024-01-11", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fs_non_financial", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fs_non_financial(),
    date = "2022-09-30", stock_codes = c("300750", "600519", "600157"),
    metrics_list = c("q.ps.toi.t")
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_indices", {
  result <- lxr_query(
    endpoint = lxr_cn_company_indices(),
    stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_industries", {
  result <- lxr_query(
    endpoint = lxr_cn_company_industries(),
    stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})
