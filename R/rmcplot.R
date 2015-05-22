#' Plot the repeated measures correlation coefficient.
#' 
#' \code{rmcplot}  produces a scatterplot of \code{measure1} on the x-axis and 
#' \code{measure2} on the y-axis, with a different color used for each subject.
#' Parallel lines are fitted to each subject's data.
#' 
#' @param participant a variable giving the subject name/id for each observation.
#' @param measure1 a numeric variable giving the observations for one measure.
#' @param measure2 a numeric variable giving the observations for the second measure.
#' @param dataset the data frame containing the variables.
#' @param overall logical: if TRUE, plots the regression line between measure1 and
#' measure2, ignoring the participant variable.
#' @param xlab label for the x axis, defaults to the variable name for measure1.
#' @param ylab label for the y axis, defaults to the variable name for measure2.
#' names for measure1 and measure2.
#' @param ... additional arguments to \code{\link[graphics]{plot}}.
#' @examples
#' ## Bland Altman 1995 data
#' rmcplot(participant = Subject, measure1 = PacO2, measure2 = pH, 
#' dataset = bland1995, overall = TRUE)
#' @export

rmcplot <-function(participant, measure1, measure2, dataset, overall=F,
                       xlab=NULL, ylab=NULL,...) 
{
    ##what to do if spaces in col name?
    
    args <- as.list(match.call())
    
    Participant <- eval(args$participant, dataset)
    if (!is.factor(Participant)) {
        Participant <- factor(Participant)
        warning ("Participant coerced into a factor")
    }
    
    Measure1 <- eval(args$measure1, dataset)
    Measure2 <- eval(args$measure2, dataset)
    if (!is.numeric(Measure1) || !is.numeric(Measure2)) 
        stop ("'Measure 1' and 'Measure 2' must be numeric")
    
    lmmodel <- lm(Measure2 ~ Participant + Measure1)
    lmslope <- coef(lmmodel)["Measure1"]
    preds <- predict(lmmodel)
    
    if (is.null(xlab)){
        xlab <- args$measure1
    }
    if (is.null(ylab)){
        ylab <- args$measure2
    }
    
    set1 <- RColorBrewer::brewer.pal(12,'Paired')
    pal <- colorRampPalette(set1)
    colors <- pal(length(levels(Participant)))
    plot(Measure1, Measure2, pch=16, col = colors[Participant], xlab=xlab,
         ylab = ylab, ...)
    
    nsubs <- length(levels(Participant))
    
    for (i in 1:nsubs){
        subindex <- which(Participant == levels(Participant)[i])
        lines(Measure1[subindex], preds[subindex], col = colors[i])
    }
    
    
    if (overall) {
        abline(lm(Measure2 ~ Measure1), col = "gray60", lwd = 3,lty = 2)
    }
}
