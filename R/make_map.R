
#' Make territorial map from planes
#' --
#'
#' @param parameters --.
#' @param xlim --.
#' @param ylim --.
#' @param density --.
#' @param plot --.
#' @param new --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


make_map = function (parameters, xlim = NULL, ylim = NULL, density = 1000, plot = FALSE, new = TRUE){

  if (is.null(xlim)) xlim = par()$usr[1:2]
  if (is.null(ylim)) ylim = par()$usr[3:4]

  x = seq(xlim[1],xlim[2],length.out=density)
  y = seq(ylim[1],ylim[2],length.out=density)

  points = cbind (1,expand.grid (x,y))
  scores = NULL
  for (i in 1:ncol(parameters))
    scores = cbind(scores, as.matrix(points) %*% parameters[,i])

  cat = apply (t(scores),2,which.max)

  chulls = list()
  for (i in 1:ncol(parameters)){
    use = chull (points[cat==i,2:3])
    chulls[[i]] = points[cat==i,][use,2:3]
  }
  if (plot) plot_map (chulls, new=new)

  return(chulls)
}


