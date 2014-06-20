library(shiny)
library(ggplot2)
library(caret)

titanic <- read.csv("cutted_titanic.csv")
titanic$survived[titanic$survived == 0] <- 'No'
titanic$survived[titanic$survived == 1] <- 'Yes'
titanic$survived <- as.factor(titanic$survived)



surviving_prob <- function(age, sex){
  tree_mod <- train(survived ~ ., data=titanic, method="rpart")  
  prediction <- predict(tree_mod,  data.frame(age=age, sex=sex))
  return(prediction)
}






shinyServer(function(input, output) {
  output$prediction <- renderPrint({as.character(surviving_prob(input$age, input$sex))})

  output$distPlot <- renderPlot({ 
    
    titanic$user_age <- input$age
    titanic$user_sex <- input$sex
    
    
    
    p <- ggplot(titanic, aes(age, sex, color=survived))+
    geom_point(pch = 19) +
    geom_point(aes(user_age, user_sex), color="black", cex=10, pch=4) +
    geom_text(aes(user_age+3, user_sex), color="darkblue", label="You")
    
    p
    

    
  })
  
})
