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
#source("C:/Users/stlp/Documents/info201/assignments/Project1/project-youcancallmeV/University_INFO_APP/Calculations_by_V.R")
#source("~/Documents/info201/project-youcancallmeV/University_INFO_APP/Calculations_by_V.R")
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
    } else if(input$var == "average_w_p"){
      inter_1_map <- ggplot(df_map, aes(long, lat, group = group, fill = average_w_p)) +
        geom_polygon(color="grey") + 
        scale_fill_continuous(low = "palegreen", high = "palegreen4")  +
        labs(title = "United States University/College Average White Students Percentage") + 
        theme_bw()
      print(inter_1_map)
    }
  })
  #----------------------------------------------------------------------------#
  
  #----------------------------------------------------------------------------#
  # renders for interactive page 2, created by: Hanjiang Xu (V)
  output$inter_two <- renderPlot({
    if(input$corr == "average_SAT_sub"){
      inter_2_scatter <- ggplot(data = df_inter_12, mapping = aes(x = Admission, y = SAT)) +
        geom_point(color = "deepskyblue") + 
        geom_smooth(color = "dodgerblue4") + 
        labs(title = "Correlation between admission rate and SAT submission rate",
             x = "Admission Rate (%)",
             y = "SAT Submission Rate (%)")
      print(inter_2_scatter)
    } else if(input$corr == "average_enroll"){
      inter_2_scatter <- ggplot(data = df_inter_12, mapping = aes(x = Admission, y = Enrollment)) +
        geom_point(color = "darkorange1") + 
        geom_smooth(color = "darkorange4") + 
        labs(title = "Correlation between admission rate and undergraduate enrollment",
             x = "Admission Rate (%)",
             y = "Undergraduate Enrollment")
      print(inter_2_scatter)
    } else if(input$corr == "average_p_on"){
      inter_2_scatter <- ggplot(data = df_inter_12, mapping = aes(x = Admission, y = on)) +
        geom_point(color = "deepskyblue3") + 
        geom_smooth(color = "darkslategray4") + 
        labs(title = "Correlation between admission rate and on campus living expenses",
             x = "Admission Rate (%)",
             y = "On Campus Living Expenses ($)")
      print(inter_2_scatter)
    } else if(input$corr == "average_w_p"){
      inter_2_scatter <- ggplot(data = df_inter_12, mapping = aes(x = Admission, y = precent)) +
        geom_point(color = "goldenrod1") + 
        geom_smooth(color = "goldenrod4") + 
        labs(title = "Correlation between admission rate and white student precentage",
             x = "Admission Rate (%)",
             y = "White Student Precentage (%)")
      print(inter_2_scatter)
    }

  })
  #----------------------------------------------------------------------------#
  # renders for interactive page 3, created by: Jett Chang-Lam
  output$inter_three <- renderPlot({
    if(input$table == "average_SAT_sub"){
      inter_3_table <- ggplot(data = df_inter_12 ) +
        geom_point(
          mapping = aes(x = state , y = SAT),
          color = "blue",
          alpha = .3
        ) + 
        labs(
          title = "SAT submission rates of each state",
          y = "Percentage", x = "State") +
        coord_flip()
      print(inter_3_table)
    } else if(input$table == "average_enrollment"){
      inter_3_table <- ggplot(data = df_inter_12 ) +
        geom_point(
          mapping = aes(x = state , y = Enrollment),
          color = "blue",
          alpha = .3
        ) + 
        labs(
          title = "Student body sizes rates of each state",
          y = "Enrollment", x = "State") +
        coord_flip()
      print(inter_3_table)
    } else if(input$table == "average_admission"){
      inter_3_table <- ggplot(data = df_inter_12, aes(x = state, y = Admission)) +
        geom_point(
          mapping = aes(x = state , y = Admission),
          color = "blue",
          alpha = .3
        ) +
        labs(
          title = "Admission rates of each state",
          y = "Admission Percentage", x = "State") +
        scale_size(range = c(0, 100)) +
        coord_flip()
      print(inter_3_table)
    }
  })
  
}

server <- function(input, output){
  output$home_img <- renderImage({
    
    list(src = "www/table_img.png",
         width = "50%",
         height = 130)
    
  }, deleteFile = FALSE)
}

inter_3_table <- ggplot(data = df_inter_12 ) +
  geom_point(
    mapping = aes(x = state , y = SAT),
    color = "blue",
    alpha = .3
  ) + 
  labs(
    title = "SAT submission rates of each state",
    y = "Percentage", x = "State") +
  coord_flip()
print(inter_3_table)
  