#libs needed for the app to run
library(shiny)
library(dplyr)
library(stringr)
library(shinydashboard)
library(leaflet)
#import the plane crash data from the csv file.
plane_data = read.csv("Airplane_Crashes2.csv")
# remove the empty summary field and put it in a new variable.
plane_withsum = plane_data
plane_withsum = plane_withsum[rowSums(is.na(plane_withsum))==0,]
plane_withsum = plane_withsum[plane_withsum$Summary!="",]

ui = fluidPage(
  leafletOutput("mymap")
)

server = function(input,output){

 
  output$mymap <- renderLeaflet({
    leaflet()%>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>% 
      addMarkers(lng=small_df$lng,lat=small_df$lat,popup = small_df$Summary)
      })

}
shinyApp(ui = ui , server=server)

