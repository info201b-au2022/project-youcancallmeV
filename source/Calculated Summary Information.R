# Project 2 - Calculated summary information 
# This is the .R source file that calculates summary information to included in our report
# The code for calculation are following

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# This is a aggregated data table that include information used for calculation 
college_admission_aggregated <- college_admission %>%
  group_by(State.abbreviation) %>%
  select(
    Name, 
    State.abbreviation, 
    Percent.admitted...total,
    Percent.of.freshmen.submitting.ACT.scores,
    Percent.of.freshmen.submitting.ACT.scores,
    Estimated.undergraduate.enrollment..total,
    Total.price.for.in.state.students.living.on.campus.2013.14,
    Total.price.for.out.of.state.students.living.on.campus.2013.14
  )

# Since we are calculating average, it would be very inconvenient if the school's data is not available
# Thus, we will be excluding the schools that contains NA values in the columns we desire 
college_admission_no_NA <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]
View(college_admission_no_NA)

# Following are five values that our project is going to be calculating: 
#   Average percent admitted rate of each state
percant_admitted <- college_admission_no_NA %>%
  group_by(State.abbreviation) %>%
  summarise(
    average_admit = mean(Percent.admitted...total)
  )
  
#   Average estimated undergraduate enrollment
estimate_undergraduate <- college_admission_no_NA %>%
  group_by(State.abbreviation) %>%
  summarise(
    average_undergraduate = mean(Estimated.undergraduate.enrollment..total)
  )
  
#   Average percent of freshman submitted SAT/ACT scores

#   Average total price for in-state student living on campus

#   Average total price for out-of-state student living on campus

