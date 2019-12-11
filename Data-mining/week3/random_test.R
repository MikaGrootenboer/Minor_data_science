# logistic regression
# we proberen puur op basis vd lengte te classificeren of iemand male of female is
mean.M  = 180 ; sd.M = 7
mean.F  = 170 ; sd.F = 7
males   = rnorm(50,mean.M, sd.M)
females = rnorm(50,mean.F, sd.F)
plot(150:200,dnorm(150:200,mean.M,sd.M),type="l",lwd=2,col="blue")
lines(150:200,dnorm(150:200,mean.F,sd.F),type="l",lwd=2,col="red")

# for simplicity code males as 1 and females as 0
z = data.frame(height=c(males,females),gender=c(rep(1,50),rep(0,50)))
z = z[order(z$height),]
plot(z$height[z$gender==0],z$gender[z$gender==0],col="red",pch=19,ylim=c(0,1),xlim=c(150,210))
points(z$height[z$gender==1],z$gender[z$gender==1],col="blue",pch=19)

model = glm(gender ~ height, family = binomial, data = z )
lines(z$height,1/(1+exp(-predict(model))),col="darkgreen",lwd=2)

# < 175 cm => female en > 175 => male
pred.male = 1/(1+exp(-predict(model))) >=0.5
true.male = z$gender == 1

sum(pred.male & true.male)
sum(true.male)

sensitivity = sum(pred.male & true.male) / sum(true.male)
# i.e. TP / (TP + FN)
specificity = sum(!pred.male & !true.male) / sum(!true.male)
# i.e. TN / (TN + FP)

accuracy = (sum(pred.male & true.male) + sum(!pred.male & !true.male))/100
# accuracy = (TP + TN) / N