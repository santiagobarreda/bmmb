

#' Colors for plotting
#'
#' A vector of RGB values for colors used for making the plots in the book: light pink,lavender, coral, yellow, deep green, teal, sky blue, maroon, deep purple, dark orange.

"cols"


#' The Hillenbrand et al. (1995) data
#'
#' Data from: Hillenbrand, J., Getty, L. A., Clark, M. J., & Wheeler, K. (1995). Acoustic characteristics of American English vowels. The Journal of the Acoustical society of America, 97(5), 3099-3111.
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
#' @references Hillenbrand, J.M., Getty, L.A., Clark, M.J., and Wheeler, K. (1995). "Acoustic characteristics of American English vowels," Journal of the Acoustical Society of America, 97, 3099-3111.

"h95"


#' Data from a listening experiment.
#'
#' The data from the listening experiment analyzed in "Bayesian multilevel models for repeated-measures data".
#'
#' @section Columns:
#' \describe{
#' \item{L}{An integer from 1-15 indicating which listener responded to the trial.}
#' \item{C}{A letter representing the apparent speaker category (b=boy, g=girl, m=man, w=woman) reported by the listener for each trial.}
#' \item{height}{A floating-point number representing the height (in centimeters) reported for the speaker on each trial.}
#' \item{R}{A letter representing the resonance scaling for the stimulus on each trial. The coding is a (actual) for the unmodified resonance and b (big) for the modified resonance (intended to sound bigger)}
#' \item{S}{An integer from 1-139 indicating which speaker produced the trial stimulus.}
#' \item{C_v}{A letter representing the veridical (actual) speaker category (b=boy, g=girl, m=man, w=woman) for each trial.}
#' \item{vtl}{An estimate of the speaker’s vocal-tract length in centimeters.}
#' \item{f0}{The vowel fundamental frequency (f0) measured in Hertz.}
#' \item{dur}{The duration of the vowel sound, in milliseconds.}
#' \item{G}{The apparent gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A}{The apparent age of the speaker indicated by the listener, a (adult) or c (child).}
#' \item{G_v}{The veridical gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A_v}{The veridical age of the speaker indicated by the listener, a (adult) or c (child).}
#' }

"exp_data_all"

#' Data from a listening experiment.
#'
#' The data from the listening experiment analyzed in "Bayesian multilevel models for repeated-measures data". Only the data from the 'actual' Resonance level. This data is analyzed in the book.
#'
#' @section Columns:
#' \describe{
#' \item{L}{An integer from 1-15 indicating which listener responded to the trial.}
#' \item{C}{A letter representing the apparent speaker category (b=boy, g=girl, m=man, w=woman) reported by the listener for each trial.}
#' \item{height}{A floating-point number representing the height (in centimeters) reported for the speaker on each trial.}
#' \item{R}{A letter representing the resonance scaling for the stimulus on each trial. The coding is a (actual) for the unmodified resonance and b (big) for the modified resonance (intended to sound bigger)}
#' \item{S}{An integer from 1-139 indicating which speaker produced the trial stimulus.}
#' \item{C_v}{A letter representing the veridical (actual) speaker category (b=boy, g=girl, m=man, w=woman) for each trial.}
#' \item{vtl}{An estimate of the speaker’s vocal-tract length in centimeters.}
#' \item{f0}{The vowel fundamental frequency (f0) measured in Hertz.}
#' \item{dur}{The duration of the vowel sound, in milliseconds.}
#' \item{G}{The apparent gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A}{The apparent age of the speaker indicated by the listener, a (adult) or c (child).}
#' \item{G_v}{The veridical gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A_v}{The veridical age of the speaker indicated by the listener, a (adult) or c (child).}
#' }

"exp_data"

#' Data from a listening experiment.
#'
#' The data from the listening experiment analyzed in "Bayesian multilevel models for repeated-measures data". Only the data from the 'big' Resonance level. This data is reserved for the exercises.
#'
#' @section Columns:
#' \describe{
#' \item{L}{An integer from 1-15 indicating which listener responded to the trial.}
#' \item{C}{A letter representing the apparent speaker category (b=boy, g=girl, m=man, w=woman) reported by the listener for each trial.}
#' \item{height}{A floating-point number representing the height (in centimeters) reported for the speaker on each trial.}
#' \item{R}{A letter representing the resonance scaling for the stimulus on each trial. The coding is a (actual) for the unmodified resonance and b (big) for the modified resonance (intended to sound bigger)}
#' \item{S}{An integer from 1-139 indicating which speaker produced the trial stimulus.}
#' \item{C_v}{A letter representing the veridical (actual) speaker category (b=boy, g=girl, m=man, w=woman) for each trial.}
#' \item{vtl}{An estimate of the speaker’s vocal-tract length in centimeters.}
#' \item{f0}{The vowel fundamental frequency (f0) measured in Hertz.}
#' \item{dur}{The duration of the vowel sound, in milliseconds.}
#' \item{G}{The apparent gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A}{The apparent age of the speaker indicated by the listener, a (adult) or c (child).}
#' \item{G_v}{The veridical gender of the speaker indicated by the listener, f (female) or m (male).}
#' \item{A_v}{The veridical age of the speaker indicated by the listener, a (adult) or c (child).}
#' }
#'

"exp_ex"


#' Height data
#'
#' Data regarding the heights of males and females of different ages. From: Fryar, C. D., Gu, Q., & Ogden, C. L. (2012). Anthropometric reference data for children and adults: United States, 2007-2010. Vital and Health Statistics. Series 11, Data from the National Health Survey, 252, 1–48.
#'
#' @section Columns:
#' \describe{
#' \item{age}{The agre group, in years.}
#' \item{gender}{The group gender, male or female}
#' \item{height}{Height, in centimeters}
#' \item{sesm}{The standard error of the sample mean.}
#' \item{sd}{The standard deviation, calculated using the sesm and sample size}
#' \item{sample}{The size of the sample for each agre and gender group.}
#' }

"height_data"

#' Lee et al. data
#'
#' Data regarding the average acoustic characteristics of speech of children of different ages. From: Lee, S., Potamianos, A., & Narayanan, S. (1999). Acoustics of children’s speech: Developmental changes of temporal and spectral parameters. The Journal of the Acoustical Society of America, 105(3), 1455–1468.
#'
#'@section Columns:
#' \describe{
#' \item{vowel}{The vowel category}
#' \item{f0}{Average f0 for that vowel, for that age and gender group.}
#' \item{f0sd}{Standard deviation of f0 for that vowel, for that age and gender group.}
#' \item{f1}{Average f1 for that vowel, for that age and gender group.}
#' \item{f1sd}{Standard deviation of f1 for that vowel, for that age and gender group.}
#' \item{f2}{Average f2 for that vowel, for that age and gender group.}
#' \item{f2sd}{Standard deviation of f2 for that vowel, for that age and gender group.}
#' \item{f3}{Average f3 for that vowel, for that age and gender group.}
#' \item{f3sd}{Standard deviation of f3 for that vowel, for that age and gender group.}
#' \item{age}{The age of the speaker group, in year.}
#' \item{gender}{The gender of the speaker group, male or female}
#' }

"lee_etal_data"


#' Colors for book plots
#'
#' Colors used in book figures.

"lightpink"

#' Colors for book plots
#'
#' Colors used in book figures.

"lavender"

#' Colors for book plots
#'
#' Colors used in book figures.

"coral"

#' Colors for book plots
#'
#' Colors used in book figures.

"yellow"

#' Colors for book plots
#'
#' Colors used in book figures.

"deepgreen"

#' Colors for book plots
#'
#' Colors used in book figures.

"teal"

#' Colors for book plots
#'
#' Colors used in book figures.

"skyblue"

#' Colors for book plots
#'
#' Colors used in book figures.

"maroon"

#' Colors for book plots
#'
#' Colors used in book figures.

"deeppurple"


#' Colors for book plots
#'
#' Colors used in book figures.

"darkorange"


#' Colors for book plots
#'
#' Colors used in book figures.

"olive"


#' Colors for book plots
#'
#' Colors used in book figures.

"lightbrown"


#' Colors for book plots
#'
#' Colors used in book figures.

"red"


#' Colors for book plots
#'
#' Colors used in book figures.

"beige"


#' Colors for book plots
#'
#' Colors used in book figures.

"grey"


# cols = c(lightpink,coral,yellow,deepgreen,teal,maroon,skyblue,deeppurple,darkorange,olive,lightbrown,red,beige,lavender,grey)

