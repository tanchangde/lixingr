test_that("test hk_company", {
  result <- lxr_query(
    endpoint = lxr_hk_company(),
    stock_codes = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_candlestick", {
  result <- lxr_query(
    endpoint = lxr_hk_company_candlestick(),
    type = "lxr_fc_rights",
    start_date = "2024-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_employee", {
  result <- lxr_query(
    endpoint = lxr_hk_company_employee(),
    start_date = "2021-02-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_repurchase", {
  result <- lxr_query(
    endpoint = lxr_hk_company_repurchase(),
    start_date = "2023-02-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_short_selling", {
  result <- lxr_query(
    endpoint = lxr_hk_company_short_selling(),
    start_date = "2024-01-01",
    end_date = "2024-02-03",
    stock_code = "02269"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_operation_revenue_constitution", {
  result <- lxr_query(
    endpoint = lxr_hk_company_operation_revenue_constitution(),
    start_date = "2023-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_indices", {
  result <- lxr_query(
    endpoint = lxr_hk_company_indices(),
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_industries", {
  result <- lxr_query(
    endpoint = lxr_hk_company_industries(),
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_statistics", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_statistics(),
    stock_codes = "00700",
    granularity = "y3",
    metrics_list = "pe_ttm"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_announcement", {
  result <- lxr_query(
    endpoint = lxr_hk_company_announcement(),
    start_date = "2023-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fund_shareholders", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fund_shareholders(),
    start_date = "2023-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})
