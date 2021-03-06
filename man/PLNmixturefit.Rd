% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PLNmixturefit-class.R
\name{PLNmixturefit}
\alias{PLNmixturefit}
\title{An R6 Class to represent a PLNfit in a mixture framework}
\description{
The function \code{\link{PLNmixture}} produces a collection of models which are instances of object with class \code{PLNmixturefit}.
A \code{PLNmixturefit} (say, with k components) is itself a collection of k \code{PLNfit}.

This class comes with a set of methods, some of them being useful for the user:
See the documentation for ...
}
\seealso{
The function \code{\link{PLNmixture}}, the class \code{\link[=PLNmixturefamily]{PLNmixturefamily}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{n}}{number of samples}

\item{\code{p}}{number of dimensions of the latent space}

\item{\code{k}}{number of components}

\item{\code{components}}{components of the mixture (PLNfits)}

\item{\code{posteriorProb}}{matrix ofposterior probability for cluster belonging}

\item{\code{memberships}}{vector for cluster index}

\item{\code{mixtureParam}}{vector of cluster proporitions}

\item{\code{optim_par}}{a list with parameters useful for monitoring the optimization}

\item{\code{nb_param}}{number of parameters in the current PLN model}

\item{\code{entropy_clustering}}{Entropy of the variational distribution of the cluster (multinomial)}

\item{\code{entropy_latent}}{Entropy of the variational distribution of the latent vector (Gaussian)}

\item{\code{entropy}}{Full entropy of the variational distribution (latent vector + clustering)}

\item{\code{loglik}}{variational lower bound of the loglikelihood}

\item{\code{loglik_vec}}{element-wise variational lower bound of the loglikelihood}

\item{\code{BIC}}{variational lower bound of the BIC}

\item{\code{ICL}}{variational lower bound of the ICL (include only entropy of the clustering distribution)}

\item{\code{ICL_variant}}{variational lower bound of the ICL (include entropy of both the clustering and latent distributions)}

\item{\code{R_squared}}{approximated goodness-of-fit criterion}

\item{\code{criteria}}{a vector with loglik, BIC, ICL, ICL_variant and number of parameters}

\item{\code{model_par}}{a list with the matrices of parameters found in the model (Theta, Sigma, plus some others depending on the variant)}

\item{\code{var_par}}{a list with two matrices, M and S2, which are the estimated parameters in the variational approximation}

\item{\code{latent}}{a matrix: values of the latent vector (Z in the model)}

\item{\code{fitted}}{a matrix: fitted values of the observations (A in the model)}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{PLNmixturefit$new()}}
\item \href{#method-optimize}{\code{PLNmixturefit$optimize()}}
\item \href{#method-plot_clustering_data}{\code{PLNmixturefit$plot_clustering_data()}}
\item \href{#method-plot_clustering_pca}{\code{PLNmixturefit$plot_clustering_pca()}}
\item \href{#method-postTreatment}{\code{PLNmixturefit$postTreatment()}}
\item \href{#method-show}{\code{PLNmixturefit$show()}}
\item \href{#method-print}{\code{PLNmixturefit$print()}}
\item \href{#method-clone}{\code{PLNmixturefit$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Initialize a \code{\link{PLNmixturefit}} model
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$new(
  responses,
  covariates,
  offsets,
  posteriorProb,
  model,
  xlevels,
  control
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{responses}}{the matrix of responses common to every models}

\item{\code{covariates}}{the matrix of covariates common to every models}

\item{\code{offsets}}{the matrix of offsets common to every models}

\item{\code{posteriorProb}}{matrix ofposterior probability for cluster belonging}

\item{\code{model}}{model used for fitting, extracted from the formula in the upper-level call}

\item{\code{xlevels}}{named listed of factor levels included in the models, extracted from the formula in the upper-level call #'}

\item{\code{control}}{a list for controlling the optimization. See details.}

\item{\code{control}}{a list for controlling the optimization. See details.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-optimize"></a>}}
\if{latex}{\out{\hypertarget{method-optimize}{}}}
\subsection{Method \code{optimize()}}{
Optimize a \code{\link{PLNmixturefit}} model
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$optimize(responses, covariates, offsets, control)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{responses}}{the matrix of responses common to every models}

\item{\code{covariates}}{the matrix of covariates common to every models}

\item{\code{offsets}}{the matrix of offsets common to every models}

\item{\code{control}}{a list for controlling the optimization. See details.}

\item{\code{control}}{a list for controlling the optimization. See details.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plot_clustering_data"></a>}}
\if{latex}{\out{\hypertarget{method-plot_clustering_data}{}}}
\subsection{Method \code{plot_clustering_data()}}{
Plot the matrix of mean counts (without offsets, without covariate effects) reordered according the inferred clustering
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$plot_clustering_data(
  main = "Expected counts reorder by clustering",
  plot = TRUE,
  log_scale = TRUE
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{main}}{character. A title for the plot.  An hopefully appropriate title will be used by default.}

\item{\code{plot}}{logical. Should the plot be displayed or sent back as \code{\link{ggplot}} object}

\item{\code{log_scale}}{logical. Should the color scale values be log-transform before plotting? Default is \code{TRUE}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
a \code{\link{ggplot}} graphic
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-plot_clustering_pca"></a>}}
\if{latex}{\out{\hypertarget{method-plot_clustering_pca}{}}}
\subsection{Method \code{plot_clustering_pca()}}{
Plot the individual map of a PCA performed on the latent coordinate, where individuals are colored according to the memberships
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$plot_clustering_pca(
  main = "Clustering labels in Individual Factor Map",
  plot = TRUE
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{main}}{character. A title for the plot. An hopefully appropriate title will be used by default.}

\item{\code{plot}}{logical. Should the plot be displayed or sent back as \code{\link{ggplot}} object}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
a \code{\link{ggplot}} graphic
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-postTreatment"></a>}}
\if{latex}{\out{\hypertarget{method-postTreatment}{}}}
\subsection{Method \code{postTreatment()}}{
Update fields after optimization
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$postTreatment(responses, covariates, offsets, weights, nullModel)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{responses}}{the matrix of responses common to every models}

\item{\code{covariates}}{the matrix of covariates common to every models}

\item{\code{offsets}}{the matrix of offsets common to every models}

\item{\code{weights}}{an optional vector of observation weights to be used in the fitting process.}

\item{\code{nullModel}}{null model used for approximate R2 computations. Defaults to a GLM model with same design matrix but not latent variable.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-show"></a>}}
\if{latex}{\out{\hypertarget{method-show}{}}}
\subsection{Method \code{show()}}{
User friendly print method
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$show()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
User friendly print method
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$print()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{PLNmixturefit$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
