test_that("Basic Functionality Test", {
  result <-
    lxr_cn_company_dividend(start_date = "2020-01-04",
                            end_date = "2024-01-04",
                            stock_code = "300750")
  expect_s3_class(result, "tbl_df")
  expect_true("dividend" %in% names(result))
})
