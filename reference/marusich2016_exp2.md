# Repeated measurements of dyads performance and subjective situation awareness

A dataset containing three repeated measures of dyads (paired
participants) working together to capture High Value Targets (lower task
time is better performance) and their averaged Mission Awareness Rating
Scale (MARS) score for each block, repeated three times. MARS evaluates
subjective situation awareness (”knowing what is going on”), higher
values indicate better situation awareness.

## Usage

``` r
marusich2016_exp2
```

## Format

A data frame with 84 rows (28 dyads/pairs) and 4 variables

|        |                      |                                            |
|--------|----------------------|--------------------------------------------|
| `[,1]` | `Pair`               | Unique identifer for each dyad             |
| `[,2]` | `HVT_capture`        | Capture time                               |
| `[,3]` | `MARS`               | subjective situation awareness             |
| `[,4]` | `Source Reliability` | 1 = none, 2 = accurate, and 3 = inaccurate |

## Source

Marusich et al. (2016). Effects of information availability on
command-and-control decision making: performance, trust, and situation
awareness. *Human Factors, 58*(2), 301-321,
[doi:10.1177/0018720815619515](https://doi.org/10.1177/0018720815619515)
