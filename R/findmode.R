
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

findmode = function (x){
  mode = names(rev(sort (table (x)))[1])
  mode
}
