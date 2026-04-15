# Create a repeated measures correlation matrix.

Create a repeated measures correlation matrix.

## Usage

``` r
rmcorr_mat(participant, variables, dataset, CI.level = 0.95)
```

## Arguments

- participant:

  A variable giving the subject name/id for each observation.

- variables:

  A character vector indicating the columns of variables to include in
  the correlation matrix.

- dataset:

  The data frame containing the variables.

- CI.level:

  The level of confidence intervals to use in the rmcorr models.

## Value

A list with class "rmcmat" containing the following components.

- matrix:

  the repeated measures correlation matrix

- summary:

  a dataframe showing rmcorr stats for each pair of variables

- models:

  a list of the full rmcorr model for each pair of variables

## References

Bakdash, J.Z., & Marusich, L.R. (2017). Repeated Measures Correlation.
*Frontiers in Psychology, 8*, 456.
[doi:10.3389/fpsyg.2017.00456](https://doi.org/10.3389/fpsyg.2017.00456)
.

Bland, J.M., & Altman, D.G. (1995). Calculating correlation coefficients
with repeated observations: Part 1 – correlation within subjects. *BMJ,
310*, 446,
[doi:10.1136/bmj.310.6977.446](https://doi.org/10.1136/bmj.310.6977.446)
.

Cohen, P., West, S. G., & Aiken, L. S. (2002). *Applied multiple
regression/correlation analysis for the behavioral sciences* (3rd
edition), Routledge. ISBN: 9780805822236.

## See also

[`rmcorr`](rmcorr.md)`, `[`plot.rmc`](plot.rmc.md)

## Examples

``` r
dist_rmc_mat <- rmcorr_mat(participant = Subject, 
                           variables = c("Blindwalk Away",
                                         "Blindwalk Toward",
                                         "Triangulated BW",
                                         "Verbal",
                                         "Visual matching"),
                           dataset = twedt_dist_measures,
                           CI.level = 0.95)
plot(dist_rmc_mat$models[[2]])
```
