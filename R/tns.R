
#' Distribution function for non-standardized t distribution
#'
#' @param x --.
#' @param m --.
#' @param s --.
#' @param df --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

ptns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::pt (x,df)
}

#' Density function for non-standardized t distribution
#'
#' @param x --.
#' @param m --.
#' @param s --.
#' @param df --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

dtns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::dt (x,df)
}

#' Quantile function for non-standardized t distribution
#'
#' @param x --.
#' @param m --.
#' @param s --.
#' @param df --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

qtns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::qt (x,df)
}

#' Random generation of non-standardized t distributed numbers
#'
#' @param n --.
#' @param m --.
#' @param s --.
#' @param df --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }

rtns = function (n,m=0,s=1,df){
  x = stats::rt (n,df)
  x = x * s
  x = x + m
  x
}

#' Random generation of Bernoulli variable
#'
#' @param n --.
#' @param p --.
#' @export
#' @examples
#' \dontrun{
#'  # coming soon
#' }


rbernoulli = function (n,p) stats::rbinom(n,1,p)
