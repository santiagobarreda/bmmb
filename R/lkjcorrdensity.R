#' LKJ correlation prior density
#'
#' --
#'
#' @param eta --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


lkjcorrdensity = function(eta=2){
  xs = seq ( -1,1,.001)
  unscaled = xs*0
  for (i in 1:length(xs)){
    mat = matrix (c(1,xs[i],xs[i],1),2,2)
    unscaled[i] = det(mat)^(eta-1)
  }
  scaled = unscaled / sum (diff(xs) * unscaled[-1])
  output = cbind (xs, scaled)
  return (output)
}
