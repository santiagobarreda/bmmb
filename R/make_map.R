
#' Make territorial map from planes
#'
#' Make territorial maps estimated based on multinomial regression models. See chapter 12 for usage examples and a more detailed description.
#'
#' @param parameters a matrix containing the parameters of the surfaces representing each category.
#' @param xlim the x axis range for boundary calculations.
#' @param ylim the x axis range for boundary calculations.
#' @param density the number of points sampled along the x and y axis ranges.
#' @param plot if TRUE, the results are plotted.
#' @param new if TRUE, a new plot is created.
#' @param points if a set of x and y axis points are provided, plot ranges are based on the area covered by the points.
#' @param ... additional parameters are passed to internal call of bmmb::plot_map().
#' @export
#'


make_map = function (parameters, xlim = NULL, ylim = NULL, density = 1000,
                     plot = FALSE, new = TRUE, points = NULL,...){

  if (is.null(xlim)) xlim = graphics::par()$usr[1:2]
  if (is.null(ylim)) ylim = graphics::par()$usr[3:4]

  if (!is.null(points)){
    xlim = range (points[,1])
    ylim = range (points[,2])
  }

  x = seq(xlim[1],xlim[2],length.out=density)
  y = seq(ylim[1],ylim[2],length.out=density)

  points = cbind (1,expand.grid (x,y))
  scores = NULL
  for (i in 1:ncol(parameters))
    scores = cbind(scores, as.matrix(points) %*% parameters[,i])

  cat = apply (t(scores),2,which.max)

  chulls = list()
  for (i in 1:ncol(parameters)){
    use = grDevices::chull (points[cat==i,2:3])
    chulls[[i]] = points[cat==i,][use,2:3]
  }
  if (plot) plot_map (chulls, new=new, xlim=xlim,ylim=ylim,...)

  return(chulls)
}


