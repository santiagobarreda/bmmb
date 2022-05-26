
#' Bayesian ANOVA
#'
#' --
#'
#' @param model --.
#' @param superpopulation --.
#' @param collapse --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

banova = function (model, superpopulation = FALSE, collapse = TRUE){

  output = list()

  if (!superpopulation){
    fixefs_finite = brms::fixef(model, summary = FALSE)
    fixefs_finite = brms::posterior_summary (abs(fixefs_finite))

    if (model$family$family == "gaussian" | model$family$family == "student"){
      sigma_finite = stats::residuals (model, summary = FALSE)
      sigma_finite = apply (sigma_finite, 1, bmmb::rms)
      sigma_finite = brms::posterior_summary (sigma_finite)
      rownames(sigma_finite)[1] = "sigma"
      fixefs_finite = rbind(sigma_finite, fixefs_finite)
    }
    res = brms::ranef (model, summary = FALSE)
    res_summary = list()
    for (i in 1:length(res)){
      tmp = res[[i]]
      if (dim(tmp)[3]>1) tmp = apply (tmp[,,],c(1,3),bmmb::rms)
      else tmp = apply (tmp[,,],1,bmmb::rms)
      tmp = brms::posterior_summary (tmp)
      if (nrow (tmp)==1) rownames(tmp)[1] = "Intercept"
      res_summary[[i]] = tmp
      rownames(res_summary[[i]]) =
        paste0 (rownames(res_summary[[i]]), ":", names(res)[i])

    }
    names (res_summary) = names (res)

    output[[1]] = fixefs_finite
    for (i in 1:length (res_summary))  output[[i+1]] = res_summary[[i]]
    names(output) = c("fixefs", names (res_summary))
  }
  if (superpopulation){
    fixefs_finite = brms::fixef(model, summary = FALSE)
    fixefs_finite = brms::posterior_summary (abs(fixefs_finite))

    gaussian = (model$family$family == "gaussian" | model$family$family == "student")
    if (gaussian){
      sigma_super = brms::VarCorr(model)$residual$sd
      rownames(sigma_super)[1] = "sigma"
      fixefs_finite = rbind(sigma_super, fixefs_finite)
    }

    res = brms::VarCorr(model)
    res_summary = list()
    for (i in 1:(length(res)-gaussian)){
      res_summary[[i]] = res[[i]][["sd"]]
      rownames(res_summary[[i]]) =
        paste0 (rownames(res_summary[[i]]), ":", names(res)[i])
    }
    names (res_summary) = names (res)[1:(length(res)-gaussian)]

    output[[1]] = fixefs_finite
    for (i in 1:length (res_summary))  output[[i+1]] = res_summary[[i]]
    names(output) = c("fixefs", names (res_summary))
  }
  if (collapse){
    label = rep (names (output), sapply (output, nrow))
    output = data.frame (do.call (rbind, output))
    output$cluster = label

    use = which(rownames(output)=="sigma")
    if (length(use)>0) output$cluster[use] = "sigma"
  }

  return (output)
}

