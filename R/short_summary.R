
#' Short summary printout
#'
#' Shorter brms model print statement.
#'
#' @param hypothesis brms model object.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

short_summary = function (model){
  text = capture.output (model)
  formula = grep ("Formula", text)
  start = grep ("Group-Level Effects", text)
  end = grep ("Samples were drawn", text)-2

  output = text[start:end]
  output = paste0(output,"\n")

  #text = c("\n",text[formula],"\n\n",output,"\n")
  text = c(text[formula],"\n\n",output)
  cat (text)
}
