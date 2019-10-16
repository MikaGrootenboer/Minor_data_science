#libs needed for the app to run
library(shiny)
library(dplyr)
library(stringr)
#import the plane crash data from the csv file.
plane_data = read.csv("Airplane_Crashes2.csv")
# remove the empty summary field and put it in a new variable.
plane_withsum = plane_data
plane_withsum = plane_withsum[rowSums(is.na(plane_withsum))==0,]
plane_withsum = plane_withsum[plane_withsum$Summary!="",]

ui = fluidPage(
  titlePanel("Data visualisation plane crashes"),
  sidebarLayout(
    sidebarPanel(
      helpText("filter the graph information about plane crashes since 1908."),
      
      #this is the checkbox that will give the user the option to choose from different categories of crashes.
      checkboxGroupInput("cause", label = "choose a cause to filter on",
                         choices = list("Crashed" = "Crash","Shot" = "Shot" ,"Struck by lightning" = "lightning",
                                        "Caught fire" = "Caught fire", "Exploded" = "Explode"),
                         selected = c("Crash","Shot","lightning","Caught fire", "Explode")),
      
      #This is the date range where the user will be able to filter the data by time.
      dateRangeInput(inputId = "Date_range", label = "Date range",start = "1908-01-01",end = "2012-01-01"),
      textInput(inputId = "Search", label = h3("Find a speciffic crash"))
      
    ),
    
    mainPanel(
      textOutput("test"),
      plotOutput("pie"),
      plotOutput("bar"),
      dataTableOutput("table")
      
      
      
    )
  )
)

server = function(input,output){

  #piechart of the different ways a plane has crashed:
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
  
  #table for the raw results of the input field:
  output$table = renderDataTable(plane_withsum[c(1,3,4,6,7,10,13,17)] %>% filter(str_detect(plane_withsum$Summary, fixed(input$Search, ignore_case=TRUE))))
  

}
shinyApp(ui = ui , server=server)

