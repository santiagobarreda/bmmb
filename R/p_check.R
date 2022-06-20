

#' Plot predictive checks
#'
#' --
#'
#' @param predictions --.
#' @param n_samples --.
#' @param samples --.
#' @param xlim --.
#' @param ylim --.
#' @param ignore_extreme --.
#' @param ... --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

p_check = function (predictions, n_samples = 10, samples = NULL,
                    xlim = NULL, ylim = NULL, ignore_extreme = TRUE, ...){

  if (is.null(samples))  spots = sample (1:nrow(predictions), size = n_samples)
  if (!is.null(samples)){
    spots = samples
    n_samples = length(spots)
  }

  #if (is.null(xlim)) xlim = range (predictions[spots,])
  #if (is.null(xlim)) xlim = quantile(predictions[spots,], c(.01,.99))

  maxy = 0
  minx = 0
  maxx = 0
  dens = list()

  if (ignore_extreme){
    tmp = predictions[spots,]
    tmp_median = stats::median(tmp)
    mad = stats::median(abs(tmp - tmp_median))
    from = tmp_median - 5*mad
    to = tmp_median + 5*mad
  }

  for (i in 1:n_samples){
    tmp = predictions[spots[i],]
    if (ignore_extreme) tmp = tmp[tmp > from & tmp < to]
    dens[[i]] = stats::density(tmp)
    if (max(dens[[i]]$y) > maxy) maxy = max(dens[[i]]$y)
    if (max(dens[[i]]$x) > maxx) maxx = max(dens[[i]]$x)
    if (min(dens[[i]]$x) < minx) minx = min(dens[[i]]$x)
  }
  if (is.null(ylim)) ylim = c(0,maxy) #* 1.05
  if (is.null(xlim)) xlim = c(minx,maxx)

  plot (dens[[1]], xlim = xlim, ylim = ylim, main="", ...)
  for (i in 1:n_samples){
    graphics::lines (dens[[i]], col = bmmb::cols[[i]], lwd=4, lty=1, ...)
  }
}

