

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
  graphics::text (1:15,rep(1,15), 1:15, cex=2)
}




