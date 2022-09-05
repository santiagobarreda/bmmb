
#' Plot territorial maps
#' --
#'
#' @param maps --.
#' @param new --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


plot_map = function (maps, new = TRUE, colors = NULL){

  if (new) plot (0,type='n', xlim=xlim,ylim=ylim)
  if (all(is.null(colors))) colors = rep(15, adjustcolor (bmmb::cols[i], alpha.f=.2), 10)


  for (i in 1:length(maps)){
    polygon (maps[[i]], col = colors[i],lwd=3)
  }
}

