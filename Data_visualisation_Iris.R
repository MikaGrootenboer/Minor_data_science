#Data visualisation week 1: IRIS
#exersice 1: histogram of sepal width for the setosa species
setosa = iris[iris$Species == "setosa",]
hist(setosa$Sepal.Width,breaks=20,
     main="histogram of Sepal width",
     xlab = "Sepal witdh")
#exersice 2: scatterplot length petal v length sepal with 3 colors for each type
plot(iris$Sepal.Length,iris$Petal.Length,col = as.factor(iris$Species),
     main="Petal vs Sepal length",
     xlab="Sepal Length",
     ylab="Petal Length")
#exersice 3: scatterplot sepal length vs sepal width with petal lager than 1.5
plot(iris$Sepal.Length[iris$Petal.Length>1.5],iris$Sepal.Width[iris$Petal.Length>1.5],
     main = "Sepal length vs sepal width",
     xlab = "Sepal Length",
     ylab = "Sepal width")
#exersice 4: another interesting fact about the different between the species
#width of the petal depends alot on the species of iris.
plot(iris$Petal.Width, col = as.factor(iris$Species),
     main = "with of the petal",
     ylab = "Petal width")
