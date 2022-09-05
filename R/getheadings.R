


#' Get rmd file headings
#' --
#'
#' @rdname getheadings
#' @param file --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'


getheadings = function (file){

  tmp = readLines (file)
  headings = NULL

  for (i in 1:length(tmp)){

    first = substr(tmp[i],1,1)
    last = substr(tmp[i],nchar(tmp[i]),nchar(tmp[i]))

    if (first=="#" & last == "}") headings = c(headings, tmp[i])
  }
  headings
}




