
#' Make word book
#'
#' --

#' @param folder --.
#' @param output_format --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

makebook = function (folder = "./", output_format = "bookdown::word_document2"){

  bmmb::copyrmd ()
  rmds_short = list.files ("../rmd_files", pattern = "*.Rmd")
  rmds = list.files ("../rmd_files", pattern = "*.Rmd", full.names = TRUE)
  n = length(rmds)

  for (i in 1:n){
    tmp = readLines (rmds[i])
    spots = which (tmp=="$$")
    if (length(spots)>0) tmp = tmp[-spots]
    writeLines (tmp, paste0('../make/',rmds_short[i]))
  }
  xfun::in_dir ('../make', bookdown::render_book ("./", output_format = output_format))

}

