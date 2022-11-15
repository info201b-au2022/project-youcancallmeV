# Project 2 - Chart #2
# This is the .R source file for the second chart of our report
# The code for the chart are following
library(dplyr)
library(tidyverse)

# Follow will be the same code get to our 
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# Following code would give us the data used for charts 
# Filtering information needed
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
#exclude NA values 
college_admission_no_NA <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]
#Calculation 
college_table <- college_admission_no_NA %>%
  group_by(State.abbreviation) %>%
  summarise(
    average_undergraduate = round(mean(Estimated.undergraduate.enrollment..total), digits = 0),
    average_admit = round(mean(Percent.admitted...total), digits = 2),
    average_submit_rate = round(mean(Percent.of.freshmen.submitting.SAT.scores), digits = 2),
    average_expense_in_state = round(mean(Total.price.for.in.state.students.living.on.campus.2013.14), digits = 2),
    average_expense_out_state = round(mean(Total.price.for.out.of.state.students.living.on.campus.2013.14), digits = 2)
  ) %>%
  arrange(-average_submit_rate)

# Following code will compute the second chart, which includes the average SAT submission rate of each state  
chart_2 <- ggplot(college_table, aes(x = reorder(State.abbreviation, -average_submit_rate), y = average_submit_rate)) + 
  geom_bar(stat = "identity") +
  coord_flip()

print(chart_2 + labs(
  title = "Chart #2 Average SAT submit rate of each state",
  y = "Percentage", x = "States"))
