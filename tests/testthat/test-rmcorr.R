test_that("symbol column names work", {
  expect_warning(rmcorr(Subject, PaCO2, pH, bland1995), "coerced into a factor")
})

test_that("string column names work", {
    expect_warning(rmcorr("Subject", "PaCO2", "pH", bland1995), "coerced into a factor")
})

test_that("dynamic column names work", {
    col_names <- c("Subject", "PaCO2", "pH")
    expect_warning(rmc.out <- rmcorr(col_names[1], col_names[2], col_names[3], bland1995), "coerced into a factor")
    expect_equal(rmc.out$r, -0.507, tolerance = 0.001)
})

test_that("different classes of sub_ids work", {
    bland1995mod <- bland1995
    #change the subject column from integers to characters
    bland1995mod$Subject[1:4]  <- "a"
    
    expect_warning(rmc.out <- rmcorr(Subject, PaCO2, pH, bland1995mod), "coerced into a factor")
    expect_equal(rmc.out$CI[1], -0.7067, tolerance = 0.001)
    
    #change to factor, shouldn't get warning
    expect_silent(rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995mod))
})

test_that("check class", {
    #Change Subject to factor so there is no warning
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    expect_s3_class(rmc.out, 'rmc')
})

test_that("expected names for rmc", {
    #Change Subject to factor so there is no warning
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    expect_named(rmc.out, c("r", "df", "p", "CI", "CI.level", "model", "vars"))
})

test_that("non-numeric data columns throw error", {
    bland1995mod <- bland1995
    bland1995mod$pH <- as.character(bland1995mod$pH)
    expect_warning(expect_error(rmcorr(Subject, as.character(PaCO2), pH, bland1995),"must be numeric"), "coerced")
})

test_that("changing CI level works", {
    #use default 95% CIs
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010))
    expect_equal(rmc.out$CI[1], -0.654, tolerance = 0.001)
    
    set.seed(1753)
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CIs = "bootstrap"))
    expect_equal(rmc.out$CI[[1]], -0.604, tolerance = 0.001)
    
    #use 99% CIs
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CI.level = 0.99))
    expect_equal(rmc.out$CI[1], -0.713, tolerance = 0.001)
    
    set.seed(1212)
    expect_warning(rmc.out <- rmcorr(sub, rt, acc, gilden2010, CIs = "bootstrap", CI.level = 0.99))
    expect_equal(rmc.out$CI[[1]], -0.610, tolerance = 0.001)
})

test_that("invalid CI levels throw an error", {
    #CI > 1
    expect_error(rmc.out <- rmcorr(as.factor(sub), rt, acc, gilden2010, CI.level = 1.99))
    
    #CI < 0
    expect_error(rmc.out <- rmcorr(as.factor(sub), rt, acc, gilden2010, CI.level = -0.01))
})


test_that("invalid num of bootstraps for CI throws an error", {
    #Character instead of numeric 
    expect_error(rmc.out <- rmcorr(as.factor(sub), rt, acc, gilden2010, CIs = "bootstrap", nreps = "500"))
})

test_that("Returning bootstrapped values works", {
    set.seed(531)
    expect_warning(test.boot <- 
                       rmcorr(Subject, PaCO2, pH, bland1995,
                              CI.level = 0.95,
                              nreps = 100,
                              CIs = "bootstrap",
                              bstrap.out = T))
    
    expect_equal(test.boot$CI[[1]], -0.7271, tolerance = 0.001)
    expect_equal(test.boot$CI[[2]], -0.1808, tolerance = 0.001)
    
    expect_length(test.boot$resamples, 100)
})

test_that("output has correct class",{
    expect_warning(rmc.out <- rmcorr(Subject, PaCO2, pH, bland1995))
    expect_match(class(rmc.out), "rmc")
    expect_snapshot(print(rmc.out))
})

