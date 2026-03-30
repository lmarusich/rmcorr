#tidymodels.org/learn/develop/broom
#Re-export the tidier generics
usethis::use_package("generics", "Imports")

#' @importFrom generics tidy glance
#' @export
generics::tidy
generics::glance

tidy.rmcorr <- function(x) {
    result.tab <- x$out
    
    #result.coef  <- out$model$coefficients    
    
    rmc.terms <- c("Error", out$vars[1:2])
    
    rmc.df    <- c(out$df)
    
    #Fill in error df
     result.tab$Df[1] <- rmc.df
    
    #Fill in error sums of squares
     result.tab$`Sum of Sq`[1] <- result.tab$RSS[1]    
    
    #Drop RSS and AIC columns
     result.tab$RSS <- NULL
     result.tab$AIC <- NULL
    
    #term
    #Participant estimate - fixed intercept
     int.term   <- out$model$coefficients[1]
    
    #Measure estimate - fixed slope
     slope.term <- out$model$coefficients[length(out$model$coefficients)]
    
    #estimate
     estimate <- as.numeric(c("",slope.term, int.term))
    
    #Added columns 
     result.tab$estimate <- as.numeric(estimate)
     result.tab$term    <- as.character(rmc.terms)
     
    #Reorder rows
     result.tab <- result.tab[match(order, result.tab$term),]
    
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
     as_tibble(result.tab2)
     }

my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
tidy.rmcorr(my.rmc)
#test <- tidy.rmcorr(my.rmc)
