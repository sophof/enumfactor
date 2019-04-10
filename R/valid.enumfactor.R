.valid.enumfactor <- function (object) {
  levs <- levels(object)
  inds <- indices(object)
  if (!is.character(levs))
    return("enumfactor levels must be \"character\"")
  if (d <- anyDuplicated(levs))
    return(sprintf("duplicated level [%d] in enumfactor", d))
  if (!is.integer(inds))
    return("enumfactor indices must be \"integer\"")
  if (d <- anyDuplicated(inds))
    return(sprintf("duplicated indicator [%d] in enumfactor", d))
  TRUE
}
