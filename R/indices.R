#' @export
indices <- function(x) UseMethod("indices")

#' @export
indices.default <- function(x) attr(x, "indices")
