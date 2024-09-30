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




#Script to create the Figure 2 of the manuscript:

#We use the preprocessed data which is called "ReCod" in this script.

# Install and load the necessary libraries if not already installed
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

library(ggplot2)
library(dplyr)


# Display the versions:
# > packageVersion("ggplot2")
# [1] ‘3.4.0’
# > packageVersion("dplyr")
# [1] ‘1.0.10’

# Calculate the average forecasts and standard errors for different categories
graph_data <- ReCod %>%
  group_by(TrainingBinary, BinaryOutcome) %>%
  summarise(MeanForecast = mean(ModValue), 
            SEForecast = sd(ModValue) / sqrt(n())) %>%
  ungroup() %>%
  mutate(TrainingLabel = ifelse(TrainingBinary == 0, "Without Training", "With Training"),
         OutcomeLabel = case_when(
           BinaryOutcome == 0 ~ "Outcome Realization=0",
           BinaryOutcome == 1 ~ "Outcome Realization=1"
         ))

# Add overall average forecast and standard errors for both training categories
overall_avg <- ReCod %>%
  group_by(TrainingBinary) %>%
  summarise(MeanForecast = mean(ModValue), 
            SEForecast = sd(ModValue) / sqrt(n())) %>%
  mutate(OutcomeLabel = "All Outcome Realization",
         TrainingLabel = ifelse(TrainingBinary == 0, "Without Training", "With Training"))

# Combine the two data sets for plotting
graph_data <- bind_rows(graph_data, overall_avg)

# Ensure the correct ordering of OutcomeLabel and TrainingLabel
graph_data$OutcomeLabel <- factor(graph_data$OutcomeLabel, 
                                  levels = c("Outcome Realization=0", "Outcome Realization=1", "All Outcome Realization"))
graph_data$TrainingLabel <- factor(graph_data$TrainingLabel, 
                                   levels = c("Without Training", "With Training"))

# Create the bar plot with error bars using ggplot2
ggplot(graph_data, aes(x = OutcomeLabel, y = MeanForecast, fill = TrainingLabel)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6) +
  geom_errorbar(aes(ymin = MeanForecast - SEForecast, ymax = MeanForecast + SEForecast), 
                position = position_dodge(width = 0.7), width = 0.25, size = 0.8) + # Adjusted error bar size for visibility
  geom_text(aes(label = round(MeanForecast, 2)), vjust = -0.5, 
            position = position_dodge(0.7), size = 5, family = "serif") + # Adjust font size and family for text labels
  labs(title = "Average Forecasts",
       x = "",
       y = "",
       fill = "") +
  scale_fill_manual(values = c("Without Training" = "#6CA6CD", "With Training" = "#D55E00")) + # Updated colors
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, family = "serif"),          # Title font size and family
    axis.title.x = element_text(size = 16, family = "serif"),                     # X-axis title font size and family
    axis.title.y = element_text(size = 16, family = "serif"),                     # Y-axis title font size and family
    axis.text.x = element_text(size = 16, family = "serif"),                      # X-axis labels font size and family
    axis.text.y = element_text(size = 16, family = "serif"),                      # Y-axis labels font size and family
    legend.title = element_text(size = 16, family = "serif"),                     # Legend title font size and family
    legend.text = element_text(size = 16, family = "serif"),                      # Legend text font size and family
    legend.position = "bottom"
  )
