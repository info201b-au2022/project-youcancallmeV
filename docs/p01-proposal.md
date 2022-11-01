# Information on Universities in the United States Project Proposal
**Code Name:** _Sleep, Zebra, Sleep_

## Authors
**Hanjiang Xu**    xhj1026@uw.edu
<br>
**Risa Nabari**    risan03@uw.edu
<br>
**Jett Chang-Lam**    jcl9292@uw.edu

## Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## Date 🗓
10/28, Autumn 2022

## Abstract
In this project, we are concerned with whether potential college students have an efficient way of selecting a suitable college in the United States. Because there are so many colleges and universities in America, it becomes complicated when doing research. To address this concern, we plan to design a simple tool that allows users to select colleges ( colleges/universities included in our database) based on different characteristics(e.g. SAT scores, race population percentage, undergraduate enrollment, etc.)

## Keywords
Education; Identity (Race, Gender); Admission; Department; Acceptance rate; Enrollment; Graduation

## Introduction
The college application process can be frustrating. Getting information on colleges and universities, looking for financial aid, looking for the desired degree, as well as balancing school life is usually extremely challenging. To help the users experiencing difficulties, our project enables students to search for specific data (e.g. total number of enrollments, ACT/SAT scores, tuition) on a university. Our project plans to help the users to save time as all the information is in one place which makes the overall research process of the university faster and more efficient. For our project, we plan to have a search bar where users can search for information regarding a specific university. Moreover, we plan to design a filter function that allows users to select colleges that has specific characteristics. For example, users would be able to select colleges that give student loan aid to first-year students, colleges that have a high percentage of a certain race, and moreover.

## Problem Domain (400 words)(***done***)
**_Direct and Indirect Stakeholders_**
* The direct stakeholder in our project is high school seniors and potential college students in the United States. Our data and visualization would provide them with useful information that eases their pressure on searching for the best college for each individual. The indirect stakeholder of the project would be college admissions officers. Colleges that are less well known yet obtain desirable characteristics will be exposed more to potential college students.

**_Human values_**
* Acceptance and respect are paramount human values within this problem domain. We planned this project with the ideas of equity and opportunity in mind in reference to the process that colleges use to determine admission to their school. We want to give an opportunity for people all over who are considering any American university the ability to see and determine for themselves if the colleges that they are considering match with their idea of acceptance and respect. Are these schools equally accepting of all people, and do they treat their prospective students with equal respect.

**_Possible harms and benefits_**
* Benefits: Filtering information and making the college searching process easier; give less well-known colleges more exposure. Additionally, it allows anyone to have easy access to simple-to-understand data visualizations that assist them in analyzing how each college handles admissions. This has many benefits, whether it be alumni questioning if they support the decisions of their alma mater, which may help them determine if they wish to donate to the school. Or prospective professors or workers who are questioning if the place they might work at next aligns with, or is a gross contradiction to their own personal values. Or, as it is relevant to current times, how might this data be affected by affirmative action, and is the actuality of the situation something that someone might wish to support. Similarly, this may assist the average person who is following the current supreme court case in understanding the statistical side of the multi-faceted issue.
* Harms: May direct views to incorrect conclusions based on the relatively limited amount of data in our dataset. Similarly, it may also cause users to disregard more important, user-specific information such as budget or personal geographical location. Similarly, there is a chance that this data, as it is slightly out of date, may confuse the reader and cause them to falsely interpret it as data defining the current times rather than treating it as a snapshot of the past. Another potential harms of a selecting tool is it might leads to "over-research" without realizing that "no one institution will fill all requirements" (Dix, 2016).  


## Research Questions (3-5 Questions)
* Present your 3-5 research questions. You should present each research question. For each research question, you should discuss why it is important and what motivates the question. (About 50 words for each question, so for four questions you would write about 200 words or more if needed.)
* How does admissions for each American university relate on the factor of race of admitted students to the racial breakdown of the surrounding city's population?
  * This is important because this is a genuine implemented process which reflects upon the character of the University. Many incoming college students place value upon the moral standings of people, organizations, and corporations. Colleges are no exception. Understanding the values of the institution that one will choose to spend four or more years at is of the utmost importance to many students, especially in the current political climate.

## The Dataset (400 words)
* Describe how your dataset is related to your problem domain and, specifically, to your research questions. That is, how will your dataset enable you to answer your research questions?
* Finally, describe the provenance of your dataset, addressing such key questions as: (a) Who collected the data? When? For what purpose? (b) How was the data collection effort funded? Who is likely to benefit from the data or make money? (c) How was the data validated and held secure? Is it credible and trustworthy? (d) How did you obtain the data? Do you credit the source of the data? (About 400 words.)

| Title | Number of Variables | Number of observations | Citation/URLs |
| ------------- | -------------  | ------------- |  ------------- |
|IPEDS Data | 108 | 1534 | College Admissions. (2018, November 27). Kaggle. https://www.kaggle.com/datasets/samsonqian/college-admissions |

## Expected Implications (67/150)
Following are the two implications of our project:
* We expect our findings to provide simple to comprehend data visualizations that help the user more succinctly review their options in college enrollment.
* Additionally, the data analysis that we plan to do, will allow for the public at large as well as specific donors to have an overview of each college’s student body demographics and background to determine if they want to support their admissions processes.

## Limitations (150 words)
Following are couple of limitations of our projects and database
  * Even though our project provides the basic details of institutions, it does not include some key information such as application deadline. We believe it is important for potential college students to know their deadlines yet our database does not include this information.
  * This data is slightly out of date. The data was published on Kaggle approximately 4 years ago, meaning that it does not provide the most accurate information about current American colleges. Additionally, the intended user is likely to seek additional data regarding colleges that will affect their selections such as University ranking, availability of housing, etc. that our dataset does not provide.
  * application requirements

## Acknowledgements
We would like to thank the individual, Samson Qian, who had published this data on Kaggle. This data collection have gave us a lot of inspiration on our project.

## References
Following are few other research we came across while finding the best data for our project
  * _Dix, W. (2016, July 25). The Agony Of College Choice And How To Get Through It. Forbes. https://www.forbes.com/sites/willarddix/2016/07/25/the-agony-of-college-choice-and-how-to-get-through-it/?sh=51bfbfe53e53_
  * _Brint, Steven. American College Catalog Study Database, 1975-2011. Inter-university Consortium for Political and Social Research [distributor], 2013-11-01. https://doi.org/10.3886/ICPSR34851.v1_
  * _College Enrollment, Credit Attainment and Remediation of High School Graduates Statewide | Connecticut Data. (2021, May 3). https://data.ct.gov/Education/College-Enrollment-Credit-Attainment-and-Remediati/vb5y-z4r7_

## Appendix A: Questions
One of the question concerned about this project is the complexity of our data. Since the data we find have 108 variables, it is impossible for us to use all the data that are provided. While building our project, can we select the data that we think it's necessary to include?  
