install.packages("shinydashboard")
library(shinydashboard)
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  headerPanel(title = "Iris Dataset"),
  sidebarLayout(
    sidebarPanel(
    sliderInput("Petal.Length", "Petal Length", 1, 6.9, 3),
    sliderInput("Petal.Width", "Petal Width", 0.1, 2.5, 1.3),
    sliderInput("Sepal.Length", "Sepal Length", 4.3, 7.9, 6.5),
    sliderInput("Sepal.Width", "Sepal Width", 2.0, 4.4, 3.2),
    actionButton("simulate", "Simulate!")
),

mainPanel(
  tabsetPanel(
    tabPanel("Plot", plotOutput("thePlot")),
    tabPanel("Table", DT::dataTableOutput("predictorData")),
    textOutput("Petal.Length"),
    textOutput("Petal.Width"),
    textOutput("Sepal.Length"),
    textOutput("Sepal.Width")
      )
     )
    )
   )
  )
