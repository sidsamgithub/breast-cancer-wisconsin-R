#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rpart)
library(rpart.plot)
breastAll <- read.csv("Wisconsin\\BreastCancer.csv")

breast <- breastAll[,-1]

library(caret)
set.seed(1992)
intrain<-createDataPartition(y=breast$Class,p=0.7,list=FALSE)

training   <- breast[ intrain , ]
validation <- breast[-intrain , ]

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({


    dtree <- rpart(Class ~ ., data=breast,  method="class",
                   control=rpart.control(minsplit = input$Split))


    rpart.plot(dtree , type=4, extra=1,main="Decision Tree")


  })

  output$Prediction <- renderText({
    dtree <- rpart(Class ~ ., data=breast,  method="class",
                   control=rpart.control(minsplit = input$Split))
    validation <- data.frame(Clump=input$Clump,UniCell_Size=input$UniCell_Size,
                             Uni_CellShape=input$Uni_CellShape,
                             MargAdh=input$MargAdh,SEpith=input$SEpith,
                             BareN=input$BareN,BChromatin=input$BChromatin,
                             NoemN=input$NoemN,Mitoses=input$Mitoses)
    dtree.pred <- predict(dtree, newdata=validation, type="class")

    paste("Prediction:" , dtree.pred)
  })

})
