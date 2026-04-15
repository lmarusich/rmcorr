require(modeltests)

test_that("expect warning and nothing",{
    expect_warning(my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995))
    tidy.out <- tidy(my.rmc)
    expect_no_error(modeltests::check_tidy_output(tidy.out))
})
