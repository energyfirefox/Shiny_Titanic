
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Do you had a chance for surviving?"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(    
    radioButtons(inputId="sex", label="Your Sex", choices= c("male", "female")),
    sliderInput("age",
                "Your age:",
                min = 0,
                max = 80,
                value = 40)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3('Result of prediction:'),
    verbatimTextOutput("prediction"),
    plotOutput("distPlot")  

  )
))
