# Prenatal-Care-and-Infant-Brith-Weight-Propensity-Score-Matching
Evaluates the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight in grams, with matching on several other determinants of weight

###This project measure the impact  of prenatal care during the first trimester of pregnancy on subsequent birth weight in grams. This project focuses on understanding the relationship between early prenatal care and infant birth weight, leveraging propensity score matching techniques in R. The analysis is based on data extracted from the renowned study by Cattaneo (2010) published in the Journal of Econometrics (Volume 155, pages 138-154), which encompasses 4,642 observations across 23 variables related to factors influencing infant birth weight. However, our study specifically considers eight key variables that play a crucial role in determining birth weight outcomes. The varaible desciption is listed below. 
### Variables Description
![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/7d865f16-94e5-4c83-b42c-caf78b89b235)
For code used in this study, please refer to the care_psm.R in the repository. 

In this study, the outcome variable is birth weight (bweight), the treatment dummy variable is prenatal1, and other factors represent observable covariates.

First stage:
We begin by loading the data and observing the distribution of the outcome variable, noting how it differs between treated and untreated units.

Now, let's consider the main study objective: to investigate the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight using propensity score matching.

Second stage:
We match each prenatal1=1 (treated) and =0 (not treated) based on their propensity scores, which are calculated using a range of covariates. To perform this matching, we utilize the Matchit package in R and evaluate the results as follows:

The last section of the figures below shows that there are 3,720 treated units and 922 untreated or control units in the original sample. All control units are matched to corresponding treated units. The remaining 2,798 non-treated units are not matched to any treated units and can be discarded in subsequent analysis.

Applied researchers may sometimes be concerned about discarding a large number of unmatched participants. However, this is usually not an issue if all treated participants are matched, and good balance is achieved.










