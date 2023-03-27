

#' Plot predictive checks
#'
#' Gets predictive samples (prior or posterior) from a brms model. Generates a histogram comparing distributions of samples (and optionally to the data) and returns a dataframe containing these predictions.
#'
#' @param model the brms model to use for prediction.
#' @param show_data if TRUE, actual data is compared to predictions.
#' @param n_samples the number of samples to be drawn.
#' @param samples A number or vector of specific samples to be drawn. If not provided, random samples are selected.
#' @param xlim plot x axis limits.
#' @param ylim plot y axis limits.
#' @param xlab x axis label.
#' @param ylab y axis label.
#' @param ignore_extreme should extreme values be ignored? This is useful for response distributions with large outliers such as t.
#' @param re_formula formula containing group-level effects to be considered in the prediction. If NULL (default), include all group-level effects; if NA, include no group-level effects.
#' @param ... additional arguments are passed to the internal call of plot().
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#'
#' samples = bmmb::p_check (model_height_vtl, show_data=TRUE)
#' head (samples)
#' }

p_check = function (model, show_data = FALSE, n_samples = 10, samples = NULL,
                    xlim = NULL, ylim = NULL,xlab = NULL, ylab = NULL, ignore_extreme = TRUE,
                    re_formula = NULL, ...){

  if (is.null(samples))  spots = sample (1:brms::ndraws(model), size = n_samples)
  if (!is.null(samples)){
    spots = samples
    n_samples = length(spots)
  }

  if (model$family$link!="logit")
    predictions = stats::predict (model, summary = FALSE, draw_ids = spots,
                                  re_formula = re_formula)
  if (model$family$link=="logit")
    predictions = stats::fitted (model, summary = FALSE, draw_ids = spots,scale="linear",
                                 re_formula = re_formula)

  #if (is.null(xlim)) xlim = range (predictions[spots,])
  #if (is.null(xlim)) xlim = quantile(predictions[spots,], c(.01,.99))

  if (ignore_extreme){
    tmp = predictions
    tmp_median = stats::median(tmp)
    mad = stats::median(abs(tmp - tmp_median))
    from = tmp_median - 5*mad
    to = tmp_median + 5*mad
  }

  dens = list()
  maxy = 0
  minx = min(model$data[,1])
  maxx = max(model$data[,1])

  if (show_data){
    dens[[1]] = stats::density (model$data[,1])
    maxy = max(dens[[1]]$y)
    minx = min(dens[[1]]$x)
    maxx = max(dens[[1]]$x)
  }

  for (i in 1:n_samples){
    tmp = predictions[i,]
    if (ignore_extreme) tmp = tmp[tmp > from & tmp < to]
    dens[[i+1]] = stats::density(tmp)
    if (max(dens[[i+1]]$y) > maxy) maxy = max(dens[[i+1]]$y)
    if (max(dens[[i+1]]$x) > maxx) maxx = max(dens[[i+1]]$x)
    if (min(dens[[i+1]]$x) < minx) minx = min(dens[[i+1]]$x)
  }
  if (!show_data) dens = dens[-1]

  if (is.null(ylim)) ylim = c(0,maxy) #* 1.05
  if (is.null(xlim)) xlim = c(minx,maxx)

  if (is.null(ylab)) ylab = "Density"
  if (is.null(xlab)) xlab = "Predicted value"

  if (show_data){
    plot (dens[[1]]$x,dens[[1]]$y,type='l', xlim = xlim, ylim = ylim, main="", lwd=6,col=1,lty=2,
          xlab=xlab,ylab=ylab,...)
    for (i in 2:(n_samples)+1){
      graphics::lines (dens[[i]]$x,dens[[i]]$y, col = bmmb::cols[[i-1]], lwd=4, lty=1)
    }
  }
  if (!show_data){
    plot (dens[[1]]$x,dens[[1]]$y,type='l', xlim = xlim, ylim = ylim, main="", col = bmmb::cols[[1]], lwd=4,
          xlab=xlab,ylab=ylab,lty=1,...)
    for (i in 2:(n_samples)){
      graphics::lines (dens[[i]]$x,dens[[i]]$y, col = bmmb::cols[[i]], lwd=4, lty=1)
    }
  }

  invisible (t(predictions))
}


#' Predictive one version of dependent variables
#'
#' Get posterior predictions.
#'
#' @param model brms model.
#' @param n the number of samples to get.
#' @param draw_ids a vector of specific samples if desired.
#' @param ... additional parameters passed to internal call of predict().
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


predict_n = function (model, n = 1, draw_ids = NULL,...){
  if (is.null(draw_ids)) draw_ids = sample (1:brms::ndraws(model),n)
  y_hat = stats::predict (model, draw_ids=draw_ids,summary=FALSE,...)
  y_hat = t(y_hat)
  y_hat
}

