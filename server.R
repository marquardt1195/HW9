library(tidyverse)
library(ggplot2)

server <- function(input, output) { 
  
 NewDF <- reactive({
    filter(iris, Species == input$Species)
  })
  
  output$table <- DT::renderDataTable({
    NewDF()
  }
  )
  
  output$Petal.Length <- ({
    renderText(input$Petal.Length)
  })
  
  output$Petal.Width <- ({
    renderText(input$Petal.Width)
  })
  
  output$Sepal.Length <- ({
    renderText(input$Sepal.Length)
  })
  
  output$Sepal.Width <- ({
    renderText(input$Sepal.Width)
  })
  
  predictorData <- reactive({
  })
  
  output$predictorData <- DT::renderDataTable({
    predictorData()
  })
}


