#' Glance for a(n) rmcorr object
#' 
#' @param x A(n) rmcorr object created by rmcorr::rmcorr(). 
#' @param ... Unused, included for generic consistency only.
#' @return A single row summary "glance" [tibble::tibble()] of the rmc model.
#'
#' @examples
#' my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#' glance(my.rmc)
#' @seealso [glance()], [rmcorr::rmcorr()]
#' @method glance rmc
#' @exportS3Method glance rmc
glance.rmc <- function(x, ...) {
    rho <- x$r
    conf.low <- x$CI[1]
    conf.high <- x$CI[2]
    rho
    statistic <- x$out$`F value`[3]
    p.value <- x$p
    df <- x$df 
    nobs <- length(x$model$fitted.values)

summary.tab <- 
 data.frame(rho,
       conf.low,
       conf.high,
       statistic,
       p.value,
       df,
       nobs)

return(tibble::tibble(summary.tab))
 }