
#' Make word document
#'
#' --
#'
#' @param file --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


makedoc = function (file){
  tmp = readLines (file)
  spots = which (tmp=="$$")
  tmp = tmp[-spots]

  writeLines (tmp, 'tmp.Rmd')
  bookdown::preview_chapter ('tmp.Rmd', "bookdown::word_document2",
                             output_dir = ".")
  file.remove ('tmp.Rmd')
}

