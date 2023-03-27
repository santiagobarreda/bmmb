
#' Convert logits to probabilities
#'
#' @rdname inverse_logit
#' @param z a scalar logit value, or a vector of scalars.
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
#' @rdname logit
#' @param p a probability, or a vector of probabilities.
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
