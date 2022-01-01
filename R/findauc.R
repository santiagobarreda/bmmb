
#' Empirically estimate the area under the curve
#'
#' --
#'
#' @param x --.
#' @param density --.
#' @param log --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'



findauc = function (x,density,log=FALSE){

  if (log){
    max_density = max(density)
    density = density + abs(max_density)
    density = exp (density)
  }
  n = length(density)
  ab2 = (density[-n]+density[-1])/2
  h = diff (x)
  areas = ab2*h
  area = sum(areas)
  if (log){
    area = log (area) - abs(max_density)
  }
  area
}
