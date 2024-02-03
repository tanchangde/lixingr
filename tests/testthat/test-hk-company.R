test_that("test hk_company", {
  result <- lxr_query(
    endpoint = lxr_hk_company(),
    stock_codes = "00700"
  )
  expect_s3_class(result, "tbl_df")
  expect_true(nrow(result) > 0)
})
