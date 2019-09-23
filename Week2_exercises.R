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
