
#' Bayasian ANOVA plot
#'
#' A function to plot the output of the banova function included in this package.
#'
#' @param baov The dataframe representing a Bayesian Analysis of Variance.
#' @param ylim optionally override the plot y range.
#' @param xlim optionally override the plot x range.
#' @param horizontal if TRUE, plot parameters across the x axis.
#' @param cols A vector of colors used to plot the different clusters.
#' @param labels a vector of labels. If "", labels are blank.
#' @param xlab optionally override the plot x axis range.
#' @param ylab optionally override the plot y axis range.
#' @param pch points for parameter means.
#' @param lwd line widths for intervals.
#' @param cex point size for parameter means.
#' @param las orientation of axis labels.
#' @param cex.axis expansion of axis tick numbers.
#' @param grid If TRUE a grid is added to the plot.
#' @param robust if TRUE, robust summaries of posterior distributions are used.
#' @param yaxs y axis edge settings.
#' @param xaxs x axis edge settings.
#' @param line if TRUE, add a line at x=0.
#' @param ... additional parameters are passed to internal call of bmmb::brmplot().
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#' options (contrasts = c('contr.sum','contr.sum'))
#' baov = bmmb::banova (model_height_vtl)
#' bmmb::banovaplot (baov)
#' }
#'
#'

banovaplot = function (baov, ylim=NULL, xlim = NULL, horizontal = TRUE,
                       cols = NULL, labels = "default", xlab='',ylab='', pch=16, lwd=2,
                       cex=1.5, las=NA, cex.axis=1,grid=TRUE, robust = FALSE, yaxs="r",
                       xaxs="r",line=TRUE,...){

  cols = c("#EE4E62BF","#0C8275BF","#F8A61BBF","#27C0D8BF","#CA87B9BF",
           "#3A65AFBF","#822B32BF","#602D45BF","#FF6400BF","#F7B5C5BF")

  cols = cols[as.numeric (factor (baov$cluster))]

  brmplot (baov, ylim=ylim, xlim = xlim, horizontal = horizontal, col=cols,
           labels = labels,xlab=xlab,ylab=ylab, pch=pch, lwd=lwd,cex=cex,
           las=las,cex.axis=cex.axis,grid=grid,  robust = robust,
           yaxs=yaxs,xaxs=xaxs, line=line,...)
}


