#exersice 1: a
3 + 4 
#exersice 1: b
4*5==21
#exersice 1: c
x <-2; y <-3.5; z <-7
#exersice 1: d
typeof(x);typeof(y);typeof(z)
#exersice 1: e
x*y*z
#exersice 1: f
(x*y*z)==49
#exersice 1: g
s <- "Alexander"
#exersice 1: h
nchar(s)

#exersice 2: a
x <- 1:10
#exersice 2: b
length(x)
#exersice 2: c
x *1.2
#exersice 2: d
x[1:5]*2
#exersice 2: e
barplot(x)
#exersice 2: f
x <- 0:10
#exersice 2: g
plot(x,x,type="b")
#exersice 2: h
y = 3*x+2
plot(x,y,type="b")
#exersice 2: i
x = seq(from=0,to=2*pi,length.out=250)
y=sin(x)
plot(x,y,type="b")
#exersice 2: j
plot(x,y,type="l",main="My First R Graph")
#exersice 2: k
curve(cos(x),from=0, to=2*pi)

#exersice 3: a
air <- read.csv("ozone.csv")
#exersice 3: b
typeof(air)
#exersice 3: c
names(air)
#exersice 3: d
dim(air)
#exersice 3: e
#NA means not availible
#exersice 3: f
ozone = air$Ozone
mean(ozone)
#you get a NA because the Ozone row contains some NA fields
#exersice 3: g
mean(ozone,na.rm = TRUE)
#exersice 3: h
temp = air$Temp
mean(temp)
#exersice 3: i
less <- sum(temp<67); greater <-sum(temp>=67)
less ; greater ; less+greater
#exersice 3: j
hot <- air&temp > 80
Ozonehot <- ozone[hot]
Ozonecold <- ozone[hot == FALSE]
#exersice 3: k
mean(Ozonehot,na.rm=TRUE)
mean(Ozonecold,na.rm=TRUE)
#exersice 3: l
boxplot(Ozonehot,Ozonecold)