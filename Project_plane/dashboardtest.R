#libs needed for the app to run
#install.packages("shiny")
#install.packages("dplyr")
#install.packages("stringr")
#install.packages("shinydashboard")
#install.packages("leaflet")
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

#create a new dataset to get the amount of crashes each year
new_plane = plane_withsum
new_plane$Date = substr(new_plane$Date,start=7,stop=10)
year_set = data.frame()
for(i in unique(new_plane$Date)){
  
  newrow = data.frame(year=i,amount=nrow(dplyr::filter(plane_withsum, grepl(i, plane_withsum$Date))))
  year_set = rbind(year_set,newrow)
}
#https://www.jessesadler.com/post/geocoding-with-r/
#todo add the longetude and latitude to the data frame, connect them with the location name.
#plane_cities
#cities = distinct(plane_cities,Location)
#cities_df = as.data.frame(cities)
#geolocation = mutate_geocode(cities_df,Location)
#new_plane_withsum = merge(plane_withsum,geolocation,by="Location")

#to show how i would display the mapped content i created a small data frame and added the longitude and latitude with hand.
small_df = plane_withsum[0:5,]
small_df$lng = 0
small_df$lat = 0

small_df$lng[1] = -77.079827
small_df$lat[1] = 38.8803422
small_df$lng[2] = 2.3709
small_df$lat[2] = 48.6929
small_df$lng[3] = -74.422927
small_df$lat[3] = 39.364283
small_df$lng[4] = -123.365644
small_df$lat[4] = 48.428421
small_df$lng[5] = 3.515625
small_df$lat[5] = 56.511018

#############################################UI####################################################
ui = dashboardPage(skin = "blue",
  #this is the name of the 
  dashboardHeader(title = "Plane accidents"),
  dashboardSidebar(
    sidebarMenu(
      #first item in the menu
      menuItem("plane accidents", tabName = "dashboard", icon = icon("dashboard")),
      
      
      #this is the filter menu for the first itmem
      menuItem("filters",tabName="plot_filter",icon = icon("dashboard"),
       checkboxGroupInput("cause", label = h3("Cause of accident"),
       choices = list("Crashed" = "Crash","Shot" = "Shot" ,"Struck by something" = "Struck",
       "Caught fire" = "Fire", "Exploded" = "Explode","Engine problems"="Engine"),selected = c("Crash","Shot","Struck","Fire", "Explode","Engine")),
       
       
       sliderInput("slider2", label = h3("Year slider"), min = 0, 
                   max = 109, value = c(90, 109))
       
       
       
       ),
      
      
      
      #second item in the menu
      menuItem("Mapping",tabName="map",icon = icon("map") ),
      #last item in the menu
      menuItem("Table data", tabName = "table", icon = icon("th") )
      
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              
              #this is the checkbox that will give the user the option to choose from different categories of crashes.
             fluidRow(
              box( title = "Piechart ", status = "primary", solidHeader = TRUE, collapsible = TRUE, plotOutput("pie")),
              box( title = "Barplot", status = "primary", solidHeader = TRUE, collapsible = TRUE, plotOutput("bar")),
              box( title = "Lineplot", status = "primary", solidHeader = TRUE,collapsible = TRUE, plotOutput("plot"))
             )
      ),
      

      #mapping tab
      tabItem(tabName="map",
              h2("map of all the accidents with the summary"),
              leafletOutput("mymap")),
      
      # Second tab content
      tabItem(tabName = "table",
              h2("Search your own accident"),
              dataTableOutput("table")
              
              
      )
      
    )
  )
)

#############################################SERVER####################################################
server = function(input,output){
  
  #table for the raw results of the input field:
  output$table = renderDataTable(plane_withsum[c(1,3,4,6,7,10,13,17)])
  
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
    plot(x = year_set$year ,xlim=c(input$slider2[1],input$slider2[2]),y=year_set$amount, ylab="amount of crashes", xlab="year",main = "Accidents each year")
    
  })
  
  #this code would stay the same with a bigger dataset.
  output$mymap <- renderLeaflet({
    leaflet()%>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>% 
      addMarkers(lng=small_df$lng,lat=small_df$lat,popup = small_df$Summary)
  })

}
shinyApp(ui = ui , server=server)

