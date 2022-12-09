#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

library(shiny)

#source the ui and server files  
source("app_ui.R")
source("app_server.R")


# Run the application 
shinyApp(ui = ui, server = server)
