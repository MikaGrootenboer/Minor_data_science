#week1
#imports needed for the exersices
from __future__ import print_function
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as seaborn


#get the data path for the iris cvb file
data_path = ['data']
filepath = os.sep.join(data_path + ['Iris_Data.csv'])
iris = pd.read_csv(filepath)

####Question1:####
#The number of data points (rows)
#print(iris.shape[0])

#The column names.
#print(iris.columns.tolist())

#The data types for each column
#print(iris.dtypes)

####Question2:####
#print(iris['species'])
iris['species'] = iris['species'].str.replace('Iris-','',case=False)
#print(iris.head())

####Questsion3:####
#print(iris['species'].value_counts())
des = iris.describe()
rangevalue = des.loc['max']-des.loc['min']
rangevalue.name = 'range'
des = des.append(rangevalue)
#print(des)

####Question4:####
#print(iris.groupby('species').mean())
#print(iris.groupby('species').median())


####Question5:####
plot = plt.axes()
plot.scatter(iris.sepal_length,iris.sepal_width)
plot.set(xlabel='sepal length',ylabel='sepal width',title='sepal width vs length')
#print(plot)


####Question6:####
hist = plt.axes()
hist.hist(iris.sepal_length)
hist.set(xlabel='Sepal length',ylabel='Frequency',title='Frequencies of sepal length')
#print(hist)

####Question7:####
iris.plot.hist(alpha=0.5)
histlist = iris.hist()

####Question8:####
iris.plot.box()

####Question9:####


####Question10:####
seaborn.pairplot(iris)








