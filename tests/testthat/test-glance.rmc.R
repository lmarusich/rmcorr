require(modeltests)

test_that("expect warning and nothing",{
    expect_warning(my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995))
    glance.out <- glance(my.rmc)
    expect_no_error(modeltests::check_glance_outputs(glance.out))
})
