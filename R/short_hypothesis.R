
#' Short hypothesis printout
#'
#' This is just a clone of brms::hypothesis with a smaller print statement, needed to get output to fit in the width of a book page. Please see the help file for brms::hypothesis for more information.
#'
#' @param x the brms model.
#' @param ... additional arguments passed to brms::hypothesis.
#' @export
#'
#'

short_hypothesis = function (x, ...){
  tmp =brms::hypothesis (x, ...)
  output = brms::posterior_summary  (tmp$samples)
  output = data.frame (output)
  #attr(output,"hypothesis") = tmp[[1]]$Hypothesis
  output$hypothesis = tmp[[1]]$Hypothesis

  #if (!is.null(tmp[[1]]$Group)) attr(output,"group") = tmp[[1]]$Group
  if (!is.null(tmp[[1]]$Group)) output$group = tmp[[1]]$Group

  attr(output,"samples") = tmp[[2]]

  return (output)
}


