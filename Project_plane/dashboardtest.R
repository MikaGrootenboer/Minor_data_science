#libs needed for the app to run
library(shiny)
library(dplyr)
library(stringr)
library(shinydashboard)
#import the plane crash data from the csv file.
plane_data = read.csv("Airplane_Crashes2.csv")
# remove the empty summary field and put it in a new variable.
plane_withsum = plane_data
plane_withsum = plane_withsum[rowSums(is.na(plane_withsum))==0,]
plane_withsum = plane_withsum[plane_withsum$Summary!="",]

ui = dashboardPage(
  #this is the name of the 
  dashboardHeader(title = "Plane crashes"),
  dashboardSidebar(
    sidebarMenu(
      #first item in the menu
      menuItem("plane plots", tabName = "dashboard", icon = icon("dashboard")),
      #this is the filter menu for the first itmem
      menuItem("Plot filter",tabName="plot_filter",icon = icon("dashboard"),
       checkboxGroupInput("cause", label = "choose a cause to filter on",
       choices = list("Crashed" = "Crash","Shot" = "Shot" ,"Struck by lightning" = "lightning",
       "Caught fire" = "Caught fire", "Exploded" = "Explode"),selected = c("Crash","Shot","lightning","Caught fire", "Explode"))),
      #second item in the menu
      menuItem("Table data", tabName = "table", icon = icon("th") )
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              
              #this is the checkbox that will give the user the option to choose from different categories of crashes.
              
              plotOutput("pie"),
              plotOutput("bar")
      ),
      
      # Second tab content
      tabItem(tabName = "table",
              h2("Search your own accident"),
              dataTableOutput("table")
              
              
      )
    )
  )
)

server = function(input,output){
  
  #table for the raw results of the input field:
  output$table = renderDataTable(plane_withsum[c(1,3,4,6,7,10,13,17)])
  
  output$pie = renderPlot(pie(c(nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[1], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[2], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[3], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[4], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[5], ignore_case=TRUE))))),
                              c(input$cause), col = rainbow(8), radius = 0.9))
  
  
  
  output$bar = renderPlot(barplot(c(nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[1], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[2], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[3], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[4], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[5], ignore_case=TRUE))))
  ),names.arg = c(input$cause[1],input$cause[2],input$cause[3],input$cause[4],input$cause[5]),col = rainbow(8)))
  
  

}
shinyApp(ui = ui , server=server)

