test_that("Parameter Validity", {
  expect_error(lxr_cn_company_fs(fsType = "invalid_type"))
})

test_that("Basic Functionality", {
  result <- lxr_cn_company_fs(
    date = "2023-09-30",
    stockCodes = c("300750", "600519", "600157"),
    metricsList = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true("date" %in% names(result))
})

test_that("Date Range Functionality", {
  result <- lxr_cn_company_fs(
    startDate = "2022-09-30",
    endDate = "2023-09-30",
    stockCodes = "300750",
    metricsList = "q.ps.toi.t"
  )
  expect_s3_class(result, "tbl_df")
  expect_true("date" %in% names(result))
})
