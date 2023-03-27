
#' Format table output for copying into a paper
#'
#' @param x --.
#' @param digits --.
#' @export
#' @examples
#' \dontrun{
#' model_height_vtl = brms::get_model("11_model_height_vtl_f0")
#' fixed_effects = fixef (model_height_vtl)
#' forpaper (fixed_effects)
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


#' @rdname forpaper
#' @export
for_paper <- forpaper
