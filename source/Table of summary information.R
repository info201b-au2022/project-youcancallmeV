# Project 2 - Table of summary information
# This is the .R source file that creates a table of summary information
# The code for the table are following
library(dplyr)
library(tidyverse)

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# This file will continue to use the calculated data set from file 'Calculated Summary Information'
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

# The following part will calculate five values from the information provided by the data set: 
#   1: Average undergraduate enrollment of each state
#   2: Average admit rate of each state
#   3: Average percent of freshman submitted SAT scores of each state
#   4: Average total price for in-state student living on campus of each state 
#   5: Average total price for out-of-state student living on campus of each state 
# Further, the data is stored in decending order based on the number of undergraduates
college_table <- college_admission_no_NA %>%
  group_by(State.abbreviation) %>%
  summarise(
    average_undergraduate = round(mean(Estimated.undergraduate.enrollment..total), digits = 0),
    average_admit = round(mean(Percent.admitted...total), digits = 2),
    average_submit_rate = round(mean(Percent.of.freshmen.submitting.SAT.scores), digits = 2),
    average_expense_in_state = round(mean(Total.price.for.in.state.students.living.on.campus.2013.14), digits = 2),
    average_expense_out_state = round(mean(Total.price.for.out.of.state.students.living.on.campus.2013.14), digits = 2)
  ) %>%
  arrange(-average_undergraduate)


#In this table file, we will be renaming the variable/column names so it is readable to viwers
college_table_rename <- college_table %>%
  rename("State" = "State.abbreviation",
         "Average Undergraduate Enrollment" = "average_undergraduate",
         "Average Admit Rate (%)" = "average_admit",
         "Average SAT submit rate (%)" = "average_submit_rate",
         "In-state average on campus expense ($)" = "average_expense_in_state",
         "Out-state average on campus expense ($)" = "average_expense_out_state"
         )

