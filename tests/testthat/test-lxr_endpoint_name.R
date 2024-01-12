test_that("Test lxr_endpoint_name with lxr_cn_company", {
  result <- lxr_endpoint_name(lxr_cn_company())
  expect_equal(result, "cn_company")
})

test_that("Test lxr_endpoint_name with lxr_cn_company_equity_change", {
  result <- lxr_endpoint_name(lxr_cn_company_equity_change())
  expect_equal(result, "cn_company_equity_change")
})