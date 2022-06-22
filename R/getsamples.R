

#' Plot posterior samples in a data frame#'
#' --
#'
#' @rdname getsamples
#' @param model --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'

getsamples = function (model){
  output = data.frame (brms::as_draws_matrix(model))
  return (output)
}


#' @rdname getsamples
#' @export
get_samples <- getsamples

