
#' Convert logit to probability
#'
#' --
#'
#' @rdname antilogit
#' @param z --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'

antilogit = function (z) 1 / (1 + exp (-z) )


#' @rdname antilogit
#' @rdname getsds
#' @export
ztop <- antilogit


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
