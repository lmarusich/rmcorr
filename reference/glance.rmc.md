# Glance for a(n) rmcorr object

Glance for a(n) rmcorr object

## Usage

``` r
# S3 method for class 'rmc'
glance(x, ...)
```

## Arguments

- x:

  A(n) rmcorr object created by rmcorr::rmcorr().

- ...:

  Unused, included for generic consistency only.

## Value

A single row summary "glance"
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
of the rmc model.

- `rho`: the value of the repeated measures correlation (rmcorr)
  coefficient (note rho is technically incorrect; this value is neither
  the population correlation nor a Spearman correlation. It was the
  closest match in the glossary)

- `conf.low`: the lower-bound confidence interval for the rmcorr effect
  size

- `conf.high`: the upper-bound confidence interval for the rmcorr effect
  size

- `statistic`: the model F-statistic

- `p.value`: the model p-value

- `df.residual`: the model error/residual degrees of freedom
  (denominator)

- `nobs`: the total number of paired observations

- `n`: the number of unique participants (sample size)

## See also

[`glance()`](https://generics.r-lib.org/reference/glance.html),
[`rmcorr()`](rmcorr.md)

## Examples

``` r
my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#> Warning: 'Subject' coerced into a factor
glance(my.rmc)
#> # A tibble: 1 × 8
#>      rho conf.low conf.high statistic  p.value df.residual  nobs     n
#>    <dbl>    <dbl>     <dbl>     <dbl>    <dbl>       <int> <int> <int>
#> 1 -0.507   -0.707    -0.232      13.1 0.000847          38    47     8
```
