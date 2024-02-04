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

test_that("test hk_company_fund_collection_shareholders", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fund_collection_shareholders(),
    start_date = "2023-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_dividend", {
  result <- lxr_query(
    endpoint = lxr_hk_company_dividend(),
    start_date = "2023-01-03",
    end_date = "2024-02-03",
    stock_code = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_split", {
  result <- lxr_query(
    endpoint = lxr_hk_company_split(),
    start_date = "2015-01-03",
    end_date = "2024-02-03",
    stock_code = "02269"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_allotment", {
  result <- lxr_query(
    endpoint = lxr_hk_company_allotment(),
    start_date = "2015-01-03",
    end_date = "2024-02-03",
    stock_code = "02016"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_non_financial", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_non_financial(),
    date = "2024-01-18",
    stock_codes = "00700",
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_bank", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_non_financial(),
    date = "2024-01-18",
    stock_codes = "01398",
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_security", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_security(),
    date = "2024-01-18",
    stock_codes = "01398",
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_insurance", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_insurance(),
    date = "2024-01-18",
    stock_codes = "01336",
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fundamental_reit", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fundamental_reit(),
    date = "2024-01-18",
    stock_codes = "02778",
    metrics_list = c("pe_ttm", "mc")
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_non_financial", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_non_financial(),
    date = "2023-09-30", stock_codes = "00700",
    metrics_list = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_bank", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_bank(),
    date = "2023-09-30", stock_codes = "01398",
    metrics_list = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_security", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_security(),
    date = "2023-09-30", stock_codes = "06030",
    metrics_list = "q.ps.oi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_insurance", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_insurance(),
    date = "2023-09-30", stock_codes = "01336",
    metrics_list = "q.ps.oi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_reit", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_reit(),
    date = "latest", stock_codes = "02191",
    metrics_list = "q.ps.oi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_fs_other_financial", {
  result <- lxr_query(
    endpoint = lxr_hk_company_fs_other_financial(),
    date = "latest", stock_codes = "03877",
    metrics_list = "q.ps.oi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})

test_that("test hk_company_hot_tr_dri", {
  result <- lxr_query(
    endpoint = lxr_hk_company_hot_tr_dri(),
    stock_codes = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})
