library(shiny)
library(dplyr)

# This is the main server page for our app. Please put your work in desired sections. 

server <- function(input, output){
  
  #----------------------------------------------------------------------------#
  # renders for interactive page 1 
  output$inter_one <- renderText({
    inter_1 <- paste0("this would be the first visulization")
    return(inter_1)
  })
  #----------------------------------------------------------------------------#
  
  #----------------------------------------------------------------------------#
  # renders for interactive page 2
  output$inter_two <- renderText({
    inter_2 <- paste0("this would be the second visulization")
    return(inter_2)
  })
  #----------------------------------------------------------------------------#
  
}