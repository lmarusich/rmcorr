test_that("expect warning and nothing",{
    expect_warning(rmc.out <- rmcorr(Subject, PaCO2, pH, bland1995))
    expect_no_error(modeltests::check_tidy_output(tidy.rmcorr(rmc.out)))
})