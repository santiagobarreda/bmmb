
#' Summarize priors in brms models
#' --
#'
#' @param model --.#'
#' @param all --.

#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


prior_summary = function (model, all = TRUE){

  output = (model$prior)

  nrows = nrow(output)
  if (nrows > 1)
    for (i in 2:nrow(output)){
      if (output[i,1] == "")
        output[i,1] = output[i-1,1]
    }
  return (output)
}
