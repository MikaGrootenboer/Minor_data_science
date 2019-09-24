#exersice 1: a
x = sample(30,98,replace=TRUE)
#exersice 1: b
x2 = c(x,50,-5)
#exersice 1: c
median(x) ; median(x2)
#or
summary(x);summary(x2)
#the reason both medians are the same is because the median is the number that splits the vector in half.
#and the only difference is the last two numbers so that won't affect the median.
#exersice 1: d
intrangex = 22.75-9.00
intrangex2 = 23.00-9.00
lowfencex = 9.00 - 1.5*intrangex
uppfencex = 22.75 + 1.5*intrangex
lowfencex2 = 9 - 1.5*intrangex2
uppfencexx = 23 + 1.5*intrangex2
sum(x<lowfencex)
sum(x>uppfencex)
sum(x2<lowfencex2)
sum(x2>uppfencexx)
#x2 uppfencexx has one value that is an outlier
#exersice 1: e
boxplot(x,x2)

#exersice 1: a
# install.packages('ISwR') ; library(ISwR)
eba = eba1977
ebacase = eba$cases
summary(ebacase) # mean = 9.333 , 3rd quartile = 11
boxplot(ebacase) # no outliers are shown
#exersice 1: b
eba = eba1977
summary(eba)
# 6 values for each city,4 values for each age group.
#exersice 1: c
#to put 2 plots in the view -> par(mfrow=c(2,1))
hist(eba$case[eba$city =="Fredericia"],xlim=c(0,16),ylim=c(0,4),col = "grey")
hist(eba$case[eba$city =="Vejle"],xlim = c(0,16), ylim = c(0,4))
#the cases are more spread out in Vejli compared to Fredericia
#exersice 1: d
plot(eba$cases ~ eba$city)
plot(eba$cases ~ eba$age)
#exersice 1: e
tapply(eba$cases, eba$city, mean)
tapply(eba$cases, eba$age, mean)
#age group 65-69 has the highest average with 11.25, and Fredericia has the highest average with 10.666667
#exersice 2
#NANIIIIIII


