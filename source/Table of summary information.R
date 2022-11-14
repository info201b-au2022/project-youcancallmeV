# Project 2 - Table of summary information
# This is the .R source file that creates a table of summary information
# The code for the table are following
library(dplyr)
library(tidyverse)
# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

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
  ) %>%
  filter(State.abbreviation == "Washington")

college_admission_no_NA <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]


# Following is the table of summary information, we will be changing the column names for better understanding
colnames(college_admission_aggregated) <- c("Name","State","Admit Percent","SAT submit rate","Undergraduate Enrollment", "On campus (in-state) total expense", "On campus (out-of-state) total expense")

college_table <- college_admission_aggregated


