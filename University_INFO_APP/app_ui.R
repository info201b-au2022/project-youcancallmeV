library(shiny)
library(plotly)

# This is the main ui page for our app. Please put your work in desired sections.

#----------------------------------------------------------------------------#
# Introductory page(introductory_page), create by: Jett
intro_text <- fluidPage(
  h3("Examining the Potential Biases of the American College"),
  p("The college application process can be frustrating.
    Getting information on colleges and universities, looking for 
    financial aid, looking for the desired degree, as well as balancing 
    school life is usually extremely challenging. What's more, the selection process 
    that colleges go through has been faced with increasing scrutiny in the current times, causing many 
    prospective college student to have a want or need examine the results of how colleges from different areas 
    run their acceptance process. To help the users that are 
    experiencing difficulties understanding such a complex topic, our project enables students to quickly gain an understanding of multiple statistical categories 
    (e.g. total number of enrollments, ACT/SAT scores, tuition) 
    on universities, as well as compare that data on a state-by-state basis. The data set we use, covers around 1,534 institutions in America and 108 characteristic that colleges might obtain. 
    This dataset, sourced from each indivudual university and compiled by Samson Qian of The Massachusetts Institute of Technology was chosen because of its 
    large scope which encompasses almost every college in the United States, as well as its data points that we found were 
    critical to the aims of our project.
    Our project helps the users to save time as all 
    the information is in one place which makes the overall research process of understanding the 
    statistical values that may expose certain places as areas of bias and predjudice quickly and efficiently. Additionally, this project was 
    made in such a data-centric display that allows the viewer to come to their own conclusions regarding the potential
    biases that may exist among higher education within the United States, as ultimately, these prospective students will be the ones making a selection of which university to attend."),
  br(),
  br(),
  strong("What are the key findings?"),
  p(""),
  img(src='cherry2k.jpg', align = "center", width = "100%", height = "100%")
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
        em("average Admission, average SAT submission rate, averrage enrollment, average on
           campus living expenses and average white student percentage."),
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
#Interactive page 2(interactive_page_2), create by: Hanjiang Xu
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
  h2("Number One"),
  h4("Plan Ahead And Set Goals!: Getting information on University and College is extremely time consuming"),
  p("For example, by the visualization that displayed the average of each variables in each states of the U.S including: average 
  admission rate, average SAT submission rate, averrage enrollment, average on campus living expenses and average white student percentage,
    we learned that there are so many schools, information which is difficult. Therefore, this teaches us that we should chose one or two 
    factors to focus on (e.g. geographical, economical, etc.) for application process."), 
  h2("Number Two"),
  h4("Affordable Cost of Attendance"),
  p("As seen in the interaction visualization, cost really affects enrollments rates and more. It is imporatant to look at 
    how much tuition and fees will cost and whether there are different rates for in-state and out-of-state students. Through P1 to P3, we have also 
    found that there are a lot of students having financial aid opportunities and scholarships bringing tuition cost down to a reasonable level
    so there are solutions and good options students could consider!"),
  h2("Number Three"),
  h4("Admission rate and SAT submission rate!"), 
  p("According to the second interactive visualization (the smooth line), there might be a slightly negative correlation between admission
    rate and SAT submission rate. This could be a useful takeaway for students, where the graph indicats that schools that require SAT scores 
    could be more competitive. "),
  h2("Number Four"),
  h4("Admission rate and Geographic locations"),
  p("There is a relationship between the admission rate and it's geographical location From interaction visualization 2, we are able to see that
    California has a low admission rate compared to other states. This could be because schools in that area is really popular (due to high quality education, 
    climate, and the population) where there is an increase in the applications, making the acceptance rate significantly lower than other states. ")
)

summary_page <- tabPanel(
  "Summary takeaways",
  h3("Takeaways"),
  summary_text)
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Report page (report_page), create by:
report_text <- fluidPage(
  
  p(strong("Date 🗓"), 
    "12_07, Autumn 2022"),
  p(strong("Code Name:"), 
    "Sleep, Zebra, Sleep"),
  
  h3("Authors💻"),
  p("Hanjiang Xu (xhj1026@uw.edu)"),
  p("Risa Nabari (risan03@uw.edu)"),
  p("Jett Chang-Lam (jcl9292@uw.edu)"),
  
  h3("Affiliation 🏫"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  
  h3("Abstract:"),
  p("In this project, we are concerned with whether potential college students have an efficient way of selecting 
  a suitable college in the United States. Because there are so many colleges and universities in America, it becomes 
  complicated when doing research. To address this concern, we plan to design a simple tool that allows users to select colleges 
  (colleges/universities included in our database) based on different characteristics (e.g. SAT scores, admission rate, enrollment rate, etc.))"), 
  
  h3("Keywords"),
  p("Education; College Admission; Standarized Test Scores; Acceptance rate; Enrollment"),
  
  h3("Introduction"),
  p("The college application process can be frustrating. Getting information on colleges and universities, 
    looking for financial aid, looking for the desired degree, as well as balancing school life is usually 
    extremely challenging. To help the users experiencing difficulties, our project enables students to search 
    for specific data (e.g. total number of enrollments, ACT/SAT scores, tuition) on a university. Our project 
    plans to help the users to save time as all the information is in one place which makes the overall research 
    process of the university faster and more efficient. For our project, we plan to have a search bar where users 
    can search for information regarding a specific university. Moreover, we plan to design a filter function that 
    allows users to select colleges that has specific characteristics. For example, users would be able to select 
    colleges that give student loan aid to first-year students, admission rate, and moreover."),
  
  h3("Problem Domain"),
  p("In this project, we are concerned with the work load of incoming college students through 
    their college admission process, thus, we decided to make a tool that hopefully eases their college searching process."),
  h4(em("Direct and Indirect Stakeholders")),
  p("The direct stakeholder in our project includes potential college students in the United States, college admissions, 
  and universities in general", 
    em("(Who Are Key Website Project Stakeholders in Higher Education?, 2022)"), 
  ". Our data and visualization would provide students with useful information that eases their pressure 
  on searching for the best college for each individual. The indirect stakeholder of the project would be 
  college promotion departments. By having more exposure from the website, colleges that are less well known 
  yet obtain desirable characteristics will be exposed more to potential students."), 
  h4(em("Human Values")),
  p("Human values such as", 
    strong("inclusion, accessibility"),
    "and",
    strong("respect"),
    "are paramount human values within this problem domain",
    em("(Shahin et al., 2022)"),
    ". We planned this project with the ideas of equity and opportunity in mind in reference to the process that 
    colleges use to determine admission to their school. We want to give an opportunity for people all over who are 
    considering any American university the ability to see and determine for themselves if the colleges that they are 
    considering match with their idea of acceptance and respect. Are these schools equally accepting of all people, and 
    do they treat their prospective students with equal respect."),
  h4(em("Possible harms and benefits")),
  p("Benefits: Filtering information and making the college searching process easier; give less well-known colleges more exposure. 
  Additionally, it allows anyone to have easy access to simple-to-understand data visualizations that assist them in analyzing how 
  each college handles admissions. This has many benefits, whether it be alumni questioning if they support the decisions of their
  alma mater, which may help them determine if they wish to donate to the school. Or prospective professors or workers who are 
  questioning if the place they might work at next aligns with, or is a gross contradiction to their own personal values. 
  Or, as it is relevant to current times, how might this data be affected by affirmative action, and is the actuality of the 
  situation something that someone might wish to support. Similarly, this may assist the average person who is following the current 
  supreme court case in understanding the statistical side of the multi-faceted issue."),
  p("Harms: May direct views to incorrect conclusions based on the relatively limited amount of data in our dataset. Similarly, 
    it may also cause users to disregard more important, user-specific information such as budget or personal geographical location.
    Similarly, there is a chance that this data, as it is slightly out of date, may confuse the reader and cause them to falsely 
    interpret it as data defining the current times rather than treating it as a snapshot of the past. Another potential harms of 
    a selecting tool is it might leads to", 
    strong("over-research"),
    "without realizing that",
    strong("no one institution will fill all requirements"),
    em("(Dix, 2016).")),
  h3("Research Questions"),
  h4(em("How can we improve the data set?")),
  p("This question is important because understanding the data is crucial when utilizing them for a purpose of our project. 
    This enables us to think in-depth and critically, which helps to make a reliable and more powerful project. By improving the data 
    set, we will be able to provide users with more accurate results that might potentially speed up their admission process. Additionally, 
    simply utilizing a larger set of data will often allow for a greater scope of analysis, which would greatly improve the quality and 
    findings of our project."),
  h4(em("How do admissions for each state relate to their geographic locations?")),
  p("This question is important for discussion since region is a very important factor to consider when choosing colleges. Some students
    might prioritize location rather than other factors. In this case, it is important to discuss the difference in admission rate and discover 
    what might be some correlation factors that caused the difference in admission rate. For example, we plan to examine the SAT submission rate 
    of each region. In this case, SAT submission rate might become a mediating variable that directs the relationship between admission rate and 
    geographic locations of each state."),
  h4(em("What is the major concerns when one is choosing college? Is it location? tuition? Or something else.")),
  p("This is an very important question because by discussing it, we will be able to find the general pattern of college choosing. 
    We will be able to figure out the general pattern behind the college admission process and determine what is the top priority of people.
    For example, some people might value college ranking and some might prioritize tuition. As those who are choosing a college to enroll in are
    our primary, and thus, most important stakeholders, it is imperative that we showcase our findings in a way that is digestible to that group 
    of people."),
  
  h3("The Dataset"),
  p("Our central question of this project revolves around the process of choosing college for individuals that are considering going to college. 
    Personally speaking, as college undergraduate students, we believe college searching can be tiring and time consuming for everyone. There are
    numerous colleges and universities across the land of the United States, and it would be a complex process for people to choose the one and only.
    The data set we have found, covered around 1,534 institutions in America and 108 characteristic that colleges might obtain. This data set is a 
    collection of critical information regarding colleges that we are interested in. In this case, we believe this data set would serves our project 
    the best since we intend to build a tool that benefits potential college students the best, and help them reduce their work load as much as 
    possible. In addition, it will help us answer our research questions because for the first question, it focuses on the data set itself and if 
    we are able to analyze and critically think about the data set, we would be able to answer it. Also, the data set allows us to answer the third 
    question of",
    em("What is the major concerns when one is choosing college? Is it location? tuition? Or something else"),
    "to an extent as if we use the data set to make a data visualization, we would be able to analyze the result. 
    For example, we could maybe see the comparison between the data of average expense out of state and the actual 
    number of people enrolling to the college/university. This could maybe tell that even if they do get accepted to a school, 
    they may not enroll due to the financial problem."),
  h5("1.The collector of the data is named Samson Qian who is currently studying his master's at MIT."),
  h5("2.He did not elaborate on the purpose behind this data collection. We believe the creator of this data has no intention of gaining
  money with this data since it is posted on an open website and licensed in the public domain. Individuals doing college admission-related 
  projects will benefit from this data, just like our project. For example, individuals who are doing a SAT/ACT score research might benefit 
  from this data set. Moreover, individuals who are searching for college information might also benefit from this data if they search directly 
  in the data set."), 
  h5("3.Through our research, we find that there might be an issue with the credibility of this database. Our data set was collected on Kaggle, 
  and posted by Samson Qian, who is currently doing a master's of Finance student at the Massachusetts Institute of Technology (MIT) studying 
  Financial Engineering, graduating in December 2022. We have the information of the author which can be somewhat reliable but he does not provide 
  information on where he got the data from which decreases the credibility of the dataset. Yet, we find a lot of the information that are included
  in the data set to match with the current information of colleges (For example, location, zip code). That gives certain validity to our data set."),
  h5("4.We obtained our data set on the internet by searching public data on admission information regarding universities across the United States."),
  
  p("(Table 1. Summary of Dataset)"),
  
 imageOutput("home_img"),

  h3("Expected Limitations"),
  p("The following are some implications of our project:"),
  p("・We expect our findings to provide simple to comprehend data visualizations that help the user more succinctly review their options in 
  college enrollment. For example, users will be able to filter colleges that have one or more specific characteristics."),
  p("・Additionally, the data analysis that we plan to do will allow for the public at large as well as specific donors to have an overview 
  of each college’s student body demographics and background to determine if they want to support their admissions processes. For example, 
  donors might want to support an institution that has an equal distribution of different races."),
  p("・For the design part, we imagine making our platform/website/search tool as simple as possible. We will have features separated, 
    thus user would not be confused by different aspects of our tool. For example, the visualization feature, searching feature and the filtering 
    feature will be three different aspects."),
  
  h3("Limitations"),
  p("The followings are couple of limitations of our projects and database:"),
  p("・Even though our project provides the basic details of institutions, it does not include some key information such as the application 
    deadline. We believe it is important for potential college students to know their deadlines yet our database does not include this information."),
  p("・This data is slightly out of date. The data was published on Kaggle approximately 4 years ago, meaning that it does not provide the 
    most accurate information about current American colleges. Additionally, the intended user is likely to seek additional data regarding 
    colleges that will affect their selections such as University ranking, availability of housing, etc. that our dataset does not provide."),
  p("・Some of the data are not available which limits the amount of data as well as the reliability of the data set itself. For example, 
    Athens State University does not have data on the number of applicants, admission total, acceptance rate, and more. This could be because 
    the university itself is not sharing the information with the public. This can be difficult for students who may be seeking to apply to 
    the university. Overcoming the inconsistencies in the data set is difficult but we could provide a link or a list of the university website 
    or phone number so that it can be easier for the users to gain information."),
  
  h3("Findings"),
  strong("How can we improve the data set?"), 
  p("  -We noticed in the data set was that there were a lot of NA (not available) values. Since we are calculating average, 
  it would be very inconvenient if the school's data is not available. Thus, we excluded the schools that contained NA values in the 
  columns that we desire. Second, we noticed that there were hundreds of different columns which was difficult to see. Thus, 
  we extracted the ones we needed which included: Average undergraduate enrollment of each state, Average admit rate of each state, 
  Average percent of freshman submitted SAT scores of each state, Average total price for in-state studentliving on campus of each state, 
  Average total price for out-of-state student living on campus of each state. With this it is easier to see and will enable us to 
  focus on a specific aspect of the dataset. This was helpful especially for our data set where there were too many values that could be meaningless depending on our research questions."),
  strong("How do admissions for each state relate to their geographic locations?"), 
 p("- We have figured this question out through interactive vizualiation with the choropleth map. From looking at the map (the 
   lighter the color, the lower the admission rate), we noticed that California especially had a low acceptance rate. This is understandable as
   California is a most overcrowded place on the states and a lot of the UC has high quality education and the climate in California is nice where it 
   is warm where having a lot of opportunities to have fun with friends. Thus, this makes the number of applications increase, whcih 
   decreases the admission rate. In addition, we can see that the middle of the United States has a higher admission rate and east/south coast of the 
   United States also have a lower admission rate. Overall, we could say that the coast side has a lower accpetance rate than other states. This could
   be because there are more opportunities and nicer climate (near the beach.)"), 
  strong("What is the major concerns when one is choosing college? Is it location? tuition? Or something else."), 
  p(" - One of the biggest concern is the cost of the whole process including tuition of college, cost of living especially for
    out-of-state students), and the cost to apply. This is because financial problem is something that is difficult to tackle. For example, 
    the payment for the standardized SAT may be not easy for every group. This also includes the location of the college. The college or 
    university is close to your home, this may not be the problem but if the student is willing to go outside the state, the cost to move there, 
    the cost of the dorms and the out of state tuition may be expensive which some student can not afford. Therefore, we have extracted the values 
    of",
    strong("Average total price for in-state student living on campus of each state"),
           "and the", 
    strong("Average total price for out-of-state student living on campus of each state.")), 
    
  h3("Discussion"),
  p("When making the interactive visualization, we have specifically chopsen the data on 
  Average undergraduate enrollment, average admit rate, and average SAT submission rate of each state across the United States. 
  These findings were really important to the students planning to apply to a college/university and parents or members who will be paying 
  for the tuition or the application fee depending on the states. For the students, it is important to understand the average admission rate 
  because it will allow them chose safety as well as reach schools easily, which helps them to plan well ahead. In addition, we made it easier for the 
  users to understand the information by having a choropleth map which allows them to see differences in each state only by the difference in colors. 
  In addition, average SAT submission rate may also be helpful because it will give an insight if the student will need to submit the SAT and if the students is not 
  satisfied with the result of the SAT, they could have a plan to apply to a place that does not have a high SAT submission rate. For example, 
  looking at the interactive visualization for SAT submission rate, we can see that the south and east coast of the United States have higher submission 
  rate compared other states which gives an insight that schools in those places may require SAT scores compared to other states. We have also noticed that
  there may be a relationship between submission rate and admission rate. For example, California has a higher rate of submission rate and lower admission rate, and the
  middle states (states not in the coast side) had low SAT submission  rate and higher admission rate which could indicate that there is a negative
  correlation between than which makes sense as schools in California is more competitive so they may require SAT submission to differentiate applicants 
  in various ways. Therefore, through these information and the chart which shows the data visualization, audience are able to research the 
    efficient way of selecting a suitable college in the United States."), 
  h3("Conclusion"),
  p("Our main focus was to find an efficient way of selecting a suitable college in the United States. To address this concern, we designed 
    a simple application that allows users to select colleges (colleges/universities included in our database) based on different characteristics.
    We made a filter function (using the widgets on Shiny) which allows us to select State Average Admission Rate, State Average SAT Submission Rate, 
    State Average Enrollment, State Average on Campus Living Expenses, and State Average White Students Precentage. We have specifically focused on 
    these information as we thought this was the most relevant and useful information when doing a research on University/College application as it 
    includes information on academics, economic, and the geographical location. In addition, even though our project provides the basic details of 
    institutions, it did not include some key information such as the application deadline. We believe it is important for potential college students to know their deadlines yet our 
    database does not include this information. If there is an opportunity to do the same project, we would like to use more datasets to increase 
    reliability as this data set is slightly out of date. Our data set was collected on Kaggle, and posted by Samson Qian, but the author did not 
    provide information on where he got the data. However, overall, I believe it gave a lot of helpful insights for finding an efficient way of 
    selecting a suitable college which has a lot of potential. Overall, we hope this application can help students who are stuck on University/College
    research to use our tool to have a broad idea for each of the data. From there, we would recommend more detailed research on their intended schools."),
  h3("Acknowledgements"),
  p("We would like to thank the individual, Samson Qian, who had published this data on Kaggle. This data collection have gave us a lot of 
  inspiration on our project."),
  h3("References"),
  p("The following is the citation to our database:"),
 
    em("College Admissions. (2018, November 27). Kaggle. https://www.kaggle.com/datasets/samsonqian/college-admissions"), 
    p("The followings are few other research we came across while finding the best data for our project:"),
    p(em("    * Dix, W. (2016, July 25). The Agony Of College Choice And How To Get Through It. Forbes. 
    https://www.forbes.com/sites/willarddix/2016/07/25/the-agony-of-college-choice-and-how-to-get-through-it/?sh=51bfbfe53e53")),
 
    p(em("    * Who Are Key Website Project Stakeholders in Higher Education? (2022, January 19). OHO Interactive. 
   https://www.oho.com/blog/website-project-stakeholders-higher-education")),
 
    p(em("    * Shahin, M., Chaudron, M. R., Hussain, W., Shams, R., Perera, H., Oliver, G., & Whittle, J. (2022). 
    Human values in software development artefacts: A case study on issue discussions in three Android applications. 
    Information and Software Technology, 141, 106731. https://doi.org/10.1016/j.infsof.2021.106731")), 

  h3("Thank you for visiting our site!!"))
  

report_page <- tabPanel(
  "Report",
  h3("Report: INFO on Universities in the United States:"),
  report_text)

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

