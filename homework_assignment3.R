#implement leaflet & readxl
library(leaflet)
library(readxl)
#add the dataset
parkdata = read_xls("parkeerautomaten.xls")

#create the leaflet map
parkmap = leaflet()
#add the data to the mapp
#parkmap = leaflet(data = parkdata)
#add the tiles & set view
parkmap = addTiles(parkmap)
parkmap = setView(parkmap,4.48418,51.917213,zoom=15.5)
#add the markers 
#parkmap = addMarkers(parkmap, parkdata$Latitude,parkdata$Longetude, popup = parkdata$Straat)

parkmap = addMarkers(parkmap,  4.358884, 51.882846, popup = "test")

#display the map
parkmap
