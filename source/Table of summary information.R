# Project 2 - Table of summary information 
# This is the .R source file that creates a table of summary information
# The code for the table are following
library(dplyr)

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv",
                              stringsAsFactors=FALSE, na.strings = ".")

# This is the aggregated data set we will be using 
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

table(college_admission_aggregated$State.abbreviation)
