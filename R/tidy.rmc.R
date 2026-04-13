#' Tidy for a(n) rmcorr object
#' 
#' @param x A(n) 'rmcorr' object created by rmcorr::rmcorr(). 
#' @param ... Unused, included for generic consistency only.
#' @return A tidy [tibble::tibble::()] summarizing component-level 
#' information about the model.
#' 
#' @examples
#' my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#' tidy(my.rmc)
#' @seealso [tidy()], [rmcorr::rmcorr()]
#' @method tidy rmc
#' @exportS3Method tidy rmc
tidy.rmc <- function(x, ...) {
    result.tab <- x$out
    rmc.terms <- c("Error", x$vars[1:2])
    rmc.df    <- c(x$df)
    
    #Fill in error df
     result.tab$Df[1] <- rmc.df
    
    #Fill in error sums of squares
     result.tab$`Sum of Sq`[1] <- result.tab$RSS[1]    
    
    #Drop RSS and AIC columns
     result.tab$RSS <- NULL
     result.tab$AIC <- NULL
    
    #terms
    #Participant estimate - fixed intercept
     int.term   <- x$model$coefficients[1]
    #Measure estimate - fixed slope
     slope.term <- x$model$coefficients[length(x$model$coefficients)]
    
    #estimates
     estimate <- as.numeric(c("",slope.term, int.term))
    
    #Added columns 
     result.tab$estimate <- as.numeric(estimate)
     result.tab$term    <- as.character(rmc.terms)
     
    #Reorder by term
     order <- c(rmc.terms[2],rmc.terms[3], rmc.terms[1])
     result.tab <- result.tab[base::match(order, result.tab$term),]
    
    #Correct column names
     colnames(result.tab) <- c("df",
                               "sumsq",
                               "statistic",
                               "p.value",
                               "estimate",
                               "term")
     
    #Then reorder columns
    reorder <- c("term",
                 "df",
                 "estimate", 
                 "sumsq",
                 "statistic",
                 "p.value")
     
    result.tab <- result.tab[,c(reorder)]
     
return(tibble::tibble(result.tab))
}

