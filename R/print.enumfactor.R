#' @export
print.enumfactor <- function(x,
                             quote = FALSE,
                             max.levels = NULL,
                             width = getOption("width"),
                             ...){
  if (length(x) == 0L)
    cat("enumfactor", "(0)\n", sep = "")
  else {
    xx <- character(length(x))
    xx[] <- as.character(x)
    keepAttrs <- setdiff(names(attributes(x)), c("levels",
                                                 "indices",
                                                 "class"))
    attributes(xx)[keepAttrs] <- attributes(x)[keepAttrs]
    print(xx, quote = quote, ...)
  }
  maxl <- if (is.null(max.levels))
    TRUE
  else max.levels
  if (maxl) {
    n <- length(lev <- encodeString(levels(x), quote = ifelse(quote,
                                                              "\"", "")))
    colsep <- " "
    T0 <- "Levels: "
    if (is.logical(maxl))
      maxl <- {
        width <- width - (nchar(T0, "w") + 3L + 1L +
                            3L)
        lenl <- cumsum(nchar(lev, "w") + nchar(colsep,
                                               "w"))
        if (n <= 1L || lenl[n] <= width)
          n
        else max(1L, which.max(lenl > width) - 1L)
      }
    drop <- n > maxl
    cat(if (drop)
      paste(format(n), ""), T0, paste(if (drop)
        c(lev[1L:max(1, maxl - 1)], "...", if (maxl > 1) lev[n])
        else lev, collapse = colsep), "\n", sep = "")

    T1 <- "Indices: "
    ind <-  encodeString(indices(x), quote = ifelse(quote, "\"", ""))
    cat(if (drop)
      paste(format(n), ""), T1, paste(if (drop)
        c(ind[1L:max(1, maxl - 1)], "...", if (maxl > 1) ind[n])
        else ind, collapse = colsep), "\n", sep = "")
  }
  invisible(x)
}
