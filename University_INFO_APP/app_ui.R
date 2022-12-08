library(shiny)
library(plotly)

# This is the main ui page for our app. Please put your work in desired sections.

#----------------------------------------------------------------------------#
# Introductory page(introductory_page), create by: Jett
intro_text <- fluidPage(
  h3("Examining the Potential Biases of the American College"),
  p("The college application process can be frustrating. Getting information on colleges and universities, looking for financial aid, looking for the desired degree, as well as balancing school life is usually extremely challenging. To help the users experiencing difficulties, our project enables students to search for specific data (e.g. total number of enrollments, ACT/SAT scores, tuition) on a university. Our project plans to help the users to save time as all the information is in one place which makes the overall research process of the university faster and more efficient. For our project, we plan to have a search bar where users can search for information regarding a specific university. Moreover, we plan to design a filter function that allows users to select colleges that has specific characteristics. For example, users would be able to select colleges that give student loan aid to first-year students, colleges that have a high percentage of a certain race, and moreover.")
)

introductory_page <- tabPanel(
  "Introduction",
  h3("Do US Colleges Operate with Predjudice?"),
  intro_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 1(interactive_page_1), create by: Hanjiang Xu
inter_one_text <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      helpText("This side panle provides five variables that could be displayed.
               The variables are the following: "),
      radioButtons(
        inputId = "var",
        label = "Variable selections:",
        choices = c("State Average Admission Rate" = "average_admitted",
                    "State Average SAT Submission Rate" = "average_SAT_sub",
                    "State Average Enrollment " = "average_enroll",
                    "State Average on Campus Living Expenses" = "average_p_on",
                    "State Average White Students Precentage" = "average_w_p"),
        selected = "average_admitted"
      )
    ),
    mainPanel(
      plotOutput("inter_one"),
      strong("Analysis:"),
      br(),
      p("The visualization above is a choropleth map that displays the average of each
        variables in each states of the U.S. The variavbles displayed including:",
        em("average Admission, average SAT submission rate, aver enrollment, average on
           campus living expenses and average whit student precentage."),
        "In this visualization, a darker color means a higher number of the variable. ")
    )
  )
)

interactive_page_1 <- tabPanel(
  "Choropleth map",
  h3("Interactive Visulization #1"),
  inter_one_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 2(interactive_page_2), create by: Hanjiang Xu
inter_two_text <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      helpText("This side panle provides the selection of four pairs correlations 
               that coule be displayed"),
      selectInput(
        inputId = "corr",
        label = "Correlations selections: Admission Rate vs.",
        choices = c("SAT Submission Rate" = "average_SAT_sub",
                    "Enrollment " = "average_enroll",
                    "Campus Living Expenses" = "average_p_on",
                    "White Students Precentage" = "average_w_p"),
        selected = "average_SAT_sub"
      )
    ),
    mainPanel(
      plotOutput("inter_two"),
      strong("Analysis:"),
      br(),
      p("This visualization displays a scatter plot with a smooth line that shows 
        the correlation between variables. Each selection in the left side panle 
        will give a different correlation polt between variables. For example, 
        the smooth line shows that there might be a slightly negative correlation 
        between admission rate and SAT submission rate. This is a understandable 
        prediction since schools that require SAT scores are usually more competetive.")
    )
  )
)

interactive_page_2 <- tabPanel(
  "Correlations between variables",
  h3("Interactive Visulization #2"),
  inter_two_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Interactive page 3(interactive_page_3), create by:
inter_three_text <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a Statistical Category to Examine on a State-by-state Basis"),
      selectInput(
        inputId = "table",
        label = "Correlations selections: Admission Rate vs.",
        choices = c("SAT Submission Rate" = "average_SAT_sub",
                    "Enrollment" = "average_enrollment",
                    "Admission Rate" = "average_admission"),
        selected = "average_SAT_sub"
      )
    ),
    mainPanel(
      plotOutput("inter_three"),
      strong("Analysis:"),
      br(),
      p("This visualization shows different statistical catergories on a state-by-state basis, allowing the user to closely
        examine the potential correlations, or non-correlations between the categories of their choosing.")
    )
  )
)


interactive_page_3 <- tabPanel(
  "State by State Analysis",
  h3("Interactive Visualization #3"),
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

