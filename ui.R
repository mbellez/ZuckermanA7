library(shiny)
library(shinydashboard)
library(quantmod)
library(dygraphs)
library(rsconnect)


#setwd("Desktop")
#cereal <- read.csv("/Users/mbellemarie/ZuckermanA7/cereal.csv", stringsAsFactors=FALSE)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  header <- dashboardHeader(title = "Cereal Visualization"),
  titlePanel("Cereal Visualization"),
  #cereal <- read.csv("/Users/mbellemarie/ZuckermanA7/cereal.csv", stringsAsFactors=FALSE),
  tags$style("body{background-color: linen}"),
  tags$img(src='http://blogs.bu.edu/sargentchoice/files/2012/02/breakfast-cereal-desk-lg1.jpg'),
  sidebar <- dashboardSidebar(sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Table", tabName = "table", icon = icon("table")) ,  
    menuItem("Stock", tabName = "stock", icon = icon("dollar")) )),
  body <- dashboardBody(tabItems(  
    #cereal <- read.csv("/Users/mbellemarie/ZuckermanA7/cereal.csv", stringsAsFactors=FALSE),
    # First tab content  
    tabItem(tabName = "dashboard",          
            fluidRow(box(title = "Histogram", status = "primary",  solidHeader = TRUE, collapsible = TRUE, 
                         plotOutput("plot1",  height = 250)), box(title = "Controls", status = "warning",  solidHeader = TRUE, collapsible = TRUE, sliderInput("Slider", "Number of Observations:", 1, 77, 30)))),  
    # Second tab content  
    tabItem(tabName = "table",  dataTableOutput("mytable")) ,  
    # Third tab content    
    tabItem(tabName = "stock", 
            fluidRow(infoBox(title = "General Mills, Inc. Latest", icon('dollar'), 
                             getQuote('GIS')$Last, color='red'), infoBoxOutput("kelloggs"), 
                     box(title = "Closing share price", width = 12, heigth = NULL, 
                         dygraphOutput('generalM') ))            )  ))
))