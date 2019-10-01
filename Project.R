#implement leaflet & readxl
library(leaflet)
#library(readxl)
#add the dataset
lampdata = read.csv("rotterdam-lampen.csv",sep = ",")

#create the leaflet map
lampmap = leaflet()
#add the data to the mapp
#parkmap = leaflet(data = parkdata)
#add the tiles & set view
lampmap = addTiles(lampmap)
lampmap = setView(lampmap,4.358884,51.917213,zoom=15.5)
#add the markers 
#parkmap = addMarkers(parkmap, parkdata$Latitude,parkdata$Longetude, popup = parkdata$Straat)

#lampmap = addMarkers(lampmap,  lampdata$longitude, lampdata$latitude, popup = lampdata$LAMP)
lampmap = addCircleMarkers(lampmap,lampdata$longitude, lampdata$latitude)
#display the map
lampmap
