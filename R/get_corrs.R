

#' Get random effect correlations
#'
#' Gets summaries of random effects correlations from a brms model.

#' @rdname getcorrs
#' @param model The brms model.
#' @param factor The factor you want correlations for.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#'
#' # Correlations between listener (L) random effects
#' bmmb::get_corrs (model_height_vtl, "L")
#' }
#'
#'

getcorrs = function (model, factor){

  components = brms::VarCorr(model)
  cormat = components[[factor]]$cor
  if (is.null(cormat)) stop('No correlations exist for this factor.')
  use = lower.tri (cormat[,1,])

  names = apply (expand.grid (rownames(cormat[,1,]), colnames(cormat[,1,])),1, paste, collapse=", ")
  cormat = data.frame (Estimate =c(cormat[,1,]),
                       Est.Error=c( cormat[,2,]),
                       Q2.5=c(cormat[,3,]),
                       Q97.5=c(cormat[,4,]))
  cormat = cormat[c(use),]

  labs = names[c(use)]
  labs = gsub ("Intercept", "Int.",  labs)

  rownames (cormat) = labs
  cormat
}


#' @rdname getcorrs
#' @export
get_corrs <- getcorrs



