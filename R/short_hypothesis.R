
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
  output = list()
  output[[1]] = brms::posterior_summary  (tmp$samples)
  #output = data.frame (output)
  output$hypotheses = tmp[[1]][[1]]
  output$samples = tmp[[2]]

  class(output) = "short_hypothesis"

  return (output)
}

#' @export
print.short_hypothesis = function (x, ...){
  print (x[[1]])
}


