tidy.lm <- function(x, conf.int = FALSE, conf.level = 0.95, ...) {
    
    result <- summary(x)$coefficients %>%
        tibble::as_tibble(rownames = "term") %>%
        dplyr::rename(estimate = Estimate,
                      std.error = `Std. Error`,
                      statistic = `t value`,
                      p.value = `Pr(>|t|)`)
    
    if (conf.int) {
        ci <- confint(x, level = conf.level)
        result <- dplyr::left_join(result, ci, by = "term")
    }
    
    result
}

out <- rmcorr.test(Subject, PaCO2, pH, bland1995)

tidy.out <- out$out


coef.rmc  <- out$model$coefficients
coef.rmc

coef.CIs <- stats::confint(out$model) 
coefs.all <- cbind(coef.rmc, coef.CIs)

term.1 <- out$vars[1] 
term.2 <- out$vars[2] 
term.3 <- "Error"

term <- c(term.1, term.2, term.3)

str(out)
out$model


rmc.terms <- out$vars[1:2]
rmc.df    <- c(out$df)
out


out <- rmcorr.test(Subject, PaCO2, pH, bland1995)
draft.out <- out$out

rownames(draft.out)[1] <- "Error"

order <- c("Participant", "Measure1", "Error")
draft.out <- draft.out[match(order, rownames(draft.out)),]

df.3 <- out$df
SS.3 <- out$out$RSS[1]

draft.out$Df[3] <- df.3
draft.out$`Sum of Sq`[3] <- SS.3    

#Remove single term deletions
#Edit model name 
#Drop RSS and AIC    
    
#Add term
#Participant estimate - intercept?
int.term   <- out$model$coefficients[1]

#Measure estimate - slope?
slope.term <- out$model$coefficients[9]

draft.out$estimates[1:3] <- data.frame(int.term, slope.term, "")

colnames(draft.out) <- c(p.value, estimate)

draft.out2 <- cbind(term,
                    draft.out$Df,
                    draft.out$estimates,
                    draft.out$`Sum of Sq`,
                    draft.out$`F value`,
                    draft.out$`Pr(>F)`)


colnames(draft.out2) <- c("term",
                          "df",
                          "estimate",
                          "sumsq",
                          "statistic",
                          "p.value")

#Make similar to aov object? or lm object?
tib.out <- as_tibble(draft.out2)


fit <- aov(mpg ~ wt + cyl, data = mtcars)
tidy(fit)
class(fit)
class(tidy(fit))
glance(fit)

fit.cor <- cor.test(mtcars$mpg, mtcars$wt)
tidy(fit.cor)
#for glance, add method - rmcorr

#use corrr package for dataframes of correlations 

glance(fit.cor)
print(tib.out)
cbind(tib.out$estimates,
      tib.out)
subset(subset,
       select = 
       )
