#' @export
as.character.enumfactor <- function(x){
  if(!is.factor(x)) class(x) = "factor"
  return(as.character.factor(x))
}

#' @export
as.integer.enumfactor <- function(x) {
  Rcpp_asInteger_Enumfactor(x, attr(x, "indices"))
}

#' @export
as.double.enumfactor <- function(x) {
  Rcpp_asNumeric_Enumfactor(x, attr(x, "indices"))
}
