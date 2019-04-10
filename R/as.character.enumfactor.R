#' @export
as.character.enumfactor <- function(x){
  if(!is.factor(x)) class(x) = "factor"
  return(as.character.factor(x))
}
