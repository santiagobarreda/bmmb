
#' update model
#'
#' --
#'
#' @param predictions --.
#' @param n_samples --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


updatemodel = function (model, chapter = 0){

  p1 = "F:\\storage\\OneDrive - University of California"
  p2 = ", Davis\\GitHub\\BMMRP\\models\\"

  model = readRDS ("F:\\storage\\OneDrive - University of California, Davis\\GitHub\\BMMRP\\models\\4_multilevel_L_S.RDS")


  model = brms::add_criterion(model, "loo")

  files = list.files (pattern="Rmd")
  file.copy (files, paste0("../make/",files), overwrite = TRUE)
}


model = readRDS ("F:\\storage\\OneDrive - University of California, Davis\\GitHub\\BMMRP\\models\\4_multilevel_L_S.RDS")

