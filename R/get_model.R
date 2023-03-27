
#' Download pre-fit models
#'
#' Download models for the book "Bayesian Multilevel Models for Repeated Measures Data" from the book GitHub page: https://github.com/santiagobarreda/bmmrmd/.
#'
#' @param model_name the file name to download. Models are named like this "chapterNumber_modelName.RDS", based on their name in the book.
#' @return Returns the pre-fit brms model, loaded from an RDS file downloaded form GitHub.
#' @export
#' @examples
#' \dontrun{
#' # Get the first model from chapter 3 like this:
#' get_model ("3_model.RDS")
#'
#' # And the multinomial model from chapter 12 like this:
#' get_model ("12_model_multinomial.RDS")
#' }
#'

get_model = function (model_name){
  base_url = "https://raw.githubusercontent.com/santiagobarreda/bmmrmd/master/models/"
  url = paste0 (base_url, model_name)
  model_RDS = readRDS (url(url))
  model_RDS
}
