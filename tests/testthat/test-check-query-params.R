test_that("invalid parameters should return error", {
  expect_error(lxr_query(
    api_endpoint = lxr_cn_company_dividend(),
    invalid_params = "invalid"
  ))
})

test_that("missing parameters should return error", {
  expect_error(lxr_query(
    api_endpoint = lxr_cn_company_equity_change(),
    start_date = "2022-09-20", limit = 1314
  ))
})
