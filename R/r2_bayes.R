
#' Bayesian R2
#'
#' Calculate Bayesian R2 with control over which random effects are included. This function uses the method described in: Gelman, A., Goodrich, B., Gabry, J., & Vehtari, A. (2019). R-squared for Bayesian regression models. The American Statistician, 73(3), 307–309.
#'
#' @rdname r2bayes
#' @param model brms hypothesis object.
#' @param re_formula formula containing group-level effects to be considered in the prediction. If NULL (default), include all group-level effects; if NA, include no group-level effects.
#' @param summary if TRUE, R2 values are summarized.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


r2_bayes = function (model, re_formula = NULL, summary = TRUE){

  if (inherits(model, "brmsfit")) stop ("Model must be fit with brms.")

  if (model$family[1]!="student" & model$family[1]=="normal") stop ("Data type not supported for now.")

  linpred = brms::posterior_linpred(model, summary = FALSE, re_formula = re_formula)

  y_idx = as.character (model$formula[[1]][[2]])
  resids = sweep (linpred, 2, model$data[,y_idx])

  linpred_vars = apply (linpred,1,stats::var)
  resids_vars = apply (resids,1,stats::var)
  r2 = (linpred_vars / (linpred_vars+resids_vars))
  if (summary) r2 = brms::posterior_summary (r2)

  return (r2)
}

#' @rdname r2bayes
#' @export
r2bayes <- r2_bayes

#' @rdname r2bayes
#' @export
R2_bayes <- r2_bayes

#' @rdname r2bayes
#' @export
R2bayes <- r2_bayes
