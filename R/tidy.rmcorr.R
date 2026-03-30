#' Tidy for a(n) rmcorr object
#' 
#' @param x 	An rmcorr object created by rmcorr::rmcorr(). 
#' @return A tidy [tibble::tibble::()] summarizing component-level 
#' information about the model.
#' @references 
#' Robinson D, Hayes A, Couch S, Hvitfeldt E (2025). 
#' \emph{broom: Convert Statistical Objects into Tidy Tibbles.} 
#' R package version 1.0.11, https://broom.tidymodels.org/.
#'
#' usethis::use_package("generics", "Imports")
#' @examples
#' my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#' tidy.rmcorr(my.rmc)
#' 
#' @seealso [tidy()], [rmcorr::rmcorr()]
#Re-export the tidier generics
#' @importFrom generics tidy 
#' @export 
generics::tidy
#' @export
tidy.rmcorr <- function(x) {
    result.tab <- x$out
    
    #result.coef  <- out$model$coefficients    
    
    rmc.terms <- c("Error", x$vars[1:2])
    
    rmc.df    <- c(x$df)
    
    #Fill in error df
     result.tab$Df[1] <- rmc.df
    
    #Fill in error sums of squares
     result.tab$`Sum of Sq`[1] <- result.tab$RSS[1]    
    
    #Drop RSS and AIC columns
     result.tab$RSS <- NULL
     result.tab$AIC <- NULL
    
    #term
    #Participant estimate - fixed intercept
     int.term   <- x$model$coefficients[1]
    
    #Measure estimate - fixed slope
     slope.term <- x$model$coefficients[length(x$model$coefficients)]
    
    #estimate
     estimate <- as.numeric(c("",slope.term, int.term))
    
    #Added columns 
     result.tab$estimate <- as.numeric(estimate)
     result.tab$term    <- as.character(rmc.terms)
     
    #Reorder by term
     order <- c(rmc.terms[3],rmc.terms[2], rmc.terms[1])
     result.tab <- result.tab[base::match(order, result.tab$term),]
    
    #Correct column names
     colnames(result.tab) <- c(
         "df",
         "sumsq",
         "statistic",
         "p.value",
         "estimate",
         "term")
     
    #Then reorder columns
     order2 <- c("term",
                 "df",
                 "estimate", 
                 "sumsq",
                 "statistic",
                 "p.value")
     
     result.tab2 <- result.tab[,c(order2)]
     
     #Generates table similar to Table 2, Bland and Altman (1995a)
     results <- tibble::tibble(result.tab2)
     return(results)
}
