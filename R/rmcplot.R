#' Plot the repeated measures correlation coefficient.
#' 
#' \code{rmcplot}  produces a scatterplot of \code{measure1} on the x-axis and 
#' \code{measure2} on the y-axis, with a different color used for each subject.
#' Parallel lines are fitted to each subject's data.
#' 
#' @param rmc an object of class "rmc" generated from the \code{\link{rmcorr}} function.
#' @param dataset the data frame containing the variables.
#' @param overall logical: if TRUE, plots the regression line between measure1 and
#' measure2, ignoring the participant variable.
#' @param xlab label for the x axis, defaults to the variable name for measure1.
#' @param ylab label for the y axis, defaults to the variable name for measure2.
#' @param ... additional arguments to \code{\link[graphics]{plot}}.
#' @seealso \code{\link{rmcorr}}
#' @examples
#' ## Bland Altman 1995 data
#' my.rmc <- rmcorr(participant = Subject, measure1 = PacO2, measure2 = pH, 
#' dataset = bland1995)
#' rmcplot(my.rmc, bland1995, overall = TRUE)
#' @export

# rmcplot <-function(participant, measure1, measure2, dataset, overall=F,
#                        xlab=NULL, ylab=NULL,...) 
rmcplot <-function(rmc, dataset, overall = T, xlab = NULL, ylab = NULL,...)    
{

    subs <- factor(dataset[[eval(rmc$vars[[1]])]])
    m1 <- dataset[[eval(rmc$vars[[2]])]]
    m2 <- dataset[[eval(rmc$vars[[3]])]]
    
    if (is.null(xlab)){
        xlab <- rmc$vars[[2]]
    }
    if (is.null(ylab)){
        ylab <- rmc$vars[[3]]
    }
    
    set1 <- RColorBrewer::brewer.pal(12,'Paired')
    pal <- colorRampPalette(set1)
    colors <- pal(length(levels(subs)))
    plot(m1, m2, pch=16, col = colors[subs], xlab=xlab, ylab = ylab, ...)
    
    nsubs <- length(levels(subs))
    
    preds <- predict(rmc$model)
    
    for (i in 1:nsubs){
        subindex <- which(subs == levels(subs)[i])
        lines(m1[subindex], preds[subindex], col = colors[i])
    }
    
    if (overall) {
        abline(lm(m2 ~ m1), col = "gray60", lwd = 3,lty = 2)
    }
}
