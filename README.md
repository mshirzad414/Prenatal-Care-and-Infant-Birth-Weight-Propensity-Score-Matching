# Prenatal Care and Infant Brith Weight Propensity-Score-Matching
Description: This study evaluates the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight in grams, with matching on several other determinants of weight

This project measure the impact  of prenatal care during the first trimester of pregnancy on subsequent birth weight in grams. This project focuses on understanding the relationship between early prenatal care and infant birth weight, leveraging propensity score matching techniques in R. The analysis is based on data extracted from the renowned study by Cattaneo (2010) published in the Journal of Econometrics (Volume 155, pages 138-154), which encompasses 4,642 observations across 23 variables related to factors influencing infant birth weight. However, our study specifically considers eight key variables that play a crucial role in determining birth weight outcomes. The varaible desciption is listed below. 

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/7d865f16-94e5-4c83-b42c-caf78b89b235)

For code used in this study, please refer to the care_psm.R in the repository. 

## First stage:
We begin by loading the data and observing the distribution of the outcome variable, noting how it differs between treated and untreated units.
In this study, the outcome variable is birth weight (bweight), the treatment dummy variable is prenatal1, and other factors represent observable covariates.


![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/2a64cc7e-e17d-44bf-a879-2b3608a49e9d)


Mean difference in infant weights across treated is 3391 and across not treated is 3244. The initial datasets includes that the mean-difference across trated and control units for the outcome variable is around 150 grams

Now, let's consider the main study objective: to investigate the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight using propensity score matching.

## Second stage:
We match each prenatal1=1 (treated) and =0 (not treated) based on their propensity scores, which are calculated using a range of covariates. To perform this matching, we utilize the Matchit package in R and evaluate the results as follows:
The below shows the summart of balance for all data using propensity score matching:

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/fb66de0f-ba12-42c3-b151-cdcadc600227)





The last section of the figures below shows that there are 3,720 treated units and 922 untreated or control units in the original sample. All control units are matched to corresponding treated units. The remaining 2,798 non-treated units are not matched to any treated units and can be discarded in subsequent analysis.

Applied researchers may sometimes be concerned about discarding a large number of unmatched participants. However, this is usually not an issue if all treated participants are matched, and good balance is achieved.
Below illustrates the matching process across observations using both desity and histogram illustration

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/cbf266ca-f4a8-4c3a-a28e-2b77b9d33e57)



![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/703051bd-69f2-4468-84c0-cde9bc012e0d)




## Third Stage:

Now we shows the mean-differnce of the outcome variable across treated and not trated unit using matched data constructed before.The bar chart shows a differnece of over 300 grams in infanct weight across treated units and control units, which is higher compared to mean-differnece of infanct weight in the original data. 

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/2abe4b69-b9cb-450a-94d4-8830c50706d5)




Next; We run regression over the matched data to analyze the impact of prenatal care on infant birth weight, both with and without considering other covariates. This analysis helps us understand the direct effect of prenatal care on birth weight while controlling for potential confounding factors.

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/d9b3c794-8c51-4359-ad37-2ec70507d58e)



The results show that prenatal care is significant in both cases even after considering other confounders. This suggests that prenatal care has a meaningful impact on infant birth weight, regardless of the presence of other covariates.

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/c8682e98-81e7-4603-814d-91245996e348)




## Lastly, 

Using propensity scores, we constructed a matched dataset that enabled us to compare treated units with untreated units while considering all matched observables. Our analysis reveals that prenatal care is a significant factor in determining infant weight. Although the impact is small, it remains statistically significant. The code for this study can be found in the "care_psm.R" file in the repository for your reference.




