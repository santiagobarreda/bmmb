
#' Add missing levels
#'
#' --
#'
#' @param x --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

add_missing = function (x){

  n = ncol (x)
  lab = colnames (x)[n]

  num = 1 + as.numeric(substr(lab,nchar(lab),nchar(lab)))
  newlab = paste0 (substr(lab,1,nchar(lab)-1), num)

  output = cbind (x, - rowSums (x))
  colnames (output)[n+1] = newlab

  return (output)

}

