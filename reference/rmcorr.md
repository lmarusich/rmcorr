# Calculate the repeated measures correlation coefficient.

Calculate the repeated measures correlation coefficient.

## Usage

``` r
rmcorr(
  participant,
  measure1,
  measure2,
  dataset,
  CI.level = 0.95,
  CIs = c("analytic", "bootstrap"),
  nreps = 100,
  bstrap.out = F
)
```

## Arguments

- participant:

  A variable giving the subject name/id for each observation.

- measure1:

  A numeric variable giving the observations for one measure.

- measure2:

  A numeric variable giving the observations for the second measure.

- dataset:

  The data frame containing the variables.

- CI.level:

  The confidence level of the interval

- CIs:

  The method of calculating confidence intervals.

- nreps:

  The number of resamples to take if bootstrapping.

- bstrap.out:

  Determines if the output include the bootstrap resamples.

## Value

A list with class "rmc" containing the following components.

- `r`: the value of the repeated measures correlation coefficient

- `df`: the degrees of freedom

- `p`: the p-value for the repeated measures correlation coefficient

- `CI`: the 95% confidence interval for the repeated measures
  correlation coefficient

- `model`: the multiple regression model used to calculate the
  correlation coefficient

- `resamples`: the bootstrap resampled correlation values

## References

Bakdash, J.Z., & Marusich, L.R. (2017). Repeated Measures Correlation.
*Frontiers in Psychology, 8*, 456,
[doi:10.3389/fpsyg.2017.00456](https://doi.org/10.3389/fpsyg.2017.00456)
.

Bakdash, J. Z., & Marusich, L. R. (2019). Corrigendum: Repeated Measures
Correlation. *Frontiers in Psychology, 10*,
[doi:10.3389/fpsyg.2019.01201](https://doi.org/10.3389/fpsyg.2019.01201)

Bland, J.M., & Altman, D.G. (1995a). Calculating correlation
coefficients with repeated observations: Part 1 – correlation within
subjects. *BMJ, 310*, 446,
[doi:10.1136/bmj.310.6977.446](https://doi.org/10.1136/bmj.310.6977.446)

Bland, J.M., & Altman, D.G. (1995b). Calculating correlation
coefficients with repeated observations: Part 2 – correlation within
subjects. *BMJ, 310*, 633,
[doi:10.1136/bmj.310.6980.633](https://doi.org/10.1136/bmj.310.6980.633)

## See also

[`plot.rmc`](plot.rmc.md)`, `[`geom_rmc`](geom_rmc.md)

## Examples

``` r
## Bland Altman 1995 data
rmcorr(Subject, PaCO2, pH, bland1995)
#> Warning: 'Subject' coerced into a factor
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
