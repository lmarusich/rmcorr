% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmcorr_mat.R
\name{print.rmcmat}
\alias{print.rmcmat}
\title{Print the repeated measures correlation matrix}
\usage{
\method{print}{rmcmat}(x, ...)
}
\arguments{
\item{x}{An object of class "rmcmat", a result of a call to \code{\link{rmcorr_mat}}.}

\item{...}{additional arguments to \code{\link[base]{print}}.}
}
\description{
Print the repeated measures correlation matrix
}
\examples{
## Bland Altman 1995 data
blandrmc <- rmcorr(Subject, PaCO2, pH, bland1995)
blandrmc
}
\seealso{
\code{\link{rmcorr_mat},\link{rmcorr}}
}
