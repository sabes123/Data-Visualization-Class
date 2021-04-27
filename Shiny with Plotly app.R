library(tidyverse)
library(ggplot2)
library(plotly)
library(dplyr)
library(shiny)


ui <- fluidPage(
  titlePanel("Shiny App With Plotly"),
  plotOutput("plot1"),
  plotlyOutput("plot2")
)

server <- function(input,output) {
  groupeddata <- tom_data %>%
    summarize(sum.rating =sum(rating),
              sum.box = sum(box),
              count(tom_data,vars= actor, wt_var = year))
  
  groupeddata <- groupeddata %>% 
    rename(
      Actor = vars,
      Year = wt_var,
      Occurrence = n
    )
  
  actor.plot <- ggplot(groupeddata, aes(x = Year, y = Occurrence, fill= Actor))+
    geom_bar(stat = "identity")+
    ggtitle("Occurrence of Actors Named Tom Over The Years")+
    theme(legend.position = "off")
  actor.plot2 <- ggplotly(actor.plot)
  output$plot1 <- renderPlot({actor.plot})
  output$plot2 <- renderPlotly({actor.plot2})
  
}

shinyApp(ui, server)

