#Project 2 - Chart #1 
#This is the .R source file for the first chart of our report 
#The code for the chart are following

library(dplyr)
library(tidyverse)

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# This is a aggregated data set 
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

college_admission_no_NA <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]
