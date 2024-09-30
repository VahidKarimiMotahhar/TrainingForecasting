#How does training improve individual forecasts? Modeling Differences in Compensatory and Non-Compensatory Biases in Geopolitical Forecasts
#Corresponding author’s contact details:
#First Name: Vahid 
#Surname: Karimi Motahhar
#assistant professor of marketing at sabancı university
#Email address: vahid.karimimotahhar@sabanciuniv.edu
#Affiliation postal address: Sabancı University. Orta Mahalle, 34956 Tuzla, İstanbul, Türkiye
#Co-authors’ contact details:
#First Name: Thomas 
#Middle Name: S.
#Surname: Gruca
#professor of marketing at the university of iowa
#Email address: thomas-gruca@uiowa.edu
#Affiliation postal address: 21 E Market St, Iowa City, IA 52242, USA


#> Sys.info()
#sysname        release        version       nodename        machine          login 
#"Windows"       "10 x64"  "build 19045"        "VAHID"       "x86-64"        "vahid" 
#user effective_user 
#"vahid"        "vahid"

#> R.version
#_                                
#platform       x86_64-w64-mingw32               
#arch           x86_64                           
#os             mingw32                          
#crt            ucrt                             
#system         x86_64, mingw32                  
#status                                          
#major          4                                
#minor          2.2                              
#year           2022                             
#month          10                               
#day            31                               
#svn rev        83211                            
#language       R                                
#version.string R version 4.2.2 (2022-10-31 ucrt)



# Here we create the data used in our analyses:
# 3 data sets were downloaded from:
#[dataset] Good Judgment Project Dataverse. Tetlock et al. (last accessed on October 30th, 2023). https://dataverse.harvard.edu/dataverse/gjp
#The three data sets are: 
#1.Forecasts from the first year (survey_fcasts.yr1.csv)
#2.Forecasts from the second year (survey_fcasts.yr2.csv)
#3.Forecasting question descriptions(ifps.csv)
#After downloading the data sets, set you working directory accodingly:

# Install and load necessary libraries if not already installed
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

library(readr)
library(dplyr)

# Display the version and other details of readr and dplyr
# > packageVersion("readr")
# [1] ‘2.1.3’
# > packageVersion("dplyr")
# [1] ‘1.0.10’

# Read the CSV files for Year 1 and Year 2 with specified column types
survey_fcasts_yr11 <- read_csv("survey_fcasts.yr1.csv", 
                               col_types = cols(
                                 ctt = col_character(),
                                 cond = col_character(),
                                 training = col_character(),
                                 team = col_character(),
                                 user_id = col_character(),
                                 fcast_type = col_character(),
                                 answer_option = col_character(),
                                 expertise = col_character(),
                                 q_status = col_character()
                               ))

survey_fcasts_yr22 <- read_csv("survey_fcasts.yr2.csv", 
                               col_types = cols(
                                 ctt = col_character(),
                                 cond = col_character(),
                                 training = col_character(),
                                 team = col_character(),
                                 user_id = col_character(),
                                 fcast_type = col_character(),
                                 answer_option = col_character(),
                                 expertise = col_character(),
                                 q_status = col_character()
                               ))

# Convert relevant columns to factors for both year 1 and year 2 datasets before merging
survey_fcasts_yr11 <- survey_fcasts_yr11 %>%
  mutate(
    ctt = as.factor(ctt),
    cond = as.factor(cond),
    training = as.factor(training),
    team = as.factor(team),
    user_id = as.factor(user_id),
    fcast_type = as.factor(fcast_type),
    answer_option = as.factor(answer_option),
    expertise = as.factor(expertise),
    q_status = as.factor(q_status),
    year1binary = 1,   # Adding year1binary for year 1 dataset
    year2binary = 0    # Adding year2binary as 0 for year 1 dataset
  )

survey_fcasts_yr22 <- survey_fcasts_yr22 %>%
  mutate(
    ctt = as.factor(ctt),
    cond = as.factor(cond),
    training = as.factor(training),
    team = as.factor(team),
    user_id = as.factor(user_id),
    fcast_type = as.factor(fcast_type),
    answer_option = as.factor(answer_option),
    expertise = as.factor(expertise),
    q_status = as.factor(q_status),
    year1binary = 0,   # Adding year1binary as 0 for year 2 dataset
    year2binary = 1    # Adding year2binary for year 2 dataset
  )

# Combine the two survey forecast datasets
combined_survey_fcasts <- bind_rows(survey_fcasts_yr11, survey_fcasts_yr22)

#  Read the ifps dataset and rename it to ifps1122
ifps1122 <- read_csv("ifps.csv",  
                     col_types = cols(
                       q_type = col_character(),
                       q_status = col_character(),
                       outcome = col_character(),
                       n_opts = col_character()
                     ))

# Convert relevant columns to factors for the ifps dataset before merging
ifps1122 <- ifps1122 %>%
  mutate(
    q_type = as.factor(q_type),
    q_status = as.factor(q_status),
    outcome = as.factor(outcome),
    n_opts = as.factor(n_opts)
  )

# Merge the combined survey forecast data with the ifps dataset by "ifp_id" and rename to ForecastsWquestions1122
ForecastsWquestions1122 <- right_join(ifps1122, combined_survey_fcasts, by = "ifp_id")

# Convert ifp_id to factor after merging
ForecastsWquestions1122 <- ForecastsWquestions1122 %>%
  mutate(ifp_id = as.factor(ifp_id))

# Filtering Process
# 1. Filter by cond (only keeping '1')
FilteredData <- ForecastsWquestions1122 %>% 
  filter(cond == "1")

# 2. Only keep rows where 'training' is either 'a' or 'b', but not 'c'
FilteredData <- FilteredData %>% 
  filter(training %in% c('a', 'b'))




# 3. Remove rows where q_status_y is "voided"
FilteredData <- FilteredData %>% 
  filter(q_status.y != "voided")





# 4. Filter rows where n_opts is '2'
FilteredData <- FilteredData %>% 
  filter(n_opts == "2")



# 5. Retain only rows where answer_option is 'a'
FilteredData <- FilteredData %>% 
  filter(answer_option == "a")




# 6.1. Sort by user_id, q_text, and timestamp and create an "initial" column
FilteredData <- FilteredData %>% 
  arrange(user_id, q_text, timestamp) %>% 
  group_by(user_id, q_text) %>% 
  mutate(initial = ifelse(row_number() == 1, 1, 0)) %>% 
  ungroup()

# 6.2. Filter based on the "initial" column to keep only the first distinct forecasts
FilteredData <- FilteredData %>% 
  filter(initial == 1)


# Creating outcome dummy variable
FilteredData <- FilteredData %>% 
  mutate(outcome01 = ifelse(outcome == answer_option, 1, 0))

# Adjusting ModValue between 0.0001 and 0.999
FilteredData <- FilteredData %>% 
  mutate(
    ModValue = ifelse(value == 0, 0.0001, ifelse(value == 1, 0.999, value)),
    ForecastLogRatio = log(ModValue / (1 - ModValue))
  )

# Create the "BinaryOutcome" column: 1 if outcome is 'a', 0 if outcome is 'b'
FilteredData <- FilteredData %>%
  mutate(BinaryOutcome = ifelse(outcome == "a", 1, ifelse(outcome == "b", 0, NA)))



# Adding the "TrainingBinary" column: 0 if training is 'a', 1 if training is 'b'
FilteredData <- FilteredData %>% 
  mutate(TrainingBinary = ifelse(training == "a", 0, 1))

# Create the "Experience" column based on the "year1binary" and "year2binary" columns
FilteredData <- FilteredData %>%
  group_by(user_id) %>%
  mutate(Experience = ifelse(year2binary == 1 & any(year1binary == 1), 1, 0)) %>%
  ungroup()

# Filter the data to keep only rows where Experience is 0
# We have the initial forecast of forecasters in the first two years: 
FilteredData <- FilteredData %>% 
  filter(Experience == 0)

# Output the cleaned data to a CSV if needed
write_csv(FilteredData, "ReCod.csv")
