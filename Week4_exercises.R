#Normal distriution
#Exercise 1:
#A:
(93-110)/11 # -1.545455
#B
(105-110)/11 #-0.4545455
#C
(110-110)/11 #0
#D
(129-110)/11 #1.727273










#exponential distribution
#exercise 1:
l = 1
#a
pexp(1.5,l)
#b
1- pexp(2,l)
#c
pexp(2.82,l)-pexp(1.35,l)
#exercise 2:
l = 12 # 12 cars each minute
#a
pexp(15/60,12)
#b
pexp(5/60,12)
#c
pexp(10/60,l)-pexp(2/60,l)
#d
pexp(0.12,l)-pexp(0.1,l)
#e
1- pexp(12,l)
#f
1- pexp(7,l)
#exercise 3:
l = 15
1- pexp(5/60,l)
#exercise 4:
l = 1/8# idk why tho, i thought it should be just 8
#yo have to do the -6 because the first 6 hours don't matter in our case
pexp(16-6,1/8)-pexp(12-6,1/8)
#exercise 5:
l = 3
#a
1-pexp(15/60,l)
#b
pexp(25/60,l)
#c
pexp(90/60,l) - pexp(30/60,l)
