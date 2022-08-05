#' @name bland1995
#' @title Repeated measurements of intramural pH and PaCO2
#' @description A dataset containing the repeated measurements of intramural pH
#' and PaCO2 for eight subjects, from Bland & Altman (1995).
#' @docType data
#' @usage bland1995
#' @format A data frame with 47 rows and 3 variables
#' \tabular{lll}{
#' \code{[, 1]} \tab \code{Subject} \tab {Unique identifer} \cr
#' \code{[, 2]} \tab \code{pH}      \tab {Potential of hydrogen, 
#'                                        acidity to base} \cr
#' \code{[, 3]} \tab \code{PaCO2}   \tab {Partial pressure of carbon dioxide}\cr     
#' }
#' @source Bland, J.M., & Altman, D.G. (1995). Calculating correlation
#' coefficients with repeated observations: Part 1 - correlation within
#' subjects. \emph{BMJ, 310}, 446, 
#' \doi{https://doi.org/10.1136/bmj.310.6977.446}
#'
NULL

#' @name gilden2010
#' @title Repeated measurements of reaction time and accuracy
#' @description A dataset containing four repeated measurements of reaction time
#' (RT) and accuracy from eleven subjects in a visual search experiment. Each
#' measurement is the mean RT and accuracy from a block of 288 search trials.
#' blocks of visual search, for eleven subjects.
#' @docType data
#' @usage gilden2010
#' @format A data frame with 44 rows and 4 variables
#' \tabular{lll}{
#' \code{[, 1]} \tab \code{sub}   \tab {Subject ID} \cr
#' \code{[, 2]} \tab \code{block} \tab {Block ID} \cr
#' \code{[, 3]} \tab \code{rt}    \tab {Mean reaction time} \cr
#' \code{[, 4]} \tab \code{acc}   \tab {Mean accuracy} \cr
#' }
#' @source Gilden, D.L., Thornton, T.L., & Marusich, L.R. (2010). The serial
#' process in visual search. \emph{Journal of Experimental Psychology: Human
#' Perception and Performance, 36}, 533-542, 
#' \doi{https://doi.org/10.1037/a0016464}
#'
NULL

#' @name raz2005
#' @title Repeated measurements of age and cerebellar volume
#' @description A dataset containing two repeated measures, on two occasions
#' (\code{Time}), of age and adjusted volume of cerebellar hemispheres from 72
#' participants. Data were captured from Figure 8, Cerebellar Hemispheres
#' (lower right) of Raz et al. (2005).
#' @docType data
#' @usage raz2005
#' @format A data frame with 144 rows and 4 variables
#' \tabular{lll}{
#' \code{[, 1]} \tab \code{Participant} \tab {Participant ID} \cr
#' \code{[, 2]} \tab \code{Time}        \tab {Measurement time} \cr
#' \code{[, 3]} \tab \code{Age}         \tab {Participant's age (years)} \cr
#' \code{[, 4]} \tab \code{Volume}      \tab {Adjusted volume of cerebellar
#'                                            hemispheres (cm^3)} \cr
#' }

#' @source Raz, N., Lindenberger, U., Rodrigue, K.M., Kennedy, K.M., Head, D.,
#' Williamson, A., Dahle, C., Gerstorf, D., & Acker, J.D. (2005). Regional brain
#' changes in aging healthy adults: General trends, individual differences, and
#' modifiers. \emph{Cerebral Cortex, 15}, 1676-1689, 
#' \doi{https://doi.org/10.1093/cercor/bhi044}
#'
NULL

#' @name marusich2016_exp2
#' @title Repeated measurements of dyads performance and subjective situation 
#' awareness
#' @description A dataset containing three repeated measures of dyads (paired  
#' participants) working together to capture High Value Targets (lower task time 
#' is better performance) and their averaged Mission Awareness Rating Scale 
#' (MARS) score for each block, repeated three times. MARS evaluates subjective 
#' situation awareness (”knowing what is going on”), higher values indicate 
#' better situation awareness. 
#' @docType data
#' @usage marusich2016_exp2
#' @format A data frame with 84 rows (28 dyads/pairs) and 4 variables
#' \tabular{lll}{
#' \code{[, 1]} \tab \code{Pair}        \tab {Unique identifer for each dyad} \cr
#' \code{[, 2]} \tab \code{HVT_capture} \tab {Capture time} \cr
#' \code{[, 3]} \tab \code{MARS}        \tab {subjective situation awareness} \cr
#' \code{[, 4]} \tab \code{Source Reliability} \tab {1 = none, 2 = accurate, and
#' 3 = inaccurate} \cr
#' }

#' @source Marusich et al. (2016). Effects of information availability 
#' on command-and-control decision making: performance, trust, and situation 
#' awareness. \emph{Human Factors, 58}(2), 301-321, 
#' \doi{https://doi.org/10.1177/0018720815619515}
#'
NULL

#' @name twedt_dist_measures
#' @title Repeated measures and multivariate measures of perceived distance 
#' @description A dataset of repeated measures of distance perception  
#' at  physical distances of 7, 8, 9, 10, and 11 meters. The data are also 
#' multivariate, with five  dependent measures of distance perception. This is a 
#' 5 (physical distance) x 5 (dependent measure) within-participants design 
#' with a sample size of 46. 
#' Note data is missing for 15 trials due participant and experimenter errors.
#' @docType data
#' @usage twedt_dist_measures
#' @format A data frame with 230 rows and 7 columns
#' \tabular{lll}{
#' \code{[ ,1]} \tab \code{Subject}           \tab Unique identifier for each 
#'                                                  participant \cr \cr\cr
#' \code{[, 2]} \tab \code{Physical Distance} \tab {Physical distance from the 
#'                                                  participant to the target 
#'                                                  cone, in meters} \cr \cr\cr
#' \code{[, 3]} \tab \code{Blindwalk Away}    \tab {Participants put on the 
#'                                                  blindfold after viewing the 
#'                                                  target.} \cr
#'              \tab                          \tab {Next, participants took one step to 
#'                                                  the left and turned 180 degrees to 
#'                                                  face the opposite direction.}\cr
#'              \tab                          \tab {Participants were instructed to walk
#'                                                  forward until they had walked the 
#'                                                  original distance to the target.} \cr\cr\cr
#'                                                                                                                                             
#' \code{[, 4]} \tab \code{Blindwalk Toward}  \tab {Participants put on the 
#'                                                  blindfold after viewing the 
#'                                                  target.} \cr 
#'              \tab                          \tab {Next, participants walked forward until
#'                                                  they thought they had reached the 
#'                                                  target cone.}\cr\cr\cr
#' \code{[, 5]} \tab \code{Triangulated BW}   \tab {Participants put on the 
#'                                                  blindfold after viewing the 
#'                                                  target.} \cr
#'              \tab                          \tab {Next, participants
#'                                                  turned right 90 degrees and walked
#'                                                  forward 5 meters.} \cr
#'              \tab                          \tab {The experimenter told 
#'                                                  participants when to stop walking.} \cr
#'              \tab                          \tab  {Finally, participants turned to face 
#'                                                  toward the target and walked 
#'                                                  forward two steps.} \cr\cr\cr
#' \code{[, 6]} \tab \code{Verbal}            \tab {Participants stated the distance 
#'                                                  between the target cone and themselves, 
#'                                                  in feet and inches} \cr\cr\cr
#' \code{[, 7]} \tab \code{Visual Matching}   \tab {An experimenter stood next to
#'                                                  the target cone and walked 
#'                                                  away from the cone in a} \cr
#'              \tab                          \tab  {straight line that was 
#'                                                  perpendicular to the extent 
#'                                                  between the target and the 
#'                                                  participant.} \cr
#'              \tab                          \tab  {Participants instructed the experimenter 
#'                                                  to stop walking when they 
#'                                                  thought that the distance } \cr
#'              \tab                          \tab  {between the target and the 
#'                                                  experimenter was equal to 
#'                                                  the target distance.} \cr
#' }

#' @source Twedt, E.T, Bakdash, J.Z., and Proffitt, D.R. (2022). 
#' Repeated measures and multivariate measures of perceived distance (Data set)
#' \doi{https://doi.org/10.5281/zenodo.6967162}
#'
NULL

