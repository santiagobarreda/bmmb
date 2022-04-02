
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
  call = as.list( sys.call() )
  tmp =brms::hypothesis (x, ...)
  output = brms::posterior_summary  (tmp$samples)
  output = data.frame (output)
  attr(output,"hypothesis") = tmp[[1]][[1]]
  attr(output,"samples") = tmp[[2]]

  #output = list()
  #output[[1]] = brms::posterior_summary  (tmp$samples)
  #output = data.frame (output)
  #output$hypotheses = tmp[[1]][[1]]
  #output$samples = tmp[[2]]

  #class(output) = "short_hypothesis"

  return (output)
}


