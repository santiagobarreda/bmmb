
#' Copy rmd files
#'
#' --
#'
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

copyrmd = function (){

  files = list.files (pattern="Rmd")
  file.copy (files, paste0("../make/",files), overwrite = TRUE)
}
