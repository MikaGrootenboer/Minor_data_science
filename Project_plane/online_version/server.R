library(shiny)
library(dplyr)
library(stringr)
library(shinydashboard)
library(leaflet)
library(rsconnect)



shinyServer(function(input,output){
  plane_data = read.csv("Airplane_Crashes2.csv")
  plane_withsum = read.csv("plane_withsum.csv")
  year_set = read.csv("year_set.csv")
  small_df = read.csv("small_df.csv")
  
  #table for the raw results of the input field:
  output$table = renderDataTable(plane_withsum[c(2,4,5,7,8,11,14,18)])
  
  output$pie = renderPlot(pie(c(nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[1], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[2], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[3], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[4], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[5], ignore_case=TRUE)))),
                                nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[6], ignore_case=TRUE))))
  ),
  c(input$cause), col = rainbow(8), radius = 0.9,main = "Types of accidents compaired to eachother"))
  
  
  
  output$bar = renderPlot(barplot(c(nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[1], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[2], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[3], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[4], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[5], ignore_case=TRUE)))),
                                    nrow(plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed(input$cause[6], ignore_case=TRUE))))
  ),names.arg = c(input$cause[1],input$cause[2],input$cause[3],input$cause[4],input$cause[5],input$cause[6]),col = rainbow(8),main="Barplot of the amount of each accident",ylab = "amount of accidents",xlab = "type of accident"))
  
  output$plot <- renderPlot({
    plot(x = year_set$year ,type="l", xlim=c(input$slider2[1],input$slider2[2]),y = year_set$amount, ylab="amount of crashes", xlab="year",main = "Accidents each year")
    
  })
  
  #this code would stay the same with a bigger dataset.
  output$mymap <- renderLeaflet({
    leaflet()%>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>% 
      addMarkers(lng=small_df$lng,lat=small_df$lat,popup = small_df$Summary)
  })
  
})