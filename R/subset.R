`[.enumfactor` <- function(x, ..., drop = FALSE){
  y <- NextMethod("[")
  attr(y, "contrasts") <- attr(x, "contrasts")
  attr(y, "levels") <- attr(x, "levels")
  attr(y, "indices") <- attr(x, "indices")
  class(y) <- oldClass(x)
  if (drop)
    stop("not yet implemented")
  else y
}
