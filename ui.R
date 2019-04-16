install.packages("shinydashboard")
library(shinydashboard)
library(shiny)
library(ggplot2)

dashboardPage(
  dashboardHeader(title = "Iris Dataset"),
  dashboardSidebar(
    selectInput(
      "Species"
      , "Species:"
      , choices = sort(iris$Species)
      , selected = "setosa")
  ),
  dashboardBody(
    valueBoxOutput("Petal.Width", width = 3)
    ,valueBoxOutput("Petal.Length", width = 3)
    ,valueBoxOutput("Sepal.Width", width = 3)
    ,valueBoxOutput("Sepal.Length", width = 3)
  )
  ,fluidRow(
    box(DT::dataTableOutput("table"), width = 12)
    ,box(plotOutput("graph"))
  )
)


