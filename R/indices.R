#' @export
indices <- function(x) UseMethod("indices")

#' @export
indices.default <- function(x) attr(x, "indices")

#' @export
`indices<-` <- function(x, value) UseMethod("indices<-")

#' @export
`indices<-.default` <- function(x, value) {
  attr(x, "indices") <- value
  return(x)
}
