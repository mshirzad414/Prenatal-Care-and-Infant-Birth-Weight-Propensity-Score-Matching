library(ggplot2)
library(dplyr)
library(lubridate)
library(lmtest)
library(sandwich)
library(vtable)
library(tidyverse)
library(MatchIt)
library(stargazer)
care <- read.csv("Pcare.csv")
st(care, c('prenatal1', 'bweight', 'mbsmoke', 'mmarried', 'mage', 'fbaby', 'medu', 'alcohol'))

#Outcome variable is (bweight) stand for baby weight 
hist(care$bweight)
#transform yes to 1,and no to 0 in the tratment variable 
care$prenatal1 <- ifelse(care$prenatal1 == "Yes", 1, 0)

# observe the outcome variable across treated and not treated group prior to the matching
means_outcome <-care %>%
  group_by(prenatal1) %>%
  summarise(mean_bweight = mean(bweight))
print(means_outcome)

# running propensity score matching for outcome variable against other variables
match_psm <- matchit(prenatal1 ~ bweight + mbsmoke + mmarried + mage + fbaby + medu + alcohol, 
                     data = care, method = "nearest", distance= "glm", 
                     ratio = 1,
                      replace = FALSE )
summary(match_psm)
stargazer(match_psm, type= "text")
plot(match_psm, type= "jitter", interactive = FALSE)
plot(match_psm, type= "hist", abs= FALSE)

# extract the match data and save it to matched_obs 
matched_obs <- match.data(match_psm)
#see the observed mean across treated and control
means_table <- matched_obs %>%
  group_by(prenatal1) %>%
  summarise(mean_bweight = mean(bweight))
# Print the table
print(means_table)
ggplot(means_table, aes(x = factor(prenatal1), y = mean_bweight, fill = factor(prenatal1))) +
  geom_bar(stat = "identity") +
  labs(x = "Parental Treatment", y = "Mean Birth Weight", fill = "Parental Treatment") +
  ggtitle("Mean Birth Weight for Treated and Non-Treated") +
  theme_minimal()

# now we run the regression to find the impact of parental care during first pregnancy period on weight of child in grams for the matched data
model_psm_1 <- lm(prenatal1 ~ bweight, data= matched_obs, weights = weights)
coeftest(model_psm_1, vcov. = vcovCL, cluster= ~subclass)
coefci(model_psm_1, vcov. = vcovCL, cluster= ~subclass, level = 0.5)
stargazer(model_psm_1, type = "text")
# now running regression while controlling for all other factors
model_psm_2 <- lm(prenatal1 ~ bweight + mbsmoke + mmarried + mage + fbaby + medu + alcohol, data= matched_obs, weights = weights)
stargazer(model_psm_2, type = "text")
