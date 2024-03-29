% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/banova.R
\name{banova}
\alias{banova}
\title{Bayesian ANOVA}
\usage{
banova(model, superpopulation = FALSE, collapse = TRUE)
}
\arguments{
\item{model}{Your model object.}

\item{superpopulation}{Set to TRUE if you want the superpopulation standard deviation. If FALSE, the finite population standard deviation is calculated.}

\item{collapse}{If TRUE, returns a single dataframe. If FALSE, returns a list of dataframes.}
}
\description{
Function to carry out a simplified Bayesian Analysis of Variance (BANOVA).
}
\examples{
\dontrun{
model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")
options (contrasts = c('contr.sum','contr.sum'))
bmmb::banova (model_height_vtl)
}


}
