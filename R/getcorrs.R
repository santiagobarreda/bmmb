

#' Get random effect correlations
#'
#' --

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


#' Get random effect standard deviations
#'
#' --

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

