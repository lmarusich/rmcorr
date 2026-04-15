# Comparing Correlations

### Comparing Correlations

We show examples for comparing the magnitude of two *r*_(*rm*) values.
Correlations are compared using the cocor package (Diedenhofen and Musch
2015):  
[R package](https://CRAN.R-project.org/package=cocor)  
[Web Version](http://comparingcorrelations.org)  

#### Running Examples Requires cocor

``` r
#Install cocor
install.packages("cocor")
require(cocor)
```

#### Independent Correlations

In the first example, we compare *r*_(*rm*) values from two distinct,
independent datasets. That is, they do not have the same participants.
This is a nonsense example because the two datasets are from completely
different experimental designs that do not share common measures.  
  
Note the two *r*_(*rm*) values are similar in magnitude and have large
overlap in their confidence intervals: *r*_(*rm*) = -0.58, 95% CI
\[-0.74, -0.38\] and *r*_(*rm*) = -0.40, 95% CI \[-0.66, -0.07\]. Thus,
they are not significantly different.

``` r
#1) Run rmcorr on two different datasets
model1.marusich2016_exp2  <- rmcorr(Pair, HVT_capture, MARS, marusich2016_exp2)
#> Warning in rmcorr(Pair, HVT_capture, MARS, marusich2016_exp2): 'Pair' coerced
#> into a factor
model1.marusich2016_exp2
#> 
#> Repeated measures correlation
#> 
#> r
#> -0.5890471
#> 
#> degrees of freedom
#> 55
#> 
#> p-value
#> 1.434929e-06
#> 
#> 95% confidence interval
#> -0.7365623 -0.3880381

model2.gilden2010         <- rmcorr(sub, rt, acc, gilden2010 )
#> Warning in rmcorr(sub, rt, acc, gilden2010): 'sub' coerced into a factor
model2.gilden2010
#> 
#> Repeated measures correlation
#> 
#> r
#> -0.406097
#> 
#> degrees of freedom
#> 32
#> 
#> p-value
#> 0.01716871
#> 
#> 95% confidence interval
#> -0.6543958 -0.07874527

#2) Extract relevant parameters
#Model 1
rmcorr1 <- model1.marusich2016_exp2$r
rmcorr1
#> [1] -0.5890471

n1 <- model1.marusich2016_exp2$df + 2 #note the same kludge as power above
n1                                    #this is the effective sample size
#> [1] 57

#Model 2
rmcorr2 <- model2.gilden2010$r
rmcorr2
#> [1] -0.406097

n2 <- model2.gilden2010$df + 2 
n2
#> [1] 34

#3) Compare the two indendent rmcorr coefficients
cocor.indep.groups(rmcorr1, rmcorr2, n1, n2, 
                   var.labels = c(model1.marusich2016_exp2$var[2:3],
                                  model2.gilden2010$vars[2:3]))
#> 
#>   Results of a comparison of two correlations based on independent groups
#> 
#> Comparison between r1.jk (HVT_capture, MARS) = -0.589 and r2.hm (rt, acc) = -0.4061
#> Difference: r1.jk - r2.hm = -0.183
#> Data: j = HVT_capture, k = MARS, h = rt, m = acc
#> Group sizes: n1 = 57, n2 = 34
#> Null hypothesis: r1.jk is equal to r2.hm
#> Alternative hypothesis: r1.jk is not equal to r2.hm (two-sided)
#> Alpha: 0.05
#> 
#> fisher1925: Fisher's z (1925)
#>   z = -1.0885, p-value = 0.2764
#>   Null hypothesis retained
#> 
#> zou2007: Zou's (2007) confidence interval
#>   95% confidence interval for r1.jk - r2.hm: -0.5420 0.1365
#>   Null hypothesis retained (Interval includes 0)
```

#### Correlated Correlations

In the next two examples, we compare *r*_(*rm*) from the same dataset.
These are dependent groups – data from the same participants.

##### Overlapping Correlations

For overlapping correlations, there is a common variable. Here, we
compare correlations between action measures of distance perception. The
first correlation is Blindwalk Away and Blindwalk Toward (*r*_(*rm*) =
0.81, 95% CI \[0.75, 0.85\]) and the second is Blindwalk Toward and
Triangulated Blindwalk (*r*_(*rm*) = 0.23, 95% CI \[0.08, 0.36\]). Note
that both correlations are significantly different than 0 but have
substantially different magnitudes and wide separation in their
confidence intervals. Hence, the two correlations are significantly
different *p* \< 0.0001 for all 9 comparison tests. Also, note the
overlapping or common variable is Blindwalk Toward.

``` r
variables.overlap<- c("Blindwalk Away",
                      "Blindwalk Toward",
                      "Triangulated BW")

dist_rmc_mat_overlap <- rmcorr_mat(participant = Subject, 
                                   variables = variables.overlap, 
                                   dataset = twedt_dist_measures,
                                   CI.level = 0.95)

#dist_rmc_mat_action$summary

#Use summary component 
model1.bwa.bwt <- dist_rmc_mat_overlap$summary[1,] 
model2.bwa.tri <- dist_rmc_mat_overlap$summary[2,]
model3.bwt.tri <- dist_rmc_mat_overlap$summary[3,]

r.jk <- model1.bwa.bwt$rmcorr.r
r.jh <- model2.bwa.tri$rmcorr.r #overlap
r.kh <- model3.bwt.tri$rmcorr.r


#Since there is missing data, the results are unbalanced. We use the average effective sample size.
n    <- mean(dist_rmc_mat_overlap$summary$effective.N)

cocor.dep.groups.overlap(r.jk, 
                         r.jh, 
                         r.kh, 
                         n, 
                         alternative = "two.sided", 
                         test = "all", 
                         var.labels = variables.overlap) #Same as variables used in rmcorr_mat()
#> 
#>   Results of a comparison of two overlapping correlations based on dependent groups
#> 
#> Comparison between r.jk (Blindwalk Away, Blindwalk Toward) = 0.8066 and r.jh (Blindwalk Away, Triangulated BW) = 0.2383
#> Difference: r.jk - r.jh = 0.5683
#> Related correlation: r.kh = 0.2255
#> Data: j = Blindwalk Away, k = Blindwalk Toward, h = Triangulated BW
#> Group size: n = 177
#> Null hypothesis: r.jk is equal to r.jh
#> Alternative hypothesis: r.jk is not equal to r.jh (two-sided)
#> Alpha: 0.05
#> 
#> pearson1898: Pearson and Filon's z (1898)
#>   z = 7.8559, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> hotelling1940: Hotelling's t (1940)
#>   t = 10.2385, df = 174, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> williams1959: Williams' t (1959)
#>   t = 9.3823, df = 174, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> olkin1967: Olkin's z (1967)
#>   z = 7.8559, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> dunn1969: Dunn and Clark's z (1969)
#>   z = 8.7407, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> hendrickson1970: Hendrickson, Stanley, and Hills' (1970) modification of Williams' t (1959)
#>   t = 10.2368, df = 174, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> steiger1980: Steiger's (1980) modification of Dunn and Clark's z (1969) using average correlations
#>   z = 8.5460, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> meng1992: Meng, Rosenthal, and Rubin's z (1992)
#>   z = 8.3907, p-value = 0.0000
#>   Null hypothesis rejected
#>   95% confidence interval for r.jk - r.jh: 0.6700 1.0784
#>   Null hypothesis rejected (Interval does not include 0)
#> 
#> hittner2003: Hittner, May, and Silver's (2003) modification of Dunn and Clark's z (1969) using a backtransformed average Fisher's (1921) Z procedure
#>   z = 8.3966, p-value = 0.0000
#>   Null hypothesis rejected
#> 
#> zou2007: Zou's (2007) confidence interval
#>   95% confidence interval for r.jk - r.jh: 0.4288 0.7139
#>   Null hypothesis rejected (Interval does not include 0)
```

##### Non-Overlapping Correlations

For non-overlapping correlations, data are from the same participants
but there is no overlapping variable in the comparison. We compare
correlations between two action measures of distance perception
(blindwalk away and blindwalk toward) and two direct measures (verbal
and visual matching). The respective correlations are (*r*_(*rm*) =
0.81, 95% CI \[0.75, 0.85\]) and (*r*_(*rm*) = 0.73, 95% CI \[0.66,
0.80\]). The non-overlapping correlations are similar in magnitude with
partially overlapping confidence intervals. Thus, they are barely
significantly different *p* \< 0.04.

``` r
variables.nonoverlap  <- c("Blindwalk Away",
                           "Blindwalk Toward",
                           "Verbal",
                           "Visual matching")

dist_rmc_mat_nonoverlap <- rmcorr_mat(participant = Subject, 
                                      variables = variables.nonoverlap, 
                                      dataset = twedt_dist_measures,
                                      CI.level = 0.95)

dist_rmc_mat_nonoverlap$summary
#>           measure1         measure2  df  rmcorr.r   lowerCI   upperCI
#> 1   Blindwalk Away Blindwalk Toward 175 0.8065821 0.7480818 0.8526427
#> 2   Blindwalk Away           Verbal 175 0.7355813 0.6596521 0.7966468
#> 3   Blindwalk Away  Visual matching 174 0.7758245 0.7093042 0.8286489
#> 4 Blindwalk Toward           Verbal 177 0.7160551 0.6362000 0.7807308
#> 5 Blindwalk Toward  Visual matching 177 0.7575109 0.6871894 0.8137687
#> 6           Verbal  Visual matching 179 0.7341831 0.6588827 0.7949162
#>         p.vals effective.N
#> 1 8.228992e-42         177
#> 2 2.056415e-31         177
#> 3 1.226384e-36         176
#> 4 1.937983e-29         179
#> 5 1.302874e-34         179
#> 6 6.400493e-32         181

#Use summary component 
model1.bwa.bwt   <- dist_rmc_mat_nonoverlap$summary[1,] 
model2.verb.vis  <- dist_rmc_mat_nonoverlap$summary[6,]
model3.bwa.verb  <- dist_rmc_mat_nonoverlap$summary[2,]
model4.bwa.vis   <- dist_rmc_mat_nonoverlap$summary[3,] 
model5.bwt.verb  <- dist_rmc_mat_nonoverlap$summary[4,] 
model6.bwt.vis   <- dist_rmc_mat_nonoverlap$summary[5,] 

#Cheatsheet
    #j = bwa
    #k = bwt
    #h = verb
    #m = vis

r.jk <- model1.bwa.bwt$rmcorr.r  #Action measures
r.hm <- model2.verb.vis$rmcorr.r #Direct measures
r.jh <- model3.bwa.verb$rmcorr.r #bwa ~ verb
r.jm <- model4.bwa.vis$rmcorr.r  #bwa ~ vis
r.kh <- model5.bwt.verb$rmcorr.r #bwt ~ verb
r.km <- model6.bwt.vis$rmcorr.r  #bwt ~ vis

#Since there is missing data, we use the average effective sample size.
n    <- round(mean(dist_rmc_mat_nonoverlap$summary$effective.N), digits = 0) + 2

cocor.dep.groups.nonoverlap(r.jk,
                            r.hm, 
                            r.jh, 
                            r.jm, 
                            r.kh, 
                            r.km, 
                            n, 
                            alternative = "two.sided", 
                            test = "all", 
                            var.labels = variables.nonoverlap) #Same as variables used in rmcorr_mat()
#> 
#>   Results of a comparison of two nonoverlapping correlations based on dependent groups
#> 
#> Comparison between r.jk (Blindwalk Away, Blindwalk Toward) = 0.8066 and r.hm (Verbal, Visual matching) = 0.7342
#> Difference: r.jk - r.hm = 0.0724
#> Related correlations: r.jh = 0.7356, r.jm = 0.7758, r.kh = 0.7161, r.km = 0.7575
#> Data: j = Blindwalk Away, k = Blindwalk Toward, h = Verbal, m = Visual matching
#> Group size: n = 180
#> Null hypothesis: r.jk is equal to r.hm
#> Alternative hypothesis: r.jk is not equal to r.hm (two-sided)
#> Alpha: 0.05
#> 
#> pearson1898: Pearson and Filon's z (1898)
#>   z = 2.0671, p-value = 0.0387
#>   Null hypothesis rejected
#> 
#> dunn1969: Dunn and Clark's z (1969)
#>   z = 2.0989, p-value = 0.0358
#>   Null hypothesis rejected
#> 
#> steiger1980: Steiger's (1980) modification of Dunn and Clark's z (1969) using average correlations
#>   z = 2.0983, p-value = 0.0359
#>   Null hypothesis rejected
#> 
#> raghunathan1996: Raghunathan, Rosenthal, and Rubin's (1996) modification of Pearson and Filon's z (1898)
#>   z = 2.0989, p-value = 0.0358
#>   Null hypothesis rejected
#> 
#> silver2004: Silver, Hittner, and May's (2004) modification of Dunn and Clark's z (1969) using a backtransformed average Fisher's (1921) Z procedure
#>   z = 2.0966, p-value = 0.0360
#>   Null hypothesis rejected
#> 
#> zou2007: Zou's (2007) confidence interval
#>   95% confidence interval for r.jk - r.hm: 0.0048 0.1456
#>   Null hypothesis rejected (Interval does not include 0)
```

Diedenhofen, Birk, and Jochen Musch. 2015. “Cocor: A Comprehensive
Solution for the Statistical Comparison of Correlations.” *PLoS ONE* 10
(4): e0121945. <https://doi.org/10.1371/journal.pone.0121945>.
