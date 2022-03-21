

#' Get comments
#'
#' --

#' @param file --.
#' @param context --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


getcomments = function (file, context = TRUE){
  text = readLines (file)
  spots = grep("@@", text)
  comments = text[spots]

  if (!context){
    for (i in 1:length (comments)){
      spot = gregexpr ("@@", comments[i])[[1]]
      tmp = strsplit (comments[i], "")[[1]]

      open = which(tmp=="[")
      close = which(tmp=="]")
      open = open[which.min(open - spot)]
      close = close[which.min(close - spot)]

      comments[i] = paste0 (tmp[open:close], collapse="")
    }
  }
  paste(spots, comments, sep = "-")
}
