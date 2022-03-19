
#' Bayesian R2
#'
#' R2 with and without random effects.
#'
#' @param model brms hypothesis object.
#' @param re_formula --.
#' @param summary --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


r2_bayes = function (model, re_formula = NULL, summary = TRUE){

  if (class(model) != "brmsfit") stop ("Model must be fit with brms.")

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

