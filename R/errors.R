
#' Find root mean square
#'
#' --
#' @param x --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


rms = function (x){
  x = x[!is.na(x)]
  return (sqrt (mean(x^2)))
}


#' Find median absolute error
#'
#' --
#' @param x --.
#' @param mean --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

mae = function (x, mean = FALSE){
  x = x[!is.na(x)]
  if (!mean) return (stats::median (abs(x)))
  if (mean) return (mean (abs(x)))
}


#' Plot plotting colors
#'
#' --
#' @param cols --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


plotcols = function(cols = NA){
  if (is.na(cols[1])) plot (1:15,rep(1,15), col=bmmb::cols,pch=16,cex=9.5)
  if (!is.na(cols[1])) plot (1:15,rep(1,15), col=cols,pch=16,cex=12.5)
  text (1:15,rep(1,15), 1:15, cex=2)
}




