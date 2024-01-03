test_that("Basic Functionality Test", {
  result <- lxr_cn_company()
  expect_s3_class(result, "tbl_df")
  common_columns <- c("name", "exchange", "market", "stockCode")
  expect_true(all(common_columns %in% names(result)))
})

test_that("Filter Functionality Test for fs_type", {
  result <- lxr_cn_company(fs_type = "non_financial")
  if ("fsType" %in% names(result)) {
    expect_true(all(result$fsType == "non_financial"))
  } else {
    fail("Column 'fsType' not found in the result")
  }
})

test_that("Filter Functionality Test for stock_codes", {
  test_codes <- c("300750", "600519", "600157")
  result <- lxr_cn_company(stock_codes = test_codes)
  if ("stockCode" %in% names(result)) {
    expect_equal(sort(unique(result$stockCode)), sort(test_codes))
  } else {
    fail("Column 'stockCode' not found in the result")
  }
})

test_that("Error Handling Test", {
  expect_error(lxr_cn_company(fs_typefs_type = 123))
  expect_error(lxr_cn_company(stock_codes = "not_a_stock_code"))
})

