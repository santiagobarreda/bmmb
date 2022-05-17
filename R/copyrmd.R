
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

  files = list.files ()
  file.copy (files, paste0("../make/",files), overwrite = TRUE)
}
