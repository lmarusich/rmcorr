# Nested and multivariate survey measures of hospital patient experience and other measures

A summary dataset from non-independent units of analysis (six regions
nesting 50 U.S. states and 3 U.S. territories) with multivariate
(composite) measures. This is a survey assessing patient experience for
hospitalized care, the Hospital Consumer Assessment of Healthcare
Providers and Systems (HCAHPS) Survey; also referred to as the CAHPS®
Hospital Survey. The data were publicly released in April 2023 by the
U.S. Centers for Medicare & Medicaid Services (CMS).

HCAHPS is a standardized and validated survey instrument for evaluating
patient experience. Patient experience is an indicator of healthcare
quality and is defined as the "... range of interactions at patients
have with the healthcare system, including their care from health plans,
and from doctors, nurses, and staff in hospitals..."
<https://web.archive.org/web/20230206233908/https://www.ahrq.gov/cahps/about-cahps/patient-experience/index.html>.

The HCAHPS composite measures consist of multiple questions and, here,
are top box scores (see
<https://www.hcahpsonline.org/en/summary-analyses/>). In addition to
patient experience, there are additional measures such as whether the
hospital is recommended or not, the number or participating hospitals,
and the survey response rate

- Note this is *not* a representative sample

- Measures are averaged at the state/territory level

- Respondents were discharged from a hospital between July 2021 to July
  2022

- Results are patient-mix adjusted, see
  [doi:10.1111/j.1475-6773.2008.00914.x](https://doi.org/10.1111/j.1475-6773.2008.00914.x)

Additional Information:

- For details about the data and questions comprising composite
  measures, see
  <https://www.hcahpsonline.org/globalassets/hcahps/star-ratings/tech-notes/april_2023_star-ratings_tech_notes.pdf>

- For the specific questions on the HCAHPS survey, see
  <https://www.hcahpsonline.org/globalassets/hcahps/quality-assurance/2023_survey-instruments_english_mail.pdf>

- CAHPS® is a registered trademark of the U.S. Agency for Healthcare
  Research and Quality:
  <https://www.ahrq.gov/cahps/about-cahps/using-cahps-name/index.html>

## Usage

``` r
HCAHPS2022
```

## Format

A data frame with 53 rows and 14 columns

|         |                                       |                                                                                                                                                                                                    |
|---------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `[,1]`  | `State`                               | Unique identifier for each U.S. state/territory, see <https://npiregistry.cms.hhs.gov/help-api/state>                                                                                              |
| `[,2]`  | `Region`                              | The region nesting states and territories, according to the U.S. Census Bureau                                                                                                                     |
| `[,3]`  | `Communication with Nurses`           | Composite measure (3 questions) for nurse communication with patient (e.g., "During this hospital stay, how often did nurses listen carefully to you?")                                            |
| `[,4]`  | `Communication with Doctors`          | Composite measure (3 questions) for doctor communication with patient (e.g., "During this hospital stay, how often did doctors explain things in a way you could understand?")                     |
| `[,5]`  | `Responsiveness of Hospital Staff`    | Composite measure (2 questions) for responsiveness of hospital staff (e.g., How often did you get help in getting to the bathroom or in using a bedpan as soon as you wanted?)                     |
| `[,6]`  | `Communication About Medicines`       | Composite measure (2 questions) for healthcare provider communication about medicines (e.g., Before giving you any new medicine, how often did hospital staff tell you what the medicine was for?) |
| `[,7]`  | `Cleanliness of Hospital Environment` | Individual item: "During this hospital stay, how often were your room and bathroom kept clean?"                                                                                                    |
| `[,8]`  | `Quietness of Hospital Environment`   | Individual item: "During this hospital stay, how often was the area around your room quiet at night?"                                                                                              |
| `[,9]`  | `Discharge Information`               | Composite measure (2 questions) for communication about care needed after leaving the hospital (e.g., was help needed after leaving the hospital discussed?)                                       |
| `[,10]` | `Care Transition`                     | Composite measure (3 questions) for understanding of care needed (e.g., "When I left the hospital, I had a good understanding of the things I was responsible for in managing my health?")         |
| `[,11]` | `Hospital Rating`                     | Ten point Likert scale rating of hospital (worse possible to best possible)                                                                                                                        |
| `[,12]` | `Recommend the Hospital`              | Individual item: "Would you recommend this hospital...?" Percent of "yes" responses                                                                                                                |
| `[,13]` | `Participating Hospitals`             | Number of participating hospitals in the region                                                                                                                                                    |
| `[,14]` | `Survey Response Rate`                | Patient survey response rate for each state/territory (%)                                                                                                                                          |

## Source

CAHPS Hospital Survey (2022). HCAHPS Survey Results Table (Dataset)
<https://www.hcahpsonline.org/globalassets/hcahps/summary-analyses/summary-results/april-2023-public-report-july-2021---june-2022-discharges.pdf>
