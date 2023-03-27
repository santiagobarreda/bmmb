
#' Summarize priors in brms models
#
#' Information about priors from an existing brms model. This just calls brms::prior_summary but changes the output of the formatting slightly to allow for columns to be imitted from the output. Please see the help file for brms::prior_summary for more information.
#'
#' @param model The brms model.
#'
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#' bmmb::prior_summary (model_height_vtl)
#' }
#'
#'


prior_summary = function (model){

  output = (model$prior)

  nrows = nrow(output)
  if (nrows > 1)
    for (i in 2:nrow(output)){
      if (output[i,1] == "")
        output[i,1] = output[i-1,1]
    }
  return (output)
}
