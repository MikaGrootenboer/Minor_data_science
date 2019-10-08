#set the correct wd by setwd("{place of dir}")
#create a variable for the dataset
plane_data = read.csv("Airplane_Crashes.csv")

#install 2 libraries to filter the summary for categories
# dplyr and stringr
#you only have to use install.packages one time 
#install.packages("dplyr")
#install.packages("stringr")
#call the libs, you have to do this everytime
library(dplyr)
library(stringr)
#you can with the help of these two libs filter the data as follow
#var1 = plane_data %>% filter(str_detect(plane_data$Summary,"Crash"))
#This command will return all the objects where "Crash" is mentioned in the summary.

#Next up are catagories, for the beginning I wil create different variables with hand of different causes.
Planes_crashed = plane_data %>% filter(str_detect(plane_data$Summary,"Crash"))
Planes_shot = plane_data %>% filter(str_detect(plane_data$Summary,"Shot"))
Planes_lightning = plane_data %>% filter(str_detect(plane_data$Summary,"Struck by lightning"))
Planes_caughtfire = plane_data %>% filter(str_detect(plane_data$Summary,"Caught fire"))
Planes_exploded = plane_data %>% filter(str_detect(plane_data$Summary,"Exploded"))
#possible way to filter it:
#firecounter = nrow(plane_data %>% filter(str_detect(plane_data$Summary,"Caught fire")))