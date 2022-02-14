
#' Convert probability to logit
#'
#' --
#'
#' @param z --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

ztop = function (z) 1 / (1 + exp (-z) )


#' Convert logit to probability
#'
#' --
#'
#' @param p --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

ptoz = function (p){
  p[p==1] = .99  # if p=1, change to 0.99
  p[p==0] = .01  # if p=0, change to 0.01 (i.e. 1-0.99)
  log (p) - log(1-p)
}