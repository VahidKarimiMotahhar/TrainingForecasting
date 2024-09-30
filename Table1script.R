#How does training improve individual forecasts? Modeling Differences in Compensatory and Non-Compensatory Biases in Geopolitical Forecasts
#Corresponding author’s contact details:
#  First Name: Vahid assistant professor of marketing at sabancı university
#Surname: Karimi Motahhar
#Email address: vahid.karimimotahhar@sabanciuniv.edu
#Affiliation postal address: Sabancı University. Orta Mahalle, 34956 Tuzla, İstanbul, Türkiye
#Co-authors’ contact details:
#  First Name: Thomas professor of marketing at the university of iowa
#Middle Name: S.
#Surname: Gruca
#Email address: thomas-gruca@uiowa.edu
#Affiliation postal address: 21 E Market St, Iowa City, IA 52242, USA


# Table 1 Script:

#In this script we use the pre processed data, called "ReCod", to create Table1:

# Install and load necessary libraries if not already installed
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}


library(dplyr)

# Display the version and other details of readr and dplyr
# > packageVersion("dplyr")
# [1] ‘1.0.10’


# Number of observations in Year 1 with training as 0 and unique users
year1_training0 <- ReCod %>% 
  filter(TrainingBinary == 0, year1binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Number of observations in Year 2 with training as 0 and unique users
year2_training0 <- ReCod %>% 
  filter(TrainingBinary == 0, year2binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Total number of observations in both years with training as 0 and unique users
both_years_training0 <- ReCod %>% 
  filter(TrainingBinary == 0) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Number of observations in Year 1 with training as 1 and unique users
year1_training1 <- ReCod %>% 
  filter(TrainingBinary == 1, year1binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Number of observations in Year 2 with training as 1 and unique users
year2_training1 <- ReCod %>% 
  filter(TrainingBinary == 1, year2binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Total number of observations in both years with training as 1 and unique users
both_years_training1 <- ReCod %>% 
  filter(TrainingBinary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Total number of observations in Year 1 (regardless of training) and unique users
total_year1 <- ReCod %>% 
  filter(year1binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Total number of observations in Year 2 (regardless of training) and unique users
total_year2 <- ReCod %>% 
  filter(year2binary == 1) %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Total number of observations across both years and unique users (regardless of training)
total_both_years <- ReCod %>% 
  summarise(total_obs = n(), unique_users = n_distinct(user_id))

# Display the results
#Table 1, first row numbers:
year1_training0
year2_training0
both_years_training0
#Table 1, Second row numbers:
year1_training1
year2_training1
both_years_training1
#Table 1, third row numbers:
total_year1
total_year2
total_both_years


