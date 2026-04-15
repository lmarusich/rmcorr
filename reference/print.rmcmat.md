# Print the repeated measures correlation matrix

Print the repeated measures correlation matrix

## Usage

``` r
# S3 method for class 'rmcmat'
print(x, ...)
```

## Arguments

- x:

  An object of class "rmcmat", a result of a call to
  [`rmcorr_mat`](https://lmarusich.github.io/rmcorr/reference/rmcorr_mat.md).

- ...:

  additional arguments to [`print`](https://rdrr.io/r/base/print.html).

## See also

[`rmcorr_mat`](https://lmarusich.github.io/rmcorr/reference/rmcorr_mat.md)`,`[`rmcorr`](https://lmarusich.github.io/rmcorr/reference/rmcorr.md)

## Examples

``` r
## Bland Altman 1995 data
blandrmc <- rmcorr(Subject, PaCO2, pH, bland1995)
#> Warning: 'Subject' coerced into a factor
blandrmc
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
#> -0.7067146 -0.2318631 
#> 
```
