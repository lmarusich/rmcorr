#' Calculate the repeated measures correlation coefficient.
#' 
#' @param participant A variable giving the subject name/id for each observation.
#' @param measure1 A numeric variable giving the observations for one measure.
#' @param measure2 A numeric variable giving the observations for the second measure.
#' @param dataset The data frame containing the variables.
#' @param CI.level The confidence level of the interval
#' @param CIs The method of calculating confidence intervals.
#' @param nreps The number of resamples to take if bootstrapping.
#' @param bstrap.out Determines if the output include the bootstrap resamples.
#' @return A list with class "rmc" containing the following components.
#' \item{r}{the value of the repeated measures correlation coefficient.}
#' \item{df}{the degrees of freedom}
#' \item{p}{the p-value for the repeated measures correlation coefficient.}
#' \item{CI}{the 95\% confidence interval for the repeated measures correlation coefficient.}
#' \item{model}{the multiple regression model used to calculate the correlation coefficient.}
#' \item{resamples}{the bootstrap resampled correlation values.}
#' @references Bakdash, J.Z., & Marusich, L.R. (2017). 
#' Repeated Measures Correlation. \emph{Frontiers in Psychology, 8}, 256. 
#' \doi{10.3389/fpsyg.2017.00456}.
#' 
#' Bland, J.M., & Altman, D.G. (1995). Calculating correlation 
#' coefficients with repeated observations: Part 1 - correlation within
#' subjects. \emph{BMJ, 310}, 446.
#' @seealso \code{\link{plot.rmc}}
#' @examples
#' ## Bland Altman 1995 data
#' rmcorr(Subject, PacO2, pH, bland1995)
#' @export

rmcorr <- function(participant, measure1, measure2, dataset,
                   CI.level = 0.95,
                   CIs = c("analytic", "bootstrap"), 
                   nreps = 100, bstrap.out = F) {
    
    op <- options(contrasts = getOption("contrasts"))
    on.exit(options(op))
    
    options(contrasts = c("contr.sum", "contr.poly"))
    
    args <- as.list(match.call())
    
    Participant <- eval(args$participant, dataset, parent.frame())
    if (isa(Participant, "character")&(length(Participant) == 1)){
        Participant <- get(Participant, dataset)
    }
    Measure1 <- eval(args$measure1, dataset, parent.frame())
    if (isa(Measure1, "character")&(length(Measure1) == 1)){
        Measure1 <- get(Measure1, dataset)
    }
    Measure2 <- eval(args$measure2, dataset, parent.frame())
    if (isa(Measure2, "character")&(length(Measure2) == 1)){
        Measure2 <- get(Measure2, dataset)
    }
    
    
    if (!is.factor(Participant)) 
    {
        Participant <- factor(Participant)
        warning(paste("'", args$participant, "' coerced into a factor", sep = ""))
    }
    
    if (!is.numeric(Measure1) || !is.numeric(Measure2))
        stop("'Measure 1' and 'Measure 2' must be numeric")
    
    #check for missing values
    newdat <- stats::na.omit(data.frame(Participant, Measure1, Measure2))
    Participant <- newdat$Participant
    Measure1 <- newdat$Measure1
    Measure2 <- newdat$Measure2
    
    CIs <- match.arg(CIs)
    
    if (!is.numeric(CI.level) || CI.level <= 0 || CI.level >= 1){
        stop("'CI.level' must be a numeric value between 0 and 1")
    }
    
    lmmodel <- stats::lm(Measure2 ~ Participant + Measure1)
    lmslope <- stats::coef(lmmodel)["Measure1"]
    errordf <- lmmodel$df.residual
    
    # Direction of correlation based on whether slope is positive or negative  
    corrsign <- sign(lmslope)  
    
    # Drop each term for Type III sums of squares
    type3rmcorr <- stats::drop1(lmmodel, ~., test="F" )
    SSFactor <- type3rmcorr$'Sum of Sq'[3] 
    SSresidual <- type3rmcorr$RSS[1]
    
    #correlation coefficient
    rmcorrvalue <- as.numeric(corrsign * sqrt(SSFactor / (SSFactor + SSresidual)))
    
    # Pvalue and confidence intervals
    pvalue <- type3rmcorr$'Pr(>F)'[3]
    
    #analytic
    resamples <- NULL
    if (CIs == "analytic"){
        rmcorrvalueCI <- psych::r.con(rmcorrvalue, errordf, p = CI.level) 
    } else if (CIs == "bootstrap") {
        nsubs <- length(levels(Participant))
        if (!is.numeric(nreps)){stop("Specify the number of bootstrap resamples to take")}
        cor.reps <- numeric(nreps)

        for (i in 1:nreps){

            split.by.sub <- split(newdat, newdat$Participant)
            bs.df <- do.call(rbind,
                             lapply(split.by.sub, 
                                    function(x) x[sample(nrow(x), replace = T), ]))
            bs.1 <- bs.df$Measure1
            bs.2 <- bs.df$Measure2
            bs.Part <- bs.df$Participant
            
            
            repmodel<-stats::lm(bs.1 ~ bs.Part + bs.2)
            repslope <- stats::coef(repmodel)["bs.2"]
            errordf <- repmodel$df.residual
            repsign <- sign(repslope)  
            
            type3rmcorr<-stats::drop1(repmodel, ~., test="F" )
            SSFactor<-type3rmcorr$'Sum of Sq'[3] 
            SSresidual<-type3rmcorr$RSS[1]
            
            cor.reps[i] <- as.numeric(repsign*sqrt(SSFactor/(SSFactor+SSresidual)))
            
        }
        CI.limits <- c((1-CI.level)/2, (1-CI.level)/2 + CI.level)
        rmcorrvalueCI <- stats::quantile(cor.reps,probs=CI.limits)
        resamples <- cor.reps
    }
    
    
    rmoutput <- list(r = rmcorrvalue, df = errordf, p = pvalue, 
                     CI = rmcorrvalueCI, 
                     CI.level = CI.level,
                     model = lmmodel, 
                     vars = as.character(c(args$participant,args$measure1,args$measure2)))
    if (bstrap.out) {rmoutput$resamples <- resamples}
    class(rmoutput) <- "rmc"
    return (rmoutput)
} 


#' Print the results of a repeated measures correlation
#' 
#' @param x An object of class "rmc", a result of a call to rmcorr.
#' @param ... additional arguments to \code{\link[base]{print}}.
#' @seealso \code{\link{rmcorr}}
#' @examples
#' ## Bland Altman 1995 data
#' blandrmc <- rmcorr(Subject, PacO2, pH, bland1995)
#' blandrmc
#' @export


print.rmc <- function(x, ...) {
    cat("\nRepeated measures correlation\n\n")
    cat("r\n")
    cat(x$r)
    cat("\n\ndegrees of freedom\n")
    cat(x$df)
    cat("\n\np-value\n")
    cat(x$p)
    cat("\n\n", x$CI.level*100, "% confidence interval\n", sep = "")
    cat(x$CI,"\n\n")
    
}   

