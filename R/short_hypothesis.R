
#' Short hypothesis printout
#'
#' Shorter brms hypothesis print statement.
#'
#' @param model brms hypothesis object.
#' @param ... bla bla.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

short_hypothesis = function (model,...){
  call = as.list( sys.call() )
  tmp = do.call (brms::hypothesis, call[-1])
  output = brms::posterior_summary  (tmp$samples)
  output = data.frame (output)
  attr(output,"hypothesis") = tmp[[1]][[1]]
  attr(output,"samples") = tmp[[2]]
  return (output)
}

