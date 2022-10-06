
#' Convert logit to probability
#'
#' --
#'
#' @rdname inverse_logit
#' @param z --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

inverse_logit = function (z) 1 / (1 + exp (-z) )


#' @rdname inverse_logit
#' @export
ztop <- inverse_logit


#' Convert probability to logit
#'
#' --
#'
#' @rdname logit
#' @param p --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

logit = function (p){
  p[p==1] = .99  # if p=1, change to 0.99
  p[p==0] = .01  # if p=0, change to 0.01 (i.e. 1-0.99)
  log (p) - log(1-p)
}


#' @rdname logit
#' @export
ptoz <- logit
