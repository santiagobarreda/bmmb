
#' Make output pastable into paper
#'
#' --
#'
#' @param x --.
#' @param digits --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


forpaper = function (x, digits = 2){
  output = NULL
  for (i in 1:nrow(x)){
    output = c(output,
               paste0("(mean = ", round(x[i,1],digits),
                      ", s.d. = ", round(x[i,2],digits),
                      ", 95% C.I = [", round(x[i,3],digits),
                      ", ", round(x[i,4],digits), "])"))
  }
  noquote(output)
}
