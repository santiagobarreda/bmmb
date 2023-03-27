
#' Plot brm parameter information
#'
#' Make plots of brm model parameter means and intervals.
#'
#' @param mat a dataframe or matrix representing the posterior summary of brms model parameters.
#' @param ylim optionally override the plot y range.
#' @param xlim optionally override the plot x range.
#' @param horizontal if TRUE, plot parameters across the x axis.
#' @param add if TRUE, add to existing plot.
#' @param xs provide x axis location for plotting parameters.
#' @param col color for points and intervals.
#' @param labels a vector of labels. If "", labels are blank.
#' @param xlab optionally override the plot x axis range.
#' @param ylab optionally override the plot y axis range.
#' @param pch points for parameter means.
#' @param lwd line widths for intervals.
#' @param cex point size for parameter means.
#' @param las orientation of axis labels.
#' @param cex.axis expansion of axis tick numbers.
#' @param grid if TRUE, a grid is added.
#' @param cex.lab expansion of axis labels.
#' @param yaxs y axis edge settings.
#' @param xaxs x axis edge settings.
#' @param line if TRUE, add a line at x=0.
#' @param nudge nudge points along x axis by this amount.
#' @param omit a vector of parameters to be omitted.
#' @param ... additional parameters are passed to internal call of brmplot.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = brms::get_model("11_model_height_vtl_f0")
#' fixed_effects = fixef (model_height_vtl)
#' brmplot (fixed_effects, omit = 1)
#' }
#'

brmplot = function (mat, ylim=NULL, xlim = NULL, horizontal = TRUE, add = FALSE,
                    xs = NULL, col = 1, labels = "default",xlab='',ylab='',
                    pch=16, lwd=2,cex=1.5, las=NA,cex.axis=1,grid=TRUE,cex.lab=1,
                    yaxs="r",xaxs="r",line=TRUE, nudge =0,omit=0,...){

  if (class(mat)[1] == "brmsfit") mat = brms::fixef(mat)
  #if (class(mat)[1] == "short_hypothesis") mat = mat[[1]]

  if (omit[1] != 0) mat = mat[-omit,]
  n = nrow (mat)

  if (horizontal){
    if (is.null(xs)) xs = (1:n)
    xs = xs + nudge
    if (is.null(xlim)) xlim = range (1:n) + c(-.2,.2)
    if (is.null(ylim)) ylim = range (mat[,3:4])
    if (labels[1]=="default") labels = rownames(mat)
    if (is.null(labels)) labels = 1:nrow(mat)

    if (!add){
      plot (0, type='n', ylim = ylim,xlim=xlim, xlab=xlab,xaxt='n',ylab = ylab,
            cex.axis=cex.axis,yaxs=yaxs,xaxs=xaxs,cex.lab=cex.lab,lwd=lwd,...)
      if (grid) grid()
      if (line & horizontal) graphics::abline(h=0)
      if (line & !horizontal) graphics::abline(v=0)
      graphics::points (xs,mat[,1], col=col,pch=pch,cex=cex,lwd=lwd)
    }
    if (add)  graphics::points (xs, mat[,1], col=col, pch=pch,cex=cex,lwd=lwd)
    if (is.na(las))las=1
    if (labels[1]!="") graphics::axis (side=1, at = xs, labels = labels, las=las, cex.axis=cex.axis)

    if (length(col)==1) col = rep (col, length(xs))
    for (i in 1:n) graphics::segments (xs[i],mat[i,3],xs[i],mat[i,4],lwd=lwd, col=col[i])
  }
  if (!horizontal){
    if (is.null(xs)) xs = (n:1)
    xs = xs + nudge
    if (is.null(xlim)) xlim = range (mat[,3:4])
    if (labels[1]=="default") labels = rownames(mat)
    if (is.null(labels)) labels = 1:nrow(mat)

    if (is.null(ylim)) ylim = range (1:n) + c(-.2,.2)
    if (!add){
      plot (0,type='n', ylim = ylim,xlim=xlim, ylab=ylab,yaxt='n',xlab = xlab,
            cex.axis=cex.axis,yaxs=yaxs,xaxs=xaxs,cex.lab=cex.lab,...)
      if (grid) grid()
      if (line) graphics::abline(v=0)
      graphics::points (mat[,1],xs, pch=pch, col=col,cex=cex,lwd=lwd)

    }
    if (add) graphics::points (mat[,1],xs, pch=pch,cex=cex, col=col,lwd=lwd)
    if (is.na(las))las=2
    if (labels[1]!="") graphics::axis (side=2, at = xs, labels = labels, las=las, cex.axis=cex.axis)

    if (length(col)==1) col = rep (col, length(xs))
    for (i in n:1) graphics::segments (mat[i,3],xs[i],mat[i,4],xs[i],lwd=lwd, col=col[i])
  }
}

