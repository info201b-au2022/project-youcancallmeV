library(shiny)
library(dplyr)
library(tidyverse)

#This is the 
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

# Source the calculations from V
source("~/Documents/info201/projects/project-youcancallmeV/University_INFO_APP/Calculations_by_V.R")

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
        scale_fill_continuous(low = "coral", high = "coral4") +
        labs(title = "United States University/College Average SAT Submission Rate") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_enroll"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_enroll)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "orchid1", high = "darkorchid4") +
        labs(title = "United States University/College Average Undergraduate Enrollment") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_p_on"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_p_on)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "darkslategray1", high = "darkslategray4") +
        labs(title = "United States University/College Average Living Price on Campus") + 
        theme_bw()
      print(inter_1_map)
    } else if(input$var == "average_p_off"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_p_off)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "palegreen", high = "palegreen4")  +
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
