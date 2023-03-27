
#' Find the root mean squared error
#'
#' @param x a vector of numbers.
#' @export
#'

rms = function (x){
  x = x[!is.na(x)]
  return (sqrt (mean(x^2)))
}


#' Find the median/mean absolute error
#'
#' The median absolute deviation is found by default.
#'
#' @param x a vector of numbers.
#' @param mean if TRUE, the mean absolute deviation is returned.
#' @export
#'
#'

mae = function (x, mean = FALSE){
  x = x[!is.na(x)]
  if (!mean) return (stats::median (abs(x)))
  if (mean) return (mean (abs(x)))
}
