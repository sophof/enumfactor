#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector Rcpp_asInteger_Enumfactor(const NumericVector &x, const NumericVector &indices) {
  int n = x.size();
  NumericVector out = NumericVector(n);
  for (int i = 0; i < n; ++i){
    out[i] = indices[x[i] - 1];
  }
  return out;
}
