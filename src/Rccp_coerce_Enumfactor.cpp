#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
IntegerVector Rcpp_asInteger_Enumfactor(const NumericVector &x, const IntegerVector &indices) {
  int n = x.size();
  IntegerVector out = IntegerVector(n);
  for (int i = 0; i < n; ++i){
    out[i] = indices[x[i] - 1];
  }
  return out;
}

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector Rcpp_asNumeric_Enumfactor(const NumericVector &x, const IntegerVector &indices) {
  int n = x.size();
  NumericVector out = NumericVector(n);
  for (int i = 0; i < n; ++i){
    out[i] = indices[x[i] - 1];
  }
  return out;
}
