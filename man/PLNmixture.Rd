% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PLNmixture.R
\name{PLNmixture}
\alias{PLNmixture}
\title{Poisson lognormal mixture model}
\usage{
PLNmixture(
  formula,
  data,
  subset,
  clusters = 1:5,
  control_init = list(),
  control_main = list()
)
}
\arguments{
\item{formula}{an object of class "formula": a symbolic description of the model to be fitted.}

\item{data}{an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lm is called.}

\item{subset}{an optional vector specifying a subset of observations to be used in the fitting process.}

\item{clusters}{a vector of integer containing the successive number of clusters (or components) to be considered}

\item{control_init}{a list for controlling the optimization at initialization. See details.}

\item{control_main}{a list for controlling the main optimization process. See details.}
}
\value{
an R6 object with class \code{\link[=PLNmixturefamily]{PLNmixturefamily}}, which contains
a collection of models with class \code{\link[=PLNmixturefit]{PLNmixturefit}}
}
\description{
Fit the mixture variants of the Poisson lognormal with a variational algorithm. Use the (g)lm syntax for model specification (covariates, offsets).
}
\details{
The list of parameters \code{control_init} and \code{control_main} control the optimization of the intialization and the main process, with the following entries
\itemize{
\item "covariance" character setting the model for the covariance matrices of the mxiture components. Either "full", "diagonal" or "spherical". Default is "spherical".
\item "trace" integer for verbosity.
\item "inception" Set up the initialization. By default, the model is initialized with a multivariate linear model applied on log-transformed data, and with the same formula as the one provided by the user. However, the user can provide a PLNfit (typically obtained from a previous fit), which sometimes speeds up the inference.
\item "ftol_rel" stop when an optimization step changes the objective function by less than ftol multiplied by the absolute value of the parameter. Default is 1e-6 when n < p, 1e-8 otherwise.
\item "ftol_abs" stop when an optimization step changes the objective function by less than ftol multiplied by the absolute value of the parameter. Default is 0
\item "xtol_rel" stop when an optimization step changes every parameters by less than xtol multiplied by the absolute value of the parameter. Default is 1e-4
\item "xtol_abs" stop when an optimization step changes every parameters by less than xtol multiplied by the absolute value of the parameter. Default is 0
\item "maxeval" stop when the number of iteration exceeds maxeval. Default is 10000
\item "maxtime" stop when the optimization time (in seconds) exceeds maxtime. Default is -1 (no restriction)
\item "algorithm" the optimization method used by NLOPT among LD type, i.e. "CCSAQ", "MMA", "LBFGS", "VAR1", "VAR2". See NLOPT documentation for further details. Default is "CCSAQ".
\item "ftol_out" outer solver stops when an optimization step changes the objective function by less than xtol multiply by the absolute value of the parameter. Default is 1e-6
\item "maxit_out" outer solver stops when the number of iteration exceeds out.maxit. Default is 50
\item "smoothing" The smoothing to apply. Either, 'forward', 'backward' or 'both'. Default is 'both'.
\item "iterates" number of forward/backward iteration of smoothing. Default is 2.
}
}
\examples{
data(trichoptera)
trichoptera <- prepare_data(trichoptera$Abundance, trichoptera$Covariate)
myMixtures <- PLNmixture(Abundance ~ 1, clusters = 1:4, data = trichoptera)
}
\seealso{
The classes \code{\link[=PLNmixture]{PLNmixturefamily}} and \code{\link[=PLNmixturefit]{PLNmixturefit}}
}
