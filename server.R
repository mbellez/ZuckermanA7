library(shiny)
library(shinydashboard)
library(quantmod)
library(dygraphs)
library(rsconnect)

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  cereal <- read.csv("/Users/mbellemarie/ZuckermanA7/cereal.csv", stringsAsFactors=FALSE) 
  output$plot1 <- renderPlot({
    
    cereals <- cereal$calories[seq_len(input$Slider)]    
    hist(cereals)  
    output$mytable <- renderDataTable({cereal})
    output$kelloggs <- renderInfoBox({infoBox("Kellogg Company", icon('dollar'), 
                                              href = 'https://www.google.com/finance?q=NYSE:K',  color='black')})
    output$generalM <- renderDygraph({dygraph(Cl(get(getSymbols('GIS'))))})})
})