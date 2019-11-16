library(shiny)
library(dplyr)
library(stringr)
library(shinydashboard)
library(leaflet)
library(rsconnect)

plane_data = read.csv("Airplane_Crashes2.csv")
plane_withsum = read.csv("plane_withsum.csv")
year_set = read.csv("year_set.csv")
small_df = read.csv("small_df.csv")


#############################################UI####################################################
shinyUI(dashboardPage(skin = "blue",
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
                                
                                
                                sliderInput("slider2", label = h3("Year slider"), min = 1908, 
                                            max = 2019, value = c(2000, 2019))
                                
                                
                                
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
)