#' Plot the repeated measures correlation coefficient.
#' 
#' \code{plot.rmc}  produces a scatterplot of \code{measure1} on the x-axis and 
#' \code{measure2} on the y-axis, with a different color used for each subject.
#' Parallel lines are fitted to each subject's data.
#' 
#' @param rmc an object of class "rmc" generated from the \code{\link{rmcorr}} function.
#' @param dataset the data frame containing the variables.
#' @param overall logical: if TRUE, plots the regression line between measure1 and
#' measure2, ignoring the participant variable.
#' @param palette the palette to be used. Defaults to the RColorBrewer "Paired" palette 
#' @param xlab label for the x axis, defaults to the variable name for measure1.
#' @param ylab label for the y axis, defaults to the variable name for measure2.
#' @param overall.col the color of the overall regression line
#' @param overall.lwd the line thickness of the overall regression line
#' @param overall.lty the line type of the overall regression line
#' @param ... additional arguments to \code{\link[graphics]{plot}}.
#' @seealso \code{\link{rmcorr}}
#' @examples
#' ## Bland Altman 1995 data
#' my.rmc <- rmcorr(participant = Subject, measure1 = PacO2, measure2 = pH, dataset = bland1995)
#' plot(my.rmc, bland1995, overall = TRUE)
#' 
#' ## Raz et al. 2005 data
#' my.rmc <- rmcorr(participant = Participant, measure1 = Age, measure2 = Volume, dataset = raz2005)
#' library(RColorBrewer)
#' blueset <- brewer.pal(8, 'Blues')
#' pal <- colorRampPalette(blueset)
#' plot(my.rmc, raz2005, overall = TRUE, palette = pal, overall.col = 'black') 
#' 
#' ## Gilden et al. 2010 data
#' my.rmc <- rmcorr(participant = sub, measure1 = rt, measure2 = acc, dataset = gilden2010)
#' plot(my.rmc, gilden2010, overall = FALSE, lty = 2, xlab = "Reaction Time", ylab = "Accuracy")
#' @export

plot.rmc <-function(rmc, dataset, overall = T, palette = NULL, xlab = NULL,
                   ylab = NULL, overall.col = "gray60", overall.lwd = 3,
                   overall.lty = 2, ...) {    
    
    
    subs <- factor(dataset[[eval(rmc$vars[[1]])]])
    m1 <- dataset[[eval(rmc$vars[[2]])]]
    m2 <- dataset[[eval(rmc$vars[[3]])]]
    
    if (is.null(xlab)){
        xlab <- rmc$vars[[2]]
    }
    if (is.null(ylab)){
        ylab <- rmc$vars[[3]]
    }
    
    if (is.null(palette)){
        set1 <- RColorBrewer::brewer.pal(12,'Paired')
        palette <- colorRampPalette(set1)
    }
    colors <- palette(length(levels(subs)))
    plot(m1, m2, pch=16, col = colors[subs], xlab=xlab, ylab = ylab, ...)
    
    nsubs <- length(levels(subs))
    
    preds <- predict(rmc$model)
    
    for (i in 1:nsubs){
        subindex <- which(subs == levels(subs)[i])
        lines(m1[subindex], preds[subindex], col = colors[i], ...)
    }
    
    if (overall) {
        abline(lm(m2 ~ m1), col = overall.col, lwd = overall.lwd, 
               lty = overall.lty)
    }
}
