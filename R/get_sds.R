
#' Get random effect standard deviations
#'
#' Gets summaries of the random effect standard deviations from a brms model.
#'
#' @name getsds
#' @param model The brms model.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#'
#' # Standard deviations of different groups of random effects
#' bmmb::get_sds (model_height_vtl)
#' }
#'

getsds = function (model){

  components = brms::VarCorr(model)
  output = data.frame()

  for (i in 1:length(components)){
    tmp = data.frame(components[[i]]$sd)
    tmp$group = names(components)[i]
    labs = rownames(tmp)
    labs = gsub ("Intercept", paste0("Int.",names(components)[i]),  labs)
    rownames(tmp) = labs
    output = rbind(output, tmp)
  }
  fix = which(output$group=="residual__")
  if (length (length(fix)>0)){
    output$group[fix] = "sigma"
    rownames(output)[fix] = "sigma"
  }
  output
}


#' @rdname getsds
#' @export
get_sds <- getsds
