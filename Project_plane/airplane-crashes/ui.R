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
                       
                       
                       
                       #map page linker
                       menuItem("Mapping",tabName="map",icon = icon("map") ),
                       #table page linker
                       menuItem("Table data", tabName = "table", icon = icon("th") ),
                       #information page linker
                       menuItem("Data information", tabName = "information", icon = icon("question") )
                       
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
                       
                       # table tab content
                       tabItem(tabName = "table",
                               h2("Search your own accident"),
                               dataTableOutput("table")
                               
                               
                       ),
                       
                       tabItem(tabName = "information",
                               h2("Information page"),
                               box(title = "Data information", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                                   p("The dataset that is being used on this site is a dataset called 'Airplane Crash Data Since 1908' from Kaggle.com. You can find more information about each column of the data set at https://www.kaggle.com/cgurkan/airplane-crash-data-since-1908"
                                   )),
                               box(title = "Filter options", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                                   p("You will find a filter tab in the sidebar menu, in this tab you can filter the three different plots given on the 'plane accidents' page.  The first filter called ' Cause of accident' will have effect on the Piechart and the Barplot. While the second filter called 'Year slider' will have effect on the Lineplot."
                                   )),
                               box(title = "Map", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                                   p("In the sidebar menu is an item called Mapping, on this page you can see the world map with at the moment five different locations of a place an airplane has crashed. The reason only five markers are showing is because it wasn't possible to convert all the locations to longitude and latitude because of the Google API."
                                   )),
                               box(title = "Table", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                                   p("In the sidebar menu is an item called Table data, on this page you can search for a specific accident. The search bar at the top right filters on everything in the data set. For example you can try to find a crash that is related to terrorism if you type 'terrorism' in the search bar, or you can search for a specific location of a crash by typing a location in the search bar."
                                   ))
                               
                               
                               
                       )
                       
                     )
                   )
)
)