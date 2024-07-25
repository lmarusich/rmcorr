require(vdiffr)

test_that("custom geom works as expected", {
    my.rmc <- rmcorr(participant = as.factor(Subject), measure1 = PaCO2, measure2 = pH,
                     dataset = bland1995)
    
    expect_error(ggplot2::ggplot(bland1995,
                                 ggplot2::aes(x = PaCO2,
                                              y = pH,
                                              color = factor(Subject))) +
                     geom_rmc(bland1995))

    
    p1 <- function() {
        ggplot2::ggplot(bland1995,
                        ggplot2::aes(x = PaCO2,
                                     y = pH,
                                     color = factor(Subject))) +
            geom_rmc(my.rmc)
        }
    expect_doppelganger("p1", p1)
    
    p2 <- function() {
        ggplot2::ggplot(bland1995,
                    ggplot2::aes(x = PaCO2,
                                 y = pH,
                                 color = factor(Subject))) +
        geom_rmc(my.rmc) +
        ggplot2::theme_minimal() +
        ggplot2::theme(legend.position="none") +
        ggplot2::scale_color_brewer(palette="Dark2")
    }
    expect_doppelganger("p2", p2)

    ##manually:
    p3 <- function() {
        ggplot2::ggplot(bland1995, ggplot2::aes(x = PaCO2, y = pH, color = factor(Subject))) +
        ggplot2::geom_point(ggplot2::aes(colour = factor(Subject))) +
        ggplot2::geom_line(ggplot2::aes(y = my.rmc$model$fitted.values),
                           linetype = 1)
    }
    expect_doppelganger("p3", p3)
    
})
