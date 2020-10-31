#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Cancer Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("Split",
                   "Minimum Split:",
                   min = 2,
                   max = 60,
                   value = 20),
       numericInput("Clump","Clump Size:",
                    min = 1,max = 10,value = 5),
       numericInput("UniCell_Size","UniCell_Size:",
                    min = 1,max = 10,value = 5),
       numericInput("Uni_CellShape","Uni_CellShape:",
                    min = 1,max = 10,value = 5),
       numericInput("MargAdh","MargAdh:",
                    min = 1,max = 10,value = 5),
       numericInput("SEpith","SEpith:",
                    min = 1,max = 10,value = 5),
       numericInput("BareN","BareN:",
                    min = 1,max = 10,value = 5),
       numericInput("BChromatin","BChromatin:",
                    min = 1,max = 10,value = 5),
       numericInput("NoemN","NoemN:",
                    min = 1,max = 10,value = 5),
       numericInput("Mitoses","Mitoses:",
                    min = 1,max = 10,value = 5)

    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h4(textOutput("Prediction"))
    )
  )
))
