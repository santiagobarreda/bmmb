

#' Get posterior samples
#'
#' Gets posterior samples from a brms model, returns these as a dataframe.
#'
#' @rdname getsamples
#' @param model A brms model, or the output of the short_hypothesis function.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
#' samples = bmmb::get_samples (model_height_vtl)
#' samples[1:6,1:10]
#' }
#'

getsamples = function (model){
  samples = attr (model, "samples")
  if (!is.null(samples)) return (samples)

  output = data.frame (brms::as_draws_matrix(model))
  return (output)
}


#' @rdname getsamples
#' @export
get_samples <- getsamples

