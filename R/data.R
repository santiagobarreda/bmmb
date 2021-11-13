

#' Colors for plotting
#'
#' A vector of RGB values for colors used for making the plots in the book: light pink,lavender, coral, yellow, deep green, teal, sky blue, maroon, deep purple, dark orange.

"cols"


#' H95
#'
#' An example of aggregated data as provided by Fast Track (in an 'aggregated_data.csv' file). The data is productions of 12 vowels by 7 adult males from the Hillenbrand et al. (1995) data. The formant columns are so that column FXY represents the frequency for the Xth formant, for the Yth time slice.
#'
#' @section Columns:
#' \describe{
#' \item{file}{the recording file name.}
#' \item{f0}{average f0 in Hertz.}
#' \item{duration}{vowel duration in milliseconds.}
#' \item{label}{The label used for plotting the vowel.}
#' \item{group}{A group number, used for plotting}
#' \item{color}{The color Praat will use for plotting.}
#' \item{number}{The file number.}
#' \item{f11}{The average frequency for the first formant, for the first time slice.}
#' \item{f21}{The average frequency for the second formant, for the first time slice.}
#' \item{...}{And so on.}
#' }
#' @source \url{https://github.com/santiagobarreda/FastTrackR}
#' @references Hillenbrand, J.M., Getty, L.A., Clark, M.J., and Wheeler, K. (1995). "Acoustic characteristics of American English vowels," Journal of the Acoustical Society of America, 97, 3099-3111.

"h95"

