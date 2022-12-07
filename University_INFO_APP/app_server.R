library(shiny)
library(dplyr)
library(tidyverse)

college_admission <- read.csv(
  "https://raw.githubusercontent.com/info201b-au2022/project-youcancallmeV/main/data/College%20Admission.csv",
  stringsAsFactors = FALSE)
# Aggregate the data set 
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

# ignore all the NA, this is the main data frame that we are going to use 
college_df <- college_admission_aggregated[complete.cases(college_admission_aggregated), ]

#----------------------------------------------------------------------------#
# This following section is calculations by V.
# calculations used for visualization 1 & 2 
df_inter_12 <- college_df
df_inter_12$State.abbreviation <- tolower(df_inter_12$State.abbreviation)

# Change the column names for better understanding 
colnames(df_inter_12) <- c("Name", "state", "Admission", "SAT", "Enrollment", "on", "off")

# Calculate the average for each variable for all states
df_inter <- df_inter_12 %>%
  group_by(state) %>%
  mutate(
    average_admitted = mean(Admission),
    average_SAT_sub = mean(SAT),
    average_enroll = mean(Enrollment),
    average_p_on = mean(on),
    average_p_off = mean(off)
  ) 

# get lat and lng of the states 
df_map <- map_data("state") %>%
  group_by(region) %>%
  rename(state = region) %>%
  left_join(df_inter, by = "state")
#----------------------------------------------------------------------------#


#----------------------------------------------------------------------------#
# Following is the server function 
server <- function(input, output){
  
  #----------------------------------------------------------------------------#
  # renders for interactive page 1, created by: Hanjiang Xu (V)
  output$inter_one <- renderPlot({
    if(input$var == "average_admitted"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_admitted)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "cadetblue1", high = "darkblue") +
        labs(title = "United States University/College Average Admisson") + theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_SAT_sub"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_SAT_sub)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "coral", high = "coral3") +
        labs(title = "United States University/College Average SAT Submission Rate") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_enroll"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_enroll)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "darkorchid1", high = "darkorchid") +
        labs(title = "United States University/College Average Undergraduate Enrollment") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_p_on"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_p_on)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "cadetblue1", high = "darkblue") +
        labs(title = "United States University/College Average Living Price on Campus") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_p_off"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_p_off)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "cadetblue1", high = "darkblue")  +
        labs(title = "United States University/College Average Living Price off Campus") + 
        theme_bw()
      print(inter_1_map)
    }
  })
  #----------------------------------------------------------------------------#
  
  #----------------------------------------------------------------------------#
  # renders for interactive page 2, created by: Hanjiang Xu (V)
  output$inter_two <- renderText({
    inter_2 <- paste0("this would be the second visulization")
    return(inter_2)
  })
  #----------------------------------------------------------------------------#
  
}
