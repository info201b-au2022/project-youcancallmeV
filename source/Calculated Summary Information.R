# Project 2 - Summary_info.R
# This is the .R source file that calculates summary information to included in our report
# The code for calculation are following

library(dplyr)

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# This is a aggregated data set that include information used for calculation
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
college_table <- college_admission_no_NA %>%
  group_by(State.abbreviation) %>%
  summarise(
    average_undergraduate = round(mean(Estimated.undergraduate.enrollment..total), digits = 0),
    average_admit = round(mean(Percent.admitted...total), digits = 2),
    average_submit_rate = round(mean(Percent.of.freshmen.submitting.SAT.scores), digits = 2),
    average_expense_in_state = round(mean(Total.price.for.in.state.students.living.on.campus.2013.14), digits = 2),
    average_expense_out_state = round(mean(Total.price.for.out.of.state.students.living.on.campus.2013.14), digits = 2)
  )

# The original data set have a lot confusing column names, changed for better understanding  
colnames(college_table) <- c(
  "State",
  "Undergraduate Enrollment",
  "Admit Rate (%)",
  "SAT submit rate (%)", 
  "On campus (in-state) total expense ($)", 
  "On campus (out-of-state) total expense ($)"
  )

# Following will be the summary info of our calculation 
summary_info <- list(college_table)
summary_info$num_observations <- nrow(college_table)

# State with highest average undergraduate enrollment
summary_info$highest_average_undergraduate <- college_table %>%
  filter(`Undergraduate Enrollment` == max(`Undergraduate Enrollment`, na.rm = T)) %>%
  select(State) %>%
  pull()

# State with highest admit rate 
summary_info$highest_admit_rate <- college_table %>%
  filter(`Admit Rate (%)` == max(`Admit Rate (%)`, na.rm = T)) %>%
  select(State) %>%
  pull()

# State with highest SAT submit rate 
summary_info$SAT_rate <- college_table %>%
  filter(`SAT submit rate (%)` == max(`SAT submit rate (%)`, na.rm = T)) %>%
  select(State) %>%
  pull()

# State with highest in-state on campus expense
summary_info$in_state_expense <- college_table %>%
  filter( `On campus (in-state) total expense ($)` == max(`On campus (in-state) total expense ($)`, na.rm = T)) %>%
  select(State) %>%
  pull()

# State with highest out-of-state on campus expense
summary_info$out_state_expense <- college_table %>%
  filter( `On campus (out-of-state) total expense ($)` == max(`On campus (out-of-state) total expense ($)`, na.rm = T)) %>%
  select(State) %>%
  pull()

print_summary_info <- function(){
 t <- print(college_table)
 return(t)
}

