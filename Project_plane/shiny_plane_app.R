library(shiny)

ui = fluidPage(
  titlePanel("Data visualisation plane crashes"),
  sidebarLayout(
    sidebarPanel(
      helpText("filter the graph information about plane crashes since 1908."),
      
      #this is the checkbox that will give the user the option to choose from different categories of crashes.
      checkboxGroupInput(inputId = "cause", label = "choose a cause to filter on",
                         choices = c("Crashed","Shot","Struck by lightning","Caught fire", "Exploded")),
      
      #This is the date range where the user will be able to filter the data by time.
      dateRangeInput(inputId = "Date_range", label = "Date range",start = "1908-01-01",end = "2012-01-01")
    ),
    
    mainPanel()
  )
  
  
  
)

server = function(input,output){



}
shinyApp(ui = ui , server=server)

