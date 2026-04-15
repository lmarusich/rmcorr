#' Glance for a(n) rmcorr object
#' 
#' @param x A(n) rmcorr object created by rmcorr::rmcorr(). 
#' @param ... Unused, included for generic consistency only.
#' @return A single row summary "glance" [tibble::tibble()] of the rmc model.
#' \itemize{
#' \item \code{rho}: the value of the repeated measures correlation (rmcorr) coefficient (note rho is technically incorrect; this value is neither the population correlation nor a Spearman correlation. It was the closest match in the glossary)
#' \item \code{conf.low}: the lower-bound confidence interval for the rmcorr effect size
#' \item \code{conf.high}: the upper-bound confidence interval for the rmcorr effect size 
#' \item \code{statistic}: the model F-statistic  
#' \item \code{p.value}: the model p-value  
#' \item \code{df.residual}: the model error/residual degrees of freedom (denominator) 
#' \item \code{nobs}: the total number of paired observations
#' \item \code{n}: the number of unique participants (sample size)  
#' }
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
    statistic <- x$out$`F value`[3]
    p.value <- x$p
    df.residual <- x$df 
    nobs <- length(x$model$fitted.values)
    n    <- length(unique(x$model$model[,2]))
summary.tab <- 
 data.frame(rho,
       conf.low,
       conf.high,
       statistic,
       p.value,
       df.residual,
       nobs,
       n)

return(tibble::tibble(summary.tab))
 }