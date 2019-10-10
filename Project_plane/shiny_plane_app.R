library(shiny)

ui = fluidPage(
  titlePanel("Data visualisation plane crashes"),
  sidebarLayout(
    sidebarPanel(
      helpText("filter the graph information about plane crashes since 1908."),
      
      #this is the checkbox that will give the user the option to choose from different categories of crashes.
      checkboxGroupInput("cause", label = "choose a cause to filter on",
                         choices = list("Crashed" = "Crashed","Shot" = "Shot" ,"Struck by lightning" = "Struck by lightning",
                                        "Caught fire" = "Caught fire", "Exploded" = "Exploded"),
                         selected = "Crashed"),
      
      #This is the date range where the user will be able to filter the data by time.
      dateRangeInput(inputId = "Date_range", label = "Date range",start = "1908-01-01",end = "2012-01-01"),
      textInput("text", label = h3("Find a speciffic crash"), value = "Crashed")
      
    ),
    
    mainPanel(
      textOutput("test"),
      plotOutput("pie"),
      tableOutput("table")
      
      
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
  
  #table for the raw results of the input field:
  output$table = renderTable(spacing = c("s"),width = 200, plane_withsum[c(1,3,4,6,7,8,10,11,13)] %>% filter(str_detect(plane_withsum$Summary, fixed(input$cause, ignore_case=TRUE))))
  

}
shinyApp(ui = ui , server=server)

