library(tidyverse)

server <- function(input, output) { 
  
  NewDF <- reactive({
    filter(iris, Species == input$Species)
  })
  
  output$table <- DT::renderDataTable({
    NewDF()
  }
  )
  
  
  output$Petal.Length <- renderValueBox({
    valueBox(
      round(mean(NewDF()$Petal.Length), 2)
      ,"Petal Length"
    )
  })
  
  output$Petal.Width <- renderValueBox({
    valueBox(
      round(mean(NewDF()$Petal.Width), 2)
      ,"Petal Width"
    )
  })
  
  output$Sepal.Length <- renderValueBox({
    valueBox(
      round(mean(NewDF()$Sepal.Length), 2)
      ,"Sepal Length"
    )
  })
  
  
  output$Sepal.Width <- renderValueBox({
    valueBox(
      round(mean(NewDF()$Sepal.Width), 2)
      ,"Sepal Width"
    )
  })
}


