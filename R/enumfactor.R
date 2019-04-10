#' @export
enumfactor <- function(x, ...) UseMethod("enumfactor")

#' @export
enumfactor.default <- function (x = character(),
                        levels,
                        labels = levels,
                        exclude = NA,
                        nmax = NA,
                        indices) {
  out <- enumfactor.factor(
    factor(x, levels, labels, exclude, ordered = FALSE, nmax),
    indices)
  return(out)
}

#' @export
enumfactor.factor <- function(x, indices){
  class(x) <- "enumfactor"
  nlev <- nlevels(x)
  if(missing(indices)) {
    n <- length(nlev)
    if(n ==0) indices <- integer()
    else indices <- 1:nlev
  }
  if(!is.integer(indices)) indices <- as.integer(indices)
  if (length(indices) != nlev){
    msg <- sprintf("number of indices (%d) is not equal to number of levels (%d)",
                   length(indices),
                   nlev)
    stop(msg)
  }
  indices(x) <- indices
  if (!isTRUE(val <- .valid.enumfactor(x)))
    warning(val)
  return(x)
}
