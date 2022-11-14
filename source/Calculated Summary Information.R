# Project 2 - Calculated summary information 
# This is the .R source file that calculates summary information to included in our report
# The code for calculation are following

# Following is our date set named 'college_admission'
college_admission <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv")

# Following are five values that our project is going to be calculating: 
#   Average percent admitted rate of each state, 
#   Average estimated undergraduate enrollment, 
#   Average percent of freshman submitted SAT/ACT scores, 
#   Average total price for in-state student living on campus,  
#   Average total price for out-state student living on campus. 

# This is a aggregated data table that include information used for calculation 
college_admission_aggregated <- college_admission %>%
  group_by(State.abbreviation) %>%
  select(
    Name, 
    State.abbreviation, 
    Total.price.for.in.state.students.living.on.campus.2013.14,
    Percent.admitted...total,
    Percent.of.freshmen.submitting.ACT.scores,
    Percent.of.freshmen.submitting.ACT.scores,
    Estimated.undergraduate.enrollment..total
    
  )



