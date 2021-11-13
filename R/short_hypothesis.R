
#' Short hypothesis printout
#'
#' Shorter brms hypothesis print statement. 
#'
#' @param hypothesis brms hypothesis object.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

short_hypothesis = function (hypothesis){
  cbind (Hypothesis=hypothesis[[1]][,1], round (hypothesis[[1]][,2:5],2))
}

