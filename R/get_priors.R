
#' Get priors in brms models
#'
#' Information about priors which may be set for a brms model. This just calls brms::get_prior but changes the output of the formatting slightly to allow for columns to be imitted from the output. Please see the help file for brms::get_prior for more information.
#'
#' @param formula A description of the model to be fit.'
#' @param data The data to be used by the model.
#' @param family Information about the response distribution and/or link function.
#' @param ... additional arguments are passed to brms::get_prior.
#' @export
#' @examples
#' \dontrun{
#' brms::get_prior (brms::bf(height ~ A*G + (A*G|L) + (1|S),
#'                           sigma ~ A),
#'                  data = exp_data, family="student")
#' }
#'

get_prior = function (formula, data, family = 'gaussian', ...){

  output = brms::get_prior (formula=formula,data=data,family=family,...)

  nrows = nrow(output)
  if (nrows > 1)
    for (i in 2:nrow(output)){
      if (output[i,1] == "")
        output[i,1] = output[i-1,1]
    }
  return (output)
}


