% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmcorr.R
\name{print.rmc}
\alias{print.rmc}
\title{Print the results of a repeated measures correlation}
\usage{
\method{print}{rmc}(x, ...)
}
\arguments{
\item{x}{An object of class "rmc", a result of a call to rmcorr.}

\item{...}{additional arguments to \code{\link[base]{print}}.}
}
\description{
Print the results of a repeated measures correlation
}
\examples{
## Bland Altman 1995 data
blandrmc <- rmcorr(Subject, PaCO2, pH, bland1995)
blandrmc
}
\seealso{
\code{\link{rmcorr}}
}
