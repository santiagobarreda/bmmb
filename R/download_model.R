
#' Download pre-fit models
#'
#' Models are downloaded from the book GitHub page.
#'
#' @param model_name the file name to download. Each file is named like this "chapterNumber_modelName".
#' @return the pre-fit brm model, loaded from an RDS file downloaded form GitHub.
#' @export
#' @examples
#' \dontrun{
#' get_model ("3_model.RDS")
#' }
#'

get_model = function (model_name){
  base_url = "https://raw.githubusercontent.com/santiagobarreda/bmmrp/master/models/"
  url = paste0 (base_url, model_name)
  model_RDS = readRDS (url(url))
  model_RDS
}
