#' @name bland1995
#' @title Repeated measurements of intramural pH and PaCO2
#' @description A dataset containing the repeated measurements of intramural pH
#' and PaCO2 for eight subjects, from Bland & Altman (1995).
#' @docType data
#' @usage bland1995
#' @format A data frame with 47 rows and 3 variables
#' \tabular{lll}{
#' \code{[,1]} \tab \code{Subject} \tab {Unique identifer} \cr
#' \code{[,2]} \tab \code{pH}      \tab {Potential of hydrogen, 
#'                                        acidity to base} \cr
#' \code{[,3]} \tab \code{PaCO2}   \tab {Partial pressure of carbon dioxide}\cr     
#' }
#' @source Bland, J.M., & Altman, D.G. (1995). Calculating correlation
#' coefficients with repeated observations: Part 1 -- correlation within
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
#' \code{[,1]} \tab \code{sub}   \tab {Subject ID} \cr
#' \code{[,2]} \tab \code{block} \tab {Block ID} \cr
#' \code{[,3]} \tab \code{rt}    \tab {Mean reaction time} \cr
#' \code{[,4]} \tab \code{acc}   \tab {Mean accuracy} \cr
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
#' \code{[,1]} \tab \code{Participant} \tab {Participant ID} \cr
#' \code{[,2]} \tab \code{Time}        \tab {Measurement time} \cr
#' \code{[,3]} \tab \code{Age}         \tab {Participant's age (years)} \cr
#' \code{[,4]} \tab \code{Volume}      \tab {Adjusted volume of cerebellar
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
#' \code{[,1]} \tab \code{Pair}        \tab {Unique identifer for each dyad} \cr
#' \code{[,2]} \tab \code{HVT_capture} \tab {Capture time} \cr
#' \code{[,3]} \tab \code{MARS}        \tab {subjective situation awareness} \cr
#' \code{[,4]} \tab \code{Source Reliability} \tab {1 = none, 2 = accurate, and
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
#' at physical distances of 7, 8, 9, 10, and 11 meters. The data are also 
#' multivariate, with five dependent measures of distance perception. This is a 
#' 5 (physical distance) x 5 (dependent measure) within-participants design 
#' with a sample size of 46. 
#' Note data is missing for 15 trials due to participant and experimenter errors.
#' @docType data
#' @usage twedt_dist_measures
#' @format A data frame with 230 rows and 7 columns
#'    | `[,1]`  | `Subject`          | Unique identifier for each participant |
#'    | :---    | :---               |  :---  |
#'    | `[,2]`  | `Physical Distance`| Physical distance from the participant to the target cone, in meters |
#'    | `[,3]`  | `Blindwalk Away`   | Participants put on the blindfold after viewing the target. Next, participants took one step to the left and turned 180 degrees to face the opposite direction. Participants were instructed to walk forward until they had walked the original distance to the target |
#'    | `[,4]`  | `Blindwalk Toward` | Participants put on the blindfold after viewing the target.  Next, participants walked forward until they thought they had reached the target cone |
#'    | `[,5]`  | `Triangulated BW`  | Participants put on the blindfold after viewing the target. Next, participants turned right 90 degrees and walked forward 5 meters. The experimenter told participants when to stop walking. Finally, participants turned to face toward the target and walked forward two steps |
#'    | `[,6]`  | `Verbal`           | Participants stated the distance between the target cone and themselves, in feet and inches |
#'    | `[,7]`  | `Visual Matching`  | An experimenter stood next to the target cone and walked away from the cone in a straight line that was perpendicular to the extent  between the target and the participant. Participants instructed the experimenter to stop walking when they thought that the distance between the target and the experimenter was equal to  the target distance |   
#' @md

#' @source Twedt, E. Bakdash, J.Z., and Proffitt, D.R. (2022). 
#' Repeated and multivariate measures of perceived distance (Dataset)
#' \doi{https://doi.org/10.5281/zenodo.6967162}
#'
NULL

#' @name HCAHPS2022
#' @title Nested and multivariate survey measures of hospital patient experience 
#' and other measures
#' @description A summary dataset from non-independent units of analysis (six 
#' regions nesting 50 U.S. states and 3 U.S. territories) with multivariate 
#' (composite) measures. This is a survey assessing patient experience for  
#' hospitalized care, the Hospital Consumer Assessment of Healthcare Providers 
#' and Systems (HCAHPS) Survey; also referred to as the CAHPS® Hospital Survey. 
#' The data were publicly released in April 2023 by the U.S. Centers for 
#' Medicare & Medicaid Services (CMS). 
#' 
#' HCAHPS is a standardized and validated survey instrument for evaluating 
#' patient experience. Patient experience is an indicator of healthcare quality 
#' and is defined as the "... range of interactions at patients have with the 
#' healthcare system, including their care from health plans, and from doctors, 
#' nurses, and staff in hospitals..."  \url{https://web.archive.org/web/20230206233908/https://www.ahrq.gov/cahps/about-cahps/patient-experience/index.html}.
#' 
#' The HCAHPS composite measures consist of multiple questions and, here, are top box scores (see \url{https://www.hcahpsonline.org/en/summary-analyses/}). 
#' In addition to patient experience, there are additional measures such as whether the hospital is 
#' recommended or not, the number or participating hospitals, and the survey response rate
#' - Note this is \emph{not} a representative sample 
#' - Measures are averaged at the state/territory level
#' - Respondents were discharged from a hospital between July 2021 to July 2022 
#' - Results are patient-mix adjusted, see \doi{10.1111/j.1475-6773.2008.00914.x}
#'
#' Additional Information: 
#' - For details about the data and questions comprising composite measures, see 
#' \url{https://www.hcahpsonline.org/globalassets/hcahps/star-ratings/tech-notes/april_2023_star-ratings_tech_notes.pdf} 
#' - For the specific questions on the HCAHPS survey, 
#' see \url{https://www.hcahpsonline.org/globalassets/hcahps/quality-assurance/2023_survey-instruments_english_mail.pdf}
#' - CAHPS® is a registered trademark of the U.S. Agency for Healthcare Research
#' and Quality: \url{https://www.ahrq.gov/cahps/about-cahps/using-cahps-name/index.html}
#'  
#' @docType data
#' @usage HCAHPS2022
#' @format A data frame with 53 rows and 14 columns
#'    | `[,1]`  | `State`                               | Unique identifier for each U.S. state/territory, see \url{https://npiregistry.cms.hhs.gov/help-api/state} |
#'    | :---    | :---                                  |  :---             |
#'    | `[,2]`  | `Region`                              | The region nesting states and territories, according to the U.S. Census Bureau   |
#'    | `[,3]`  | `Communication with Nurses`           | Composite measure (3 questions) for nurse communication with patient (e.g., "During this hospital stay, how often did nurses listen carefully to you?") |
#'    | `[,4]`  | `Communication with Doctors`          | Composite measure (3 questions) for doctor communication with patient (e.g., "During this hospital stay, how often did doctors explain things in a way you could understand?")  |
#'    | `[,5]`  | `Responsiveness of Hospital Staff`    | Composite measure (2 questions) for responsiveness of hospital staff (e.g., How often did you get help in getting to the bathroom or in using a bedpan as soon as you wanted?)  |
#'    | `[,6]`  | `Communication About Medicines`       | Composite measure (2 questions) for healthcare provider communication about medicines (e.g., Before giving you any new medicine, how often did hospital staff tell you what the medicine was for?) |
#'    | `[,7]`  | `Cleanliness of Hospital Environment` | Individual item: "During this hospital stay, how often were your room and bathroom kept clean?" |   
#'    | `[,8]`  | `Quietness of Hospital Environment`   | Individual item: "During this hospital stay, how often was the area around your room quiet at night?" |   
#'    | `[,9]`  | `Discharge Information`               | Composite measure (2 questions) for communication about care needed after leaving the hospital (e.g., was help needed after leaving the hospital discussed?) |
#'    | `[,10]` | `Care Transition`                     | Composite measure (3 questions) for understanding of care needed (e.g., "When I left the hospital, I had a good understanding of the things I was responsible for in managing my health?")    |
#'    | `[,11]` | `Hospital Rating`                     | Ten point Likert scale rating of hospital (worse possible to best possible) |
#'    | `[,12]` | `Recommend the Hospital`              | Individual item: "Would you recommend this hospital...?" Percent of "yes" responses|
#'    | `[,13]` | `Participating Hospitals`             | Number of participating hospitals in the region |
#'    | `[,14]` | `Survey Response Rate`                | Patient survey response rate for each state/territory (%) |
#' @md
#' @source CAHPS Hospital Survey (2022). 
#' HCAHPS Survey Results Table (Dataset)
#' \url{https://www.hcahpsonline.org/globalassets/hcahps/summary-analyses/summary-results/april-2023-public-report-july-2021---june-2022-discharges.pdf}
#'  
NULL
