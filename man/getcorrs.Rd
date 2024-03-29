% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_corrs.R
\name{getcorrs}
\alias{getcorrs}
\alias{get_corrs}
\title{Get random effect correlations}
\usage{
getcorrs(model, factor)

get_corrs(model, factor)
}
\arguments{
\item{model}{The brms model.}

\item{factor}{The factor you want correlations for.}
}
\description{
Gets summaries of random effects correlations from a brms model.
}
\examples{
\dontrun{
model_height_vtl = bmmb::get_model("11_model_height_vtl_f0")

# Correlations between listener (L) random effects
bmmb::get_corrs (model_height_vtl, "L")
}


}
