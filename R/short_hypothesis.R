
#' Short hypothesis printout
#'
#' Shorter brms hypothesis print statement.
#'
#' @param x brms hypothesis object.
#' @param ... --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

short_hypothesis = function (x, ...){
  tmp =brms::hypothesis (x, ...)
  output = brms::posterior_summary  (tmp$samples)
  output = data.frame (output)
  #attr(output,"hypothesis") = tmp[[1]]$Hypothesis
  output$hypothesis = tmp[[1]]$Hypothesis

  #if (!is.null(tmp[[1]]$Group)) attr(output,"group") = tmp[[1]]$Group
  if (!is.null(tmp[[1]]$Group)) output$group = tmp[[1]]$Group

  attr(output,"samples") = tmp[[2]]

  #output = list()
  #output[[1]] = brms::posterior_summary  (tmp$samples)
  #output = data.frame (output)
  #output$hypotheses = tmp[[1]][[1]]
  #output$samples = tmp[[2]]

  #class(output) = "short_hypothesis"

  return (output)
}


