
#' Plot territorial maps
#'
#' Plot territorial maps estimated using the bmmb::make_map function provided in this package. See chapter 12 for usage examples.
#'
#' @param maps the output of bmmb::make_map.
#' @param new if TRUE, a new plot is created.
#' @param colors a vector of colors, one for each territory.
#' @param xlim plot x axis limits.
#' @param ylim plot y axis limits.
#' @param ... additional parameters are passed to the internal call of plot().
#' @export
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
