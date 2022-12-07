library(shiny)
library(plotly)

# This is the main ui page for our app. Please put your work in desired sections.

#----------------------------------------------------------------------------#
# Introductory page(introductory_page), create by: name
intro_text <- fluidPage(
  h3("headings"),
  p("page content")
)

introductory_page <- tabPanel(
  "Introduction",
  h3("some heading"),
  intro_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 1(interactive_page_1), create by: Hanjiang Xu
inter_one_text <- fluidPage(
  h3("headings"),
  p("page content"),
  textOutput(outputId = 'inter_one')
)

interactive_page_1 <- tabPanel(
  "Visulization #1",
  h3("some heading"),
  inter_one_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 2(interactive_page_2), create by: Hanjiang Xu
inter_two_text <- fluidPage(
  h3("headings"),
  p("page content"),
  textOutput(outputId = 'inter_two')
)

interactive_page_2 <- tabPanel(
  "Visulization #2",
  h3("some heading"),
  inter_two_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 3(interactive_page_3), create by:
inter_three_text <- fluidPage(
  h3("headings"),
  p("page content")
)

interactive_page_3 <- tabPanel(
  "Visulization #3",
  h3("some heading"),
  inter_three_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Summary page (summary_page), create by:
summary_text <- fluidPage(
  h3("headings"),
  p("page content")
)

summary_page <- tabPanel(
  "Summary takeaways",
  h3("some heading"),
  summary_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Summary page (interactive_page_3), create by:
summary_text <- fluidPage(
  h3("headings"),
  p("page content")
)

interactive_page_3 <- tabPanel(
  "Summary takeaways",
  h3("some heading"),
  summary_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Report page (report_page), create by:
report_text <- fluidPage(
  h3("headings"),
  p("page content")
)

report_page <- tabPanel(
  "Report",
  h3("some heading"),
  summary_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# UI
ui <- navbarPage(
  "INFO on Universities in the United States",
  introductory_page,
  interactive_page_1,
  interactive_page_2,
  interactive_page_3,
  summary_page,
  report_page
)