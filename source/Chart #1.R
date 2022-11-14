#Project 2 - Chart #1 
#This is the .R source file for the first chart of our report 
#The code for the chart are following

library(dplyr)
library(tidyverse)

install.packages("ggplot2") # once per machine
library("ggplot2")          # in each relevant script

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
# Since we are calculating average, it would be very inconvenient if the school's data is not available
# Thus, we will be excluding the schools that contains NA values in the columns we desire 
college_admission_no_NA <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]

#Creates a graph that presents the State versus the total price for our of state students living on campus (2013)
ggplot(data = college_admission_no_NA) +
  geom_point(
    mapping = aes(x = State.abbreviation , y = Total.price.for.out.of.state.students.living.on.campus.2013.14),
    color = "red",
    alpha = .3
  )
