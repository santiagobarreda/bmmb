
#' Short summary printout
#'
#' Shorter brms model print statement.
#'
#' @param model --.
#' @param omit_conv_stats --.
#' @param omit_corrs --.
#' @param digits --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

short_summary = function (model, omit_conv_stats = TRUE, omit_corrs = FALSE, digits = 2){

  if (class(model) == "brmsfit")
    model = summary(model)
  if (class(model) != "brmssummary")
    stop("Wrong object type passed.")

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
  cat("\nFamily Specific Parameters:\n")
  if (omit_conv_stats) print(round(model$spec_pars[, 1:4], digits))
  if (!omit_conv_stats) print(round(model$spec_pars, digits))
}

