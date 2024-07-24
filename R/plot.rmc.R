#' Plot the repeated measures correlation coefficient.
#'
#' \code{plot.rmc}  produces a scatterplot of \code{measure1} on the x-axis and
#' \code{measure2} on the y-axis, with a different color used for each subject.
#' Parallel lines are fitted to each subject's data.
#'
#' @param x an object of class "rmc" generated from the \code{\link{rmcorr}} function.
#' @param palette the palette to be used. Defaults to the RColorBrewer "Paired" palette
#' @param xlab label for the x axis, defaults to the variable name for measure1.
#' @param ylab label for the y axis, defaults to the variable name for measure2.
#' @param ... additional arguments to \code{\link[graphics:plot.default]{plot}}.
#' @seealso \code{\link{rmcorr}, \link{geom_rmc} for plotting with ggplot}
#' @examples
#' ## Bland Altman 1995 data
#' my.rmc <- rmcorr(participant = Subject, measure1 = PaCO2, measure2 = pH, 
#'                  dataset = bland1995)
#' plot(my.rmc)
#'
#' ## Raz et al. 2005 data
#' my.rmc <- rmcorr(participant = Participant, measure1 = Age, measure2 = 
#'                  Volume, dataset = raz2005)
#' library(RColorBrewer)
#' blueset <- brewer.pal(8, 'Blues')
#' pal <- colorRampPalette(blueset)
#' plot(my.rmc, overall = TRUE, palette = pal, overall.col = 'black')
#'
#'
#' ## Gilden et al. 2010 data
#' my.rmc <- rmcorr(participant = sub, measure1 = rt, measure2 = acc, 
#'                  dataset = gilden2010)
#' plot(my.rmc, overall = FALSE, lty = 2, xlab = "Reaction Time", 
#'      ylab = "Accuracy")
#'      
#'      
#' @export
plot.rmc <- function(x, palette = NULL, xlab = NULL, ylab = NULL, ...) {
    .plotrmc(x, palette, xlab, ylab, ...)
}

# Don't export this function
.plotrmc <- function(x, palette = NULL, xlab = NULL, ylab = NULL, dataset = NULL, 
                     overall = F, overall.col = "gray60", overall.lwd = 3,
                     overall.lty = 2, ...) {
    calls <- names(sapply(match.call(), deparse))[-1]
    if(any("dataset" %in% calls)) {
        warning("dataset parameter is deprecated")
    }
    
    subs <- x$model$model$Participant
    m1 <- x$model$model$Measure1
    m2 <- x$model$model$Measure2
    
    #check for missing values
    newdat <- stats::na.omit(data.frame(subs, m1, m2))
    subs <- newdat$subs
    m1 <- newdat$m1
    m2 <- newdat$m2
    
    if (is.null(xlab)){
        xlab <- x$vars[[2]]
    }
    if (is.null(ylab)){
        ylab <- x$vars[[3]]
    }
    
    if (is.null(palette)){
        set1 <- RColorBrewer::brewer.pal(12,'Paired')
        palette <- grDevices::colorRampPalette(set1)
    }
    colors <- palette(length(levels(subs)))
    graphics::plot(m1, m2, pch=16, col = colors[subs], xlab=xlab, 
                   ylab = ylab, ...)
    
    nsubs <- length(levels(subs))
    
    preds <- stats::predict(x$model)
    
    for (i in 1:nsubs){
        subindex <- which(subs == levels(subs)[i])
        graphics::lines(m1[subindex], preds[subindex], col = colors[i], ...)
    }
    
    if (overall) {
        graphics::abline(stats::lm(m2 ~ m1), col = overall.col, 
                         lwd = overall.lwd, lty = overall.lty)
    }
}
