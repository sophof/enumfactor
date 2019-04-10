#' @export
as.integer.enumfactor <- function(x){
  return(Rcpp_asInteger_Enumfactor(x, attr(x, "indices")))
}
