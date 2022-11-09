#' Create a repeated measures correlation matrix.
#' 
#' @param participant A variable giving the subject name/id for each observation.
#' @param variables A character vector indicating the columns of variables to include in the correlation matrix.
#' @param dataset The data frame containing the variables.
#' @param CI.level The level of confidence intervals to use in the rmcorr models.
#' @return A list with class "rmcmat" containing the following components.
#' \item{matrix}{the repeated measures correlation matrix}
#' \item{summary}{a dataframe showing rmcorr stats for each pair of variables}
#' \item{models}{a list of the full rmcorr model for each pair of variables}
#' 
#' @references 
#' Bakdash, J.Z., & Marusich, L.R. (2017). 
#' Repeated Measures Correlation. \emph{Frontiers in Psychology, 8}, 456. 
#' \doi{10.3389/fpsyg.2017.00456}.
#' 
#' Bland, J.M., & Altman, D.G. (1995). Calculating correlation 
#' coefficients with repeated observations: Part 1 -- correlation within
#' subjects. \emph{BMJ, 310}, 446, \doi{https://doi.org/10.1136/bmj.310.6977.446}.
#' 
#' Cohen, P., West, S. G., & Aiken, L. S. (2002). \emph{Applied multiple 
#' regression/correlation analysis for the behavioral sciences} (3rd edition), 
#' Routledge. ISBN: 9780805822236.
#'
#' @seealso \code{\link{rmcorr}, \link{plot.rmc}}
#' @examples
#' dist_rmc_mat <- rmcorr_mat(participant = Subject, 
#'                            variables = c("Blindwalk Away",
#'                                          "Blindwalk Toward",
#'                                          "Triangulated BW",
#'                                          "Verbal",
#'                                          "Visual matching"),
#'                            dataset = twedt_dist_measures,
#'                            CI.level = 0.95)
#' plot(dist_rmc_mat$models[[2]])
#' @export
 

rmcorr_mat <- function(participant, variables, dataset, CI.level = 0.95){
    
    args <- as.list(match.call())
    
    Participant <- eval(args$participant, dataset, parent.frame())
    
    if (isa(Participant, "character")&(length(Participant) == 1)){
        Participant <- get(Participant, dataset)
    }
    
    if (!is.numeric(CI.level) || CI.level <= 0 || CI.level >= 1){
        stop("'CI.level' must be a numeric value between 0 and 1")
    }
    
    incl.vars <- eval(args$variables, dataset, parent.frame())
    
    all.pairs <- utils::combn(x = incl.vars, 
                       m = 2, 
                       FUN = paste0,
                       simplify = F) 
    
    models <- lapply(all.pairs,
                     function(x) 
                         suppressWarnings(rmcorr(participant = Participant, 
                                                 measure1 = evalq(x[1]),
                                                 measure2 = evalq(x[2]),
                                                 dataset = dataset,
                                                 CI.level = CI.level)))
    
    names(models) <- lapply(all.pairs,
                            function(x) paste(x, collapse = ", "))
    
    summary.rmcorr.df <-data.frame(measure1 = sapply(all.pairs, function(x) x[1]),
                                   measure2 = sapply(all.pairs, function(x) x[2]),
                                   df = sapply(models,function(x) x$df),
                                   rmcorr.r = sapply(models,function(x) x$r),
                                   lowerCI  = sapply(models,function(x) x$CI[1]),
                                   upperCI  = sapply(models, function(x) x$CI[2]),
                                   p.vals = sapply(models,function(x) x$p))
    summary.rmcorr.df$effective.N <- summary.rmcorr.df$df + 2
    
    
    vector.r <- unlist(summary.rmcorr.df$rmcorr.r)
    
    rownames(summary.rmcorr.df) <- c() #Remove rownames
    
    #Convert correlation Vector to correlation matrix 
    matrix.r <- matrix(0, 
                       nrow = length(incl.vars), 
                       ncol = length(incl.vars)) #Create a matrix of zeros
    colnames(matrix.r) <- incl.vars #Column names for matrix
    rownames(matrix.r) <- incl.vars #Row names for matrix
    
    matrix.r[lower.tri(matrix.r, diag = FALSE)] <- vector.r
    matrix.r = matrix.r + t(matrix.r) #Fill in 
    diag(matrix.r) = 1 #Set diag to 1 
    
    rmc.mat.output <- list(matrix = matrix.r,
                           models = models,
                           summary = summary.rmcorr.df)
    class(rmc.mat.output) <- "rmcmat"
    
    return(rmc.mat.output)
    
}

#' Print the repeated measures correlation matrix
#' 
#' @param x An object of class "rmcmat", a result of a call to \code{\link{rmcorr_mat}}.
#' @param ... additional arguments to \code{\link[base]{print}}.
#' @seealso \code{\link{rmcorr_mat},\link{rmcorr}}
#' @examples
#' ## Bland Altman 1995 data
#' blandrmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#' blandrmc
#' @export

print.rmcmat <- function(x, ...) {
    cat("\nRepeated measures correlation matrix\n\n")
    print(x$matrix)
}