
#' Plot territorial maps
#' --
#'
#' @param maps --.
#' @param new --.
#' @param colors --.
#' @param xlim --.
#' @param ylim --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'

plot_map = function (maps, new = TRUE, colors = NULL, xlim = NULL,
                     ylim = NULL,...){

  if (is.null(xlim)){
    tmp = do.call(rbind,maps)
    xlim = range(tmp[,1])
  }
  if (is.null(ylim)){
    tmp = do.call(rbind,maps)
    ylim = range(tmp[,2])
  }
  if (new)
    plot(0, type = "n", xlim = xlim, ylim = ylim, xaxs='i',yaxs='i',...)
  if (all(is.null(colors)))
    colors = rep(15, grDevices::adjustcolor(bmmb::cols[i],
                                            alpha.f = 0.2), 10)
  for (i in 1:length(maps)) {
    graphics::polygon(maps[[i]], col = colors[i], lwd = 3)
  }
}
