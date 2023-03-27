
#' Find the modal value/category in a vector
#'
#' @param x A vector of values.
#' @export
#'
#'

findmode = function (x){
  mode = names(rev(sort (table (x)))[1])
  mode
}
