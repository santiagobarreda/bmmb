
#' Short summary printout
#'
#' Presents a 'lite' version of the usual brms model print statement. This was needed to minimize redundant information in the book.
#'
#' @param model the brms model.
#' @param omit_conv_stats if TRUE, parameter convergence statistics are omitted.
#' @param omit_corrs if TRUE, random effects correlations are omitted.
#' @param digits the number of digits to be presented.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#'
#' # compare reduced and usual print statements
#' model_height_vtl
#' bmmb::short_summary (model_height_vtl, omit_corrs = TRUE)
#' }

short_summary = function (model, omit_conv_stats = TRUE, omit_corrs = FALSE, digits = 2){

  if (inherits(model, "brmssummary"))
    stop("Wrong object type passed.")
  if (inherits(model, "brmsfit"))
    model = summary(model)
  cat ("Formula: ", as.character(model$formula)[1])
  if (length(model$ngrps) > 0) {
    cat("\n\nGroup-Level Effects:")
    for (i in 1:length(model$ngrps)) {
      cat("\n~", names(model$ngrps)[i], " (Number of levels: ",
          model$ngrps[[i]], ")", "\n", sep = "")
      if (omit_conv_stats)
        tmp = round(model$random[[i]][, 1:4], digits)
      if (!omit_conv_stats)
        tmp = round(model$random[[i]], digits)
      use = 1:nrow(tmp)
      if (omit_corrs)
        use = !(substr(rownames(tmp), 1, 3) == "cor")
      print(tmp[use, ])
    }
  }
    cat("\nPopulation-Level Effects:\n")
    if (omit_conv_stats) print(round(model$fixed[, 1:4], digits))
    if (!omit_conv_stats) print(round(model$fixed, digits))

    if (nrow(model$spec_pars) > 0){
      cat("\nFamily Specific Parameters:\n")
      if (omit_conv_stats) print(round(model$spec_pars[, 1:4], digits))
      if (!omit_conv_stats) print(round(model$spec_pars, digits))
    }
}

