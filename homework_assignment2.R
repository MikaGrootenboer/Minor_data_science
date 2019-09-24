#Homework assignment 2.1
sw = swiss
attach(swiss)
sw[c(1,2,3,10,11,12,13),c("Examination","Education","Infant.Mortality")]
#A
sw["Sarine","Infant.Mortality"] = NA
#B  
sw["Total" ,] <- colSums(sw,na.rm=TRUE)
#C

#Homework assignment 2.2
ex2 <- data.frame(state.abb, state.area, state.division, state.name, state.region)
#A
colnames(ex2) <-c("abb","are","div","nam","reg")

#Homework assignment 2.3
x77 =state.x77 
ex2.3 = data.frame(ex2,x77)
#A
ex2.3$div = NULL
#B
ex2.3$`Life Exp` = NULL ;ex2.3$`HS Grad` = NULL; ex2.3$Frost = NULL ; ex2.3$abb = NULL ; ex2.3$are = NULL
#C
ex2.3$level = cut(ex2.3$Illiteracy,c(0,1,2,Inf),c("low","some","high"))
#D
max(ex2.3$Income[ex2.3$level =="low"]) #5299
ex2.3$nam[ex2.3$Income==5299&ex2.3$level=="low"] #Maryland



