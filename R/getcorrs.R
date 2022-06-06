

#' Get random effect correlations
#'
#' --

#' @rdname getcorrs
#' @param model --.
#' @param factor --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

getcorrs = function (model, factor){

  components = brms::VarCorr(model)
  cormat = components[[factor]]$cor
  if (is.null(cormat)) stop('No correlations exist for this factor.')
  use = lower.tri (cormat[,1,])

  names = apply (expand.grid (rownames(cormat[,1,]), colnames(cormat[,1,])),1, paste, collapse=", ")
  cormat = cbind (c(cormat[,1,]),
                c(cormat[,2,]),
                c(cormat[,3,]),
                c(cormat[,4,]))
  cormat = cormat[c(use),]

  labs = names[c(use)]
  labs = gsub ("Intercept", "Int.",  labs)
  rownames (cormat) = labs
  colnames (cormat) = c("Estimate","Est.Error","Q2.5","Q97.5")
  cormat
}


#' @rdname getcorrs
#' @export
get_corrs <- getcorrs