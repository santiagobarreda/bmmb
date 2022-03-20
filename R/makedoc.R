
#' Make word document
#'
#' --
#'
#' @param file --.
#' @param output_format --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


makedoc = function (file, output_format = "bookdown::word_document2"){

  tmp = readLines (file)
  spots = which (tmp=="$$")
  if (length (spots) > 0) tmp = tmp[-spots]

  writeLines (tmp, paste0 ('../make/', file))
  #bmmb::copyrmd ()
  xfun::in_dir ('../make', bookdown::preview_chapter (paste0 ('../make/', file), output_format = output_format))
}
