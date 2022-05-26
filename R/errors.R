
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
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

mae = function (x){
  x = x[!is.na(x)]
  return (stats::median (abs(x)))
}






