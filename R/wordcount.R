
#' Count words in Rmd file excluding code chunks.
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

wordcount = function (file){

  rmd = readLines (file)
  words = unlist (strsplit (rmd, " "))

  spots = grep ("```", words)
  words_words = words

  while (length(spots)>0){
    spots = grep ("```", words_words)
    if (length(spots)>0)
      words_words = c(words_words[-(spots[1]:spots[2])])
    #length(codes)
  }

  # spots = grep ("[$][$]", words)
  # words_words = words
  #
  # while (length(spots)>0){
  #   spots = grep ("[$][$]", words_words)
  #   if (length(spots)>0)
  #     words_words = c(words_words[-(spots[1]:spots[2])])
  #   #length(codes)
  # }

  cat ("Total word count is: ",length(words),"\n")
  cat ("Word count without code chunks is: ",length(words_words),"\n")
}

