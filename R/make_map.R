
#' Make territorial map from planes
#' --
#'
#' @param parameters --.
#' @param xlim --.
#' @param ylim --.
#' @param density --.
#' @param plot --.
#' @param new --.
#' @param points --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


make_map = function (parameters, xlim = NULL, ylim = NULL, density = 1000,
                     plot = FALSE, new = TRUE, points = NULL){

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
  if (plot) plot_map (chulls, new=new, xlim=xlim,ylim=ylim)

  return(chulls)
}


