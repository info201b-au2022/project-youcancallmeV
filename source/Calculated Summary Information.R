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

# Following is a list create to store summary information of our dataset 
summary_info <- list(college_admission_aggregated)
summary_info$num_observations <- nrow(college_admission_aggregated)

# summary info 1: schools with highest admit rate in each state
summary_info$max_admit_rate <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Percent.admitted...total == max(Percent.admitted...total, na.rm = T)) %>%
  select(State.abbreviation, Name, Percent.admitted...total)

# summary info 1: schools with highest admit rate in each state
summary_info$max_admit_rate <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Percent.admitted...total == max(Percent.admitted...total, na.rm = T)) %>%
  select(State.abbreviation, Name, Percent.admitted...total)

# summary info 2: schools with highest SAT score submit rate
summary_info$max_SAT_rate <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Percent.of.freshmen.submitting.SAT.scores == max(Percent.of.freshmen.submitting.SAT.scores, na.rm = T)) %>%
  select(State.abbreviation, Name, Percent.of.freshmen.submitting.SAT.scores)

# summary info 3: schools with highest undergraduate enrollment
summary_info$max_SAT_rate <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Estimated.undergraduate.enrollment..total == max(Estimated.undergraduate.enrollment..total, na.rm = T)) %>%
  select(State.abbreviation, Name, Estimated.undergraduate.enrollment..total)

# summary info 4: schools with highest in-state(on campus) expense in each state
summary_info$max_SAT_rate <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Total.price.for.in.state.students.living.on.campus.2013.14 == max(Total.price.for.in.state.students.living.on.campus.2013.14, na.rm = T)) %>%
  select(State.abbreviation, Name, Total.price.for.in.state.students.living.on.campus.2013.14)

# summary info 5: schools with highest out-of-state(on campus) expense in each state
summary_info$max_out_state_tuition <- college_admission_aggregated %>%
  group_by(State.abbreviation) %>%
  filter(Total.price.for.out.of.state.students.living.on.campus.2013.14 == max(Total.price.for.out.of.state.students.living.on.campus.2013.14, na.rm = T)) %>%
  select(State.abbreviation, Name, Total.price.for.out.of.state.students.living.on.campus.2013.14)

print(summary_info)

