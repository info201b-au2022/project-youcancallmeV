library(tidyverse)
library(dplyr)
# This is the calculation done by Hanjiang Xu to complete visualizations
# Load the data for our project

college_admission <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv",
  stringsAsFactors = FALSE)
# Aggregate the data set 
college_admission_aggregated <- college_admission %>%
  group_by(State.abbreviation) %>%
  select(
    Name,
    State.abbreviation,
    Percent.admitted...total,
    Percent.of.freshmen.submitting.SAT.scores,
    Estimated.undergraduate.enrollment..total,
    Total.price.for.in.state.students.living.on.campus.2013.14,
    Total.price.for.out.of.state.students.living.on.campus.2013.14
  )

# ignore all the NA, this is the main data frame that we are going to use 
college_df <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]

#----------------------------------------------------------------------------#
# This following section is calculations by V.
df_inter_12 <- college_df
df_inter_12$State.abbreviation <- tolower(df_inter_12$State.abbreviation)

# Change the column names for better understanding 
colnames(df_inter_12) <- c("Name", "state", "Admission", "SAT", "Enrollment", "on", "off")

# Calculate the average for each variable for all states
df_inter <- df_inter_12 %>%
  group_by(state) %>%
  mutate(
    average_admitted = mean(Admission),
    average_SAT_sub = mean(SAT),
    average_enroll = mean(Enrollment),
    average_p_on = mean(on),
    average_p_off = mean(off)
  ) 

# get lat and lng of the states 
df_map <- map_data("state") %>%
  group_by(region) %>%
  rename(state = region) %>%
  left_join(df_inter, by = "state")
#----------------------------------------------------------------------------#
