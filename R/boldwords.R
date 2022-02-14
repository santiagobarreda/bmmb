
#' Find words in bold
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

boldwords = function (file){
  rmd = readLines(file)
  words = unlist(strsplit(rmd, " "))
  spots = grepl("\\*\\*", words)
  words = words[spots]

  asterisks = sapply (gregexpr("\\*", words), length)

  words = gsub ("\\*","",words)
  words = gsub ("\\.","",words)
  words = gsub ("\\,","",words)
  words = gsub ("\\)","",words)
  words = gsub ("\\(","",words)

  output = NULL
  count = 1

  while ( count < length(asterisks)){

    if (asterisks[count] == 4){
      output = c(output, words[count])
      count = count + 1
    }
    if (asterisks[count] == 2){
      output = c(output, paste(words[count],words[count+1]))
      count = count + 2
    }
  }
  output
}
