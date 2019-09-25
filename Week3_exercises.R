#Binomial distribution 
#exercise 1:
#x=1:25 n = 25 p = 0.25 
sum(dbinom(1:25,25,0.25))
#exercise 2:
#x=12  n=20 p=0.33
dbinom(12,20,0.33)
#exercise 3:
#x=48 n=50 p = 0.5, 1- because the succses is not the inaccurate results but accurate results.
1-dbinom(48,50,0.5)
#exercise 4:
#x=1:2 n=3 p=0.166
sum(dbinom(1:3,3,0.33))
barplot(dbinom(1:3,3,0.33))
#exercise 5:
#n = 500 p=1/5
500*(1/5)
#exercise 6:
#sqrt(np(1-p))
#A 
60*0.33
sqrt(60*0.33*(1-0.33))
#B
10*(1/6)
sqrt(10*(1/6)*(1-(1/6)))
#C
40*0.16
sqrt(40*0.16*(1-0.16))
#exercise 7:
15*0.8
sqrt(15*0.8*(1-0.8))
#exercise 8:
sum(dbinom(400:500,500,0.75))
#exercise 9:
dbinom(1,20,(1/7))
#exercise 10:
#1
dbinom(500,1000,0.5)
#2
dbinom(490,1000,0.5)
#3
sum(dbinom(0:489,1000,0.5))
#exercise 11:
dbinom(3,6,0.4)
#exercise 12:
#A
#Yes we can use the bin dist to model the outcome
#n=2000, p=0.04
#B
#expected value= 2000*0.04 = 80
2000*0.04
#standard dev = 
sqrt(2000*0.04*(1-0.04))


#Poisson distribution 
#exercise 1:
dpois(4,4) # x=4
1-dpois(0,4) #x=!0
sum(dpois(0:5,4))#<6
sum(dpois(0:6,4)) # =<6
sum(dpois(3:6,4)) #>2
sum(dpois(2:6,4)) # >=2
sum(dpois(1:5,4)) # =< 1 , =<5
sum(dpois(3,4)) # >2 , < 4
sum(dpois(3:5,4)) # =<3 , < 6
#exercise 2:
#A
dpois(10,12)
#B
sum(dpois(0:4,12))
#C
sum(dpois(10:11,12))
#D
sum(dpois(8:14,12))
#E
1 - ppois(17,12)
#exercse 3:
dpois(7,5)
#exercise 4:
sum(dpois(0:1,3.2))
#exercise 5:
1 - ppois(6,6)
#exercie 6:
sum(dpois(0:2,9.4))
