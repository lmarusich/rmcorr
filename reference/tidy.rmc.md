# Tidy for a(n) rmcorr object

Tidy for a(n) rmcorr object

## Usage

``` r
# S3 method for class 'rmc'
tidy(x, ...)
```

## Arguments

- x:

  A(n) 'rmcorr' object created by rmcorr::rmcorr().

- ...:

  Unused, included for generic consistency only.

## Value

A tidy
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
summarizing component-level information about the model.

- `term`: the three model terms

- `df`: the degrees of freedom

- `estimate`: the parameter estimate

- `sumsq`: the sums of squares

- `statistic`: the F-statistic

- `p.value`: the p-value

## See also

[`tidy()`](https://generics.r-lib.org/reference/tidy.html),
[`rmcorr()`](https://lmarusich.github.io/rmcorr/reference/rmcorr.md)

## Examples

``` r
my.rmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#> Warning: 'Subject' coerced into a factor
tidy(my.rmc)
#> # A tibble: 3 × 6
#>   term       df estimate sumsq statistic   p.value
#>   <chr>   <dbl>    <dbl> <dbl>     <dbl>     <dbl>
#> 1 Subject     7   -0.108 2.97       48.2  5.68e-17
#> 2 PaCO2       1    7.66  0.115      13.1  8.47e- 4
#> 3 Error      38   NA     0.334      NA   NA       
```
