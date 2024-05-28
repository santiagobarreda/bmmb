

#' Find intersection of lines or planes
#' --
#'
#' @param coeffs1 --.
#' @param coeffs2 --.
#' @param z --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }
#'
#'


find_intersection = function (coeffs1, coeffs2, z = 0){

  # y = (-bx + ex - a + d + z) / (c-f)
  # y =(- a + d + z) / (c-f) + (-bx + ex)/ (c-f)
  # intercept =(- a + d + z) / (c-f)
  # slope = (-bx + ex)/ (c-f)

  if (length(coeffs1) == 3 & length(coeffs1) == 3){
    intercept =(- coeffs1[1] + coeffs2[1] + z) / (coeffs1[3]-coeffs2[3])
    slope = (-coeffs1[2] + coeffs2[2]) / (coeffs1[3]-coeffs2[3])
    return (c(intercept=intercept, slope=slope))
  }
  if (length(coeffs1) == 2 & length(coeffs1) == 2){
    intercept =(- coeffs1[1] + coeffs2[1] + z) / (coeffs1[2]-coeffs2[2])
    return (intercept=intercept)
  }
}
