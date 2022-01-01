

#' Divide factors
#'
#' --
#'
#' @param model --.
#' @param formula --.
#' @export
#' @examples
#' \dontrun{
#' --
#' }
#'
#'


divide_factors = function (model, formula = NULL){

  fe = brms::fixef (model, summary = FALSE)

  if (is.null(formula))
    formula = formula (strsplit (deparse(model$formula$formula), split=" \\+ \\(")[[1]][[1]])

  mod = stats::model.matrix (formula, data = model$data)

  terms = attr(terms(formula), "term.labels")
  intercept = attr(terms(formula), "intercept")
  if (intercept) terms = c("(Intercept)",terms)

  num = attr (mod, "assign") + intercept

  factors = list()
  for (i in 1:max(num)){
    factors[[i]] = fe[,num==i]
    names(factors)[i] = terms[i]
  }
  return (factors)
}

