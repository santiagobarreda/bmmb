
#' Get priors in brms models
#' --
#'
#' @param formula --.'
#' @param data --.
#' @param family --.
#' @param ... --.

#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


get_prior = function (formula, data, family = gaussian(), ...){

  output = brms::get_prior (formula=formula,data=data,family=family,...)

  nrows = nrow(output)
  if (nrows > 1)
    for (i in 2:nrow(output)){
      if (output[i,1] == "")
        output[i,1] = output[i-1,1]
    }
  return (output)
}
