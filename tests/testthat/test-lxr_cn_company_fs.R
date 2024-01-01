test_that("Parameter Validity", {
  expect_error(lxr_cn_company_fs(fs_type = "invalid_type"))
})

test_that("Basic Functionality", {
  result <- lxr_cn_company_fs(
    date = "2023-09-30",
    stock_codes = c("300750", "600519", "600157"),
    metrics = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true("date" %in% names(result))
})

test_that("Date Range Functionality", {
  result <- lxr_cn_company_fs(
    start_date = "2022-09-30",
    end_date = "2023-09-30",
    stock_codes = "300750",
    metrics = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true("date" %in% names(result))
})
