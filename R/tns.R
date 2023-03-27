
#' Distribution function for non-standardized t distribution
#'
#' @param x vector of probabilities.
#' @param m distribution mean.
#' @param s distribution scale.
#' @param df degrees of freedom.
#' @export


ptns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::pt (x,df)
}

#' Density function for non-standardized t distribution
#'
#' @param x vector of quantiles.
#' @param m distribution mean.
#' @param s distribution scale.
#' @param df degrees of freedom.
#' @export

dtns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::dt (x,df)
}

#' Quantile function for non-standardized t distribution
#'
#' @param x vector of quantiles.
#' @param m distribution mean.
#' @param s distribution scale.
#' @param df degrees of freedom.
#' @export

qtns = function (x,m=0,s=1,df){
  x = x - m
  x = x / s
  stats::qt (x,df)
}

#' Random generation of non-standardized t distributed numbers
#'
#' @param n number of observations
#' @param m distribution mean.
#' @param s distribution scale.
#' @param df degrees of freedom.
#' @export

rtns = function (n,m=0,s=1,df){
  x = stats::rt (n,df)
  x = x * s
  x = x + m
  x
}

#' Random generation of Bernoulli variable
#'
#' @param n number of observations.
#' @param p probability of a success.
#' @export


rbernoulli = function (n,p) stats::rbinom(n,1,p)
