#' geom_rmc: ggplot2 geom for simplified graphing 
#' @param my.rmc an object of class "rmc" generated from the \code{\link{rmcorr}} function.

# 
# my.rmc <- rmcorr(participant = Subject, measure1 = PaCO2, measure2 = pH, 
#                  dataset = bland1995)
# 
# ggplot(bland1995, ggplot2::aes(x = PaCO2, y = pH, 
#                                group = factor(Subject), color = factor(Subject))) +
#     ggplot2::geom_point(ggplot2::aes(colour = factor(Subject))) +
#     ggplot2::geom_line(ggplot2::aes(y = my.rmc$model$fitted.values), 
#                        linetype = 1)
# 
#Turn into ggproto object?
geom_rmc <- function(my.rmc) {
    list(
        geom_point(),
        geom_line(aes(y = my.rmc[["model"]][["fitted.values"]]))
    #Allow custom color palettes?
    #Remove legend by default?
        )
}

#ggplot(bland1995, ggplot2::aes(x = PaCO2, y = pH, 
#                               group = factor(Subject), color = factor(Subject))) +
#    geom_rmc(my.rmc)
