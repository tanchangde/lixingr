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

test_that("error on no data after successful query", {
  expect_error(
    lxr_query(
      endpoint = lxr_cn_company_dividend(),
      start_date = "2023-11-13", end_date = "2024-01-13", stock_code = "300750",
    ),
    "Query was successful, but no data returned."
  )
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

test_that("test cn_company_fundamental_statistics", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fundamental_statistics(),
    stock_codes = c("300750", "600519", "600157"),
    granularity = "y3",
    metrics_list = "pe_ttm"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_trading_abnormal", {
  result <- lxr_query(
    endpoint = lxr_cn_company_trading_abnormal(),
    start_date = "2014-09-20", end_date = "2023-09-20", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_announcement", {
  result <- lxr_query(
    endpoint = lxr_cn_company_announcement(),
    start_date = "2022-09-20", end_date = "2022-09-30", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_measures", {
  result <- lxr_query(
    endpoint = lxr_cn_company_measures(),
    start_date = "2016-01-16", end_date = "2024-01-16", stock_code = "600519"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_inquiry", {
  result <- lxr_query(
    endpoint = lxr_cn_company_inquiry(),
    start_date = "2023-01-17", end_date = "2024-01-17", stock_code = "688337"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_majority_shareholders", {
  result <- lxr_query(
    endpoint = lxr_cn_company_majority_shareholders(),
    start_date = "2023-01-17", end_date = "2024-01-17", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_nolimit_shareholders", {
  result <- lxr_query(
    endpoint = lxr_cn_company_nolimit_shareholders(),
    start_date = "2023-01-17", end_date = "2024-01-17", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fund_shareholders", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fund_shareholders(),
    start_date = "2023-11-01", end_date = "2024-01-17", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fund_collection_shareholders", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fund_collection_shareholders(),
    start_date = "2023-11-01", end_date = "2024-01-17", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_allotment", {
  result <- lxr_query(
    endpoint = lxr_cn_company_allotment(),
    start_date = "2022-01-18", end_date = "2024-01-18", stock_code = "600958"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_customers", {
  result <- lxr_query(
    endpoint = lxr_cn_company_customers(),
    start_date = "2022-01-18", end_date = "2024-01-18", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_suppliers", {
  result <- lxr_query(
    endpoint = lxr_cn_company_customers(),
    start_date = "2022-01-18", end_date = "2024-01-18", stock_code = "300750"
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fundamental_non_financial", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fundamental_non_financial(),
    date = "2024-01-18",
    stock_codes = c("300750", "600519", "600157"),
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fundamental_bank", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fundamental_bank(),
    date = "2024-01-09",
    stock_codes = c("600016", "601398"),
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
})

test_that("test cn_company_fundamental_security", {
  result <- lxr_query(
    endpoint = lxr_cn_company_fundamental_security(),
    date = "2024-01-09",
    stock_codes = c("600030"),
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
})
