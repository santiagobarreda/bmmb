
#' Make word book
#'
#' --

#' @param folder --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

makebook = function (folder = "./"){

  rmds = list.files (folder, pattern = ".Rmd")
  n = length(rmds)

  for (i in 1:n){
    tmp = readLines (rmds[i])
    spots = which (tmp=="$$")
    if (length(spots)>0) tmp = tmp[-spots]
    if (i==n) writeLines (tmp, '../book/index.Rmd')
    if (i!=n) writeLines (tmp, paste0('../book/0',i,'.Rmd'))
  }

  bookdown::render_book ('../book', "bookdown::word_document2", output_dir = ".")

}
