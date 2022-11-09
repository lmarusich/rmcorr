test_that("dataset param depcreated", {
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    expect_warning(plot(rmc.out, dataset = bland1995))

})

require(vdiffr)

test_that("Expected plot for non-standard characeters in xlab and ylab", {
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    p1 <- function() plot(rmc.out, main = "p1", xlab = "T\ e & s T^", ylab = "blah$% * b!@>h")
    expect_doppelganger("p1", p1)
})


test_that("Expected plot for example w/Gilden dataset", {
    my.rmc2 <- rmcorr(participant = as.factor(sub), measure1 = rt, measure2 = acc, 
                      dataset = gilden2010)
    p2 <- function() plot(my.rmc2, overall = FALSE, lty = 2, main = "p2", xlab = "Reaction Time", 
         ylab = "Accuracy")
    expect_doppelganger("p2", p2)
})

test_that("Overall line still works even though not recommended", {
    my.rmc2 <- rmcorr(participant = as.factor(sub), measure1 = rt, measure2 = acc, 
                      dataset = gilden2010)
    p3 <- function() plot(my.rmc2, overall = T, overall.col = 'gray60', overall.lwd = 3,
                          overall.lty = 2, lty = 2, main = "p2", xlab = "Reaction Time", 
                          ylab = "Accuracy")
    expect_doppelganger("p3", p3)
})
