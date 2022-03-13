
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


#' Count words in Rmd file excluding code chunks.
#'
#' --
#'
#' @param folder --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

wordcounts = function (folder = getwd()){

  files = list.files(folder, pattern = "*.Rmd")
  words_words_total = 0
  words_total = 0

  for (i in 1:length(files)){
    rmd = readLines (files[i])
    words = unlist (strsplit (rmd, " "))

    spots = grep ("```", words)
    words_words = words

    while (length(spots)>0){
      spots = grep ("```", words_words)
      if (length(spots)>0)
        words_words = c(words_words[-(spots[1]:spots[2])])
      #length(codes)
    }
    words_total = words_total + length(words)
    words_words_total = words_words_total + length(words_words)
  }

  cat ("Total word count is: ",words_total,"\n")
  cat ("Word count without code chunks is: ",words_words_total,"\n")
}

