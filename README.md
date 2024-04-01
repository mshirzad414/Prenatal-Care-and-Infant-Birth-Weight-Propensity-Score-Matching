# Prenatal-Care-and-Infant-Brith-Weight-Propensity-Score-Matching
Evaluates the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight in grams, with matching on several other determinants of weight

This project measure the impact  of prenatal care during the first trimester of pregnancy on subsequent birth weight in grams. This project focuses on understanding the relationship between early prenatal care and infant birth weight, leveraging propensity score matching techniques in R. The analysis is based on data extracted from the renowned study by Cattaneo (2010) published in the Journal of Econometrics (Volume 155, pages 138-154), which encompasses 4,642 observations across 23 variables related to factors influencing infant birth weight. However, our study specifically considers eight key variables that play a crucial role in determining birth weight outcomes. The varaible desciption is listed below. 

![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/7d865f16-94e5-4c83-b42c-caf78b89b235)

For code used in this study, please refer to the care_psm.R in the repository. 

## First stage:
We begin by loading the data and observing the distribution of the outcome variable, noting how it differs between treated and untreated units.
In this study, the outcome variable is birth weight (bweight), the treatment dummy variable is prenatal1, and other factors represent observable covariates.
![Alt Text](http://127.0.0.1:37201/graphics/04b9417b-9f0d-496f-a23d-f2e285a05677.png)



 ### prenatal1 mean_bweight
 ###     <dbl>        <dbl>
 ### 1     0        3244
 ### 2     1        3391

The initial datasets includes that the mean-difference across trated and control units for the outcome variable is around 150 grams

Now, let's consider the main study objective: to investigate the impact of prenatal care in the first trimester of pregnancy on subsequent birth weight using propensity score matching.

## Second stage:
We match each prenatal1=1 (treated) and =0 (not treated) based on their propensity scores, which are calculated using a range of covariates. To perform this matching, we utilize the Matchit package in R and evaluate the results as follows:
The below shows the summart of balance for all data using propensity score matching:
![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/2d9cf7e7-c1ef-4925-9f9b-755cfeb82068)


The last section of the figures below shows that there are 3,720 treated units and 922 untreated or control units in the original sample. All control units are matched to corresponding treated units. The remaining 2,798 non-treated units are not matched to any treated units and can be discarded in subsequent analysis.

Applied researchers may sometimes be concerned about discarding a large number of unmatched participants. However, this is usually not an issue if all treated participants are matched, and good balance is achieved.
Below illustrates the matching process across observations using both desity and histogram illustration
![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/8a7eb366-28f0-4dea-a5dd-ecffc04c33b7)
![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/3ca2acd7-8586-45de-a05d-c810bd4b9b06)

## Third Stage:

Now we shows the mean-differnce of the outcome variable across treated and not trated unit using matched data constructed before.The bar chart shows a differnece of over 300 grams in infanct weight across treated units and control units, which is higher compared to mean-differnece of infanct weight in the original data. 
![image](https://github.com/mshirzad414/Prenatal-Care-and-Infant-Birth-Weight-Propensity-Score-Matching/assets/140922484/9288c4e2-a14f-4c57-915e-455103eebe54)

Next; We run regression over the matched data to analyze the impact of prenatal care on infant birth weight, both with and without considering other covariates. This analysis helps us understand the direct effect of prenatal care on birth weight while controlling for potential confounding factors.
t test of coefficients:

###           Estimate  Std. Error t value  Pr(>|t|)    
(Intercept) -0.25772977  0.06147678 -4.1923 2.892e-05 ***
bweight      0.00022338  0.00001807 12.3622 < 2.2e-16 ***
---
### Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

The results show that prenatal care is significant in both cases even after considering other confounders. This suggests that prenatal care has a meaningful impact on infant birth weight, regardless of the presence of other covariates.
===============================================
                        Dependent variable:    
                    ---------------------------
                             prenatal1         
-----------------------------------------------
bweight                      0.0001***         
                             (0.00001)         
                                               
mbsmokesmoker                -0.062***         
                              (0.020)          
                                               
mmarriednotmarried           -0.237***         
                              (0.019)          
                                               
mage                         0.027***          
                              (0.001)          
                                               
fbabyYes                     0.212***          
                              (0.014)          
                                               
medu                         0.060***          
                              (0.003)          
                                               
alcohol                       -0.069*          
                              (0.038)          
                                               
Constant                     -1.236***         
                              (0.064)          
                                               
-----------------------------------------------
Observations                   1,844           
R2                             0.687           
Adjusted R2                    0.685           
Residual Std. Error      0.281 (df = 1836)     
F Statistic          574.614*** (df = 7; 1836) 
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01

##Lastly, 

Using propensity scores, we constructed a matched dataset that enabled us to compare treated units with untreated units while considering all matched observables. Our analysis reveals that prenatal care is a significant factor in determining infant weight. Although the impact is small, it remains statistically significant. The code for this study can be found in the "care_psm.R" file in the repository for your reference.




