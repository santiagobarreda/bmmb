
#' Get random effect standard deviations
#'
#' --

#' @name getsds 
#' @param model --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
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