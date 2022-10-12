test_that("dataset param depcreated", {
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    expect_warning(plot(rmc.out, dataset = bland1995))

})

test_that("Non-standard characeters in xlab and ylab", {
    rmc.out <- rmcorr(as.factor(Subject), PaCO2, pH, bland1995)
    plot(rmc.out, xlab = "T\ e & s T^", ylab = "blah$% * b!@>h")
    plot.obj.xylab.run <- recordPlot()
    vdiffr::expect_doppelganger("plot.obj.xylab.run", plot.obj.xylab.run)
})


test_that("Expected plot for example w/Gilden dataset", {
    my.rmc2 <- rmcorr(participant = as.factor(sub), measure1 = rt, measure2 = acc, 
                      dataset = gilden2010)
    plot(my.rmc2, overall = FALSE, lty = 2, xlab = "Reaction Time", 
         ylab = "Accuracy")
    plot.obj.Gilden.run <- recordPlot()
    vdiffr::expect_doppelganger("plot.obj.Gilden.run", plot.obj.Gilden.run)
})
