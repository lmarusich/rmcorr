#' Calculate the repeated measures correlation coefficient.
#' 
#' @param participant A variable giving the subject name/id for each observation.
#' @param measure1 A numeric variable giving the observations for one measure.
#' @param measure2 A numeric variable giving the observations for the second measure.
#' @param dataset The data frame containing the variables.
#' @return A list with class "rmc" containing the following components.
#' \item{r}{the value of the repeated measures correlation coefficient.}
#' \item{CI}{the 95\% confidence interval for the repeated measures correlation coefficient.}
#' \item{p}{the p-value for the repeated measures correlation coefficient.}
#' @seealso \code{\link{rmcplot}}
#' @examples
#' ## Bland Altman 1995 data
#' rmcorr(Subject, pH, PacO2, bland1995)
#' @export


rmcorr <- function(participant, measure1, measure2, dataset, 
                   CIs = c("analytic", "bootstrap"), 
                   pval = c("analytic", "bootstrap")) {
    
    options(contrasts = c("contr.sum", "contr.poly"))
    
    args <- as.list(match.call())
    
    Participant <- eval(args$participant, dataset)
    if (!is.factor(Participant)) 
    {
        Participant <- factor(Participant)
        warning("Participant coerced into a factor")
    }
    
    Measure1 <- eval(args$measure1, dataset)
    Measure2 <- eval(args$measure2, dataset)
    if (!is.numeric(Measure1) || !is.numeric(Measure2))
        stop("'Measure 1' and 'Measure 2' must be numeric")
    
    CIs <- match.arg(CIs)
    pval <- match.arg(pval)
    
    lmmodel <- lm(Measure1 ~ Participant + Measure2)
    lmslope <- coef(lmmodel)["Measure2"]
    errordf <- lmmodel$df.residual
    
    # Direction of correlation based on whether slope is positive or negative  
    corrsign <- sign(lmslope)  
    
    # Drop each term for Type III sums of squares
    type3rmcorr <- drop1(lmmodel, ~., test="F" )
    SSFactor <- type3rmcorr$'Sum of Sq'[3] 
    SSresidual <- type3rmcorr$RSS[1]
    
    #correlation coefficient
    rmcorrvalue <- as.numeric(corrsign * sqrt(SSFactor / (SSFactor + SSresidual)))
    
    # Pvalue and confidence intervals
    
    #analytic
    if (CIs == "analytic"){}
     
    
    pvalue <- type3rmcorr$'Pr(>F)'[3]
    rmcorrvalueCI <- psych::r.con(rmcorrvalue, errordf)  
    
    #bootstrapped confidence intervals
    
    #bootstrapped p-value
    
    
    rmoutput <- list(r = rmcorrvalue, CI = rmcorrvalueCI, p = pvalue, 
                     model = lmmodel)
    class(rmoutput) <- "rmc"
    return (rmoutput)
} 


#' Calculate the repeated measures correlation coefficient.
#' 
#' @param x An object of class "rmc", a result of a call to rmcorr.
#' @param ... additional arguments to \code{\link[base]{print}}.
#' @seealso \code{\link{rmcorr}}
#' @examples
#' ## Bland Altman 1995 data
#' blandrmc <- rmcorr(Subject, pH, PacO2, bland1995)
#' blandrmc
#' @export

print.rmc <- function(x, ...) {
    cat("\nRepeated measures correlation\n\n")
    cat("r\n")
    cat(x$r)
    cat("\n\n95% confidence interval\n")
    cat(x$CI)
    cat("\n\np-value\n\n")
    cat(x$p)
}   
    
    