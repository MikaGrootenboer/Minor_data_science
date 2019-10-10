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

#stepts to filter the dataset, we are not instereseted in the rows where there is no summary
#These rows can be removed, to do that we can execute the following statements
plane_withsum = plane_data
plane_withsum = plane_withsum[rowSums(is.na(plane_withsum))==0,]
plane_withsum = plane_withsum[plane_withsum$Summary!="",]
#Next up are catagories, for the beginning I wil create different variables with hand of different causes.
Planes_crashed = plane_withsum %>% filter(str_detect(plane_withsum$Summary,c("Crash")))
Planes_shot = plane_withsum %>% filter(str_detect(plane_withsum$Summary,c("Shot","shot")))
Planes_lightning = plane_withsum %>% filter(str_detect(plane_withsum$Summary,"lightning"))
Planes_caughtfire = plane_data %>% filter(str_detect(plane_data$Summary,"Caught fire"))
Planes_exploded = plane_data %>% filter(str_detect(plane_data$Summary,c("Exploded","explode")))
Planes_hij = plane_data %>% filter(str_detect(plane_data$Summary,c("hijacked")))
#possible way to filter it:
#firecounter = nrow(plane_data %>% filter(str_detect(plane_data$Summary,"Caught fire")))


#ignore the capital letters
planes_crashed2 = plane_withsum %>% filter(str_detect(plane_withsum$Summary,fixed("crash", ignore_case=TRUE)))
