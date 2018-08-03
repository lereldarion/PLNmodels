#include "RcppArmadillo.h"

// [[Rcpp::depends(RcppArmadillo)]]

#include "utils_optim.h"

double fn_optim_VEstep_PLN(const std::vector<double> &x, std::vector<double> &grad, void *data) {

  optim_data *dat = reinterpret_cast<optim_data*>(data);
  dat->iterations++; // increase number of iterations

  int n = dat->Y.n_rows, p = dat->Y.n_cols, d = dat->X.n_cols ;

  arma::mat M(&x[0]    , n,p);
  arma::mat S(&x[n*p]  , n,p);

  arma::mat Z = dat->O + dat->X * Theta.t() + M;
  arma::mat A = exp (Z + .5 * S);

  double objective = accu(A - dat->Y % Z - .5*log(S)) - .5*n*real(log_det_Omega) + dat->KY ;

  arma::vec grd_M     = vectorise(M * Omega + A-dat->Y) ;
  arma::vec grd_S     = vectorise(.5 * (arma::ones(n) * diagvec(Omega).t() + A - 1/S));

  if (!grad.empty()) {
    grad = arma::conv_to<stdvec>::from(join_vert(grd_M, grd_S)) ;
  }

  return objective;
}

// [[Rcpp::export]]
Rcpp::List optimization_VEstep_PLN(
    arma::vec par,
    const arma::mat Y,
    const arma::mat X,
    const arma::mat O,
    const arma::mat Theta,
    const arma::mat Sigma,
    Rcpp::List options) {

  // Create optim data structure
  const arma::mat Omega = inv_sympd(Sigma);
  const double log_det_Omega = real(log_det(Omega));
  optim_data my_optim_data(Y, X, O, Theta, Omega, log_det_Omega);

  // Initialize the NLOPT optimizer
  nlopt::opt opt = initNLOPT(par.n_elem, options) ;

  // Perform the optimization
  double f_optimized ;
  stdvec x_optimized = arma::conv_to<stdvec>::from(par);
  opt.set_min_objective(fn_optim_VEstep_PLN, &my_optim_data);
  nlopt::result status = opt.optimize(x_optimized, f_optimized);

  return Rcpp::List::create(
    Rcpp::Named("status"    ) = (int) status,
    Rcpp::Named("objective" ) = f_optimized ,
    Rcpp::Named("solution"  ) = x_optimized,
    Rcpp::Named("iterations") = my_optim_data.iterations
  );
}

