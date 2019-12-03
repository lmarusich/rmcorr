[![Travis-CI Build Status](https://travis-ci.org/lmarusich/rmcorr.svg?branch=master)](https://https://travis-ci.org/lmarusich/rmcorr)
[![](http://www.r-pkg.org/badges/version/rmcorr)](https://CRAN.R-project.org/package=rmcorr)
[![](http://cranlogs.r-pkg.org/badges/grand-total/rmcorr)](https://CRAN.R-project.org/package=rmcorr)
[![](http://cranlogs.r-pkg.org/badges/last-month/rmcorr)](https://CRAN.R-project.org/package=rmcorr)
<!--[![Coverage Status]-->
<!-- README.md is generated from README.Rmd. Please edit that file -->
rmcorr
======

Repeated measures correlation (rmcorr) is a statistical technique for determining the common within-individual association for paired measures assessed on two or more occasions for multiple individuals.

Installation
------------

``` r
install.packages('rmcorr')

#development version:
# install.packages("devtools")
devtools::install_github("lmarusich/rmcorr")
```

Example
-------

``` r

library(rmcorr)
rmcorr(Subject, PacO2, pH, bland1995)
#> Warning in rmcorr(Subject, PacO2, pH, bland1995): 'Subject' coerced into a
#> factor
#> 
#> Repeated measures correlation
#> 
#> r
#> -0.5067697
#> 
#> degrees of freedom
#> 38
#> 
#> p-value
#> 0.0008471081
#> 
#> 95% confidence interval
#> -0.7112297 -0.223255
```
