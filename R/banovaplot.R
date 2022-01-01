
#' Bayasian ANOVA plot
#'
#' --
#'
#' @param baov --.
#' @param ylim --.
#' @param xlim --.
#' @param horizontal --.
#' @param cols --.
#' @param labels --.
#' @param xlab --.
#' @param ylab --.
#' @param pch --.
#' @param lwd --.
#' @param cex --.
#' @param las --.
#' @param cex.axis --.
#' @param grid --.
#' @param robust --.
#' @param yaxs --.
#' @param xaxs --.
#' @param line --.
#' @param ... --.
#' @export
#' @examples
#' \dontrun{
#' --
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

