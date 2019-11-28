#week1
#imports needed for the exersices
from __future__ import print_function
import os
import numpy as np
import pandas as pd


data_path = ['data']
filepath = os.sep.join(data_path + ['Orange_Telecom_Churn_Data.csv'])
telecom = pd.read_csv(filepath)

####Question1:####
#No I do not think that a state, area code, and phone number are food features to use for machine learning.
telecom.drop(['state','area_code','phone_number'],axis=1, inplace=True)

####Question2:####
#transform the non int,float values to int32 (how tho?) why int32 as default.
from sklearn.preprocessing import LabelBinarizer
lb = LabelBinarizer()
for col in ['intl_plan', 'voice_mail_plan', 'churned']:
    telecom[col] = lb.fit_transform(telecom[col])
    
####Question3:####

list_telecoms = [x for x in telecom.columns if x != 'churned'] # we now have a list
x_data = telecom[list_telecoms]
y_data = telecom['churned']

from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=3)
knn = knn.fit(x_data,y_data)
y_pred = knn.predict(x_data)

#####Question4:####
def accuracy(real, predict):
    return sum(y_data == y_pred) / float(real.shape[0])
print(accuracy(y_data, y_pred))


#####Question5:####
knn = KNeighborsClassifier(n_neighbors=3, weights = 'distance')
knn = knn.fit(x_data,y_data)
y_pred = knn.predict(x_data)
print(accuracy(y_data, y_pred))

knn = KNeighborsClassifier(n_neighbors=3, p=1)
knn = knn.fit(x_data,y_data)
y_pred = knn.predict(x_data)
print(accuracy(y_data, y_pred))

#####Question6:####
j = [ x+1 for x in range(20)]
acc_list = [0.0*j for j in j]
for i in j:
    knn = KNeighborsClassifier(n_neighbors=i)
    knn = knn.fit(x_data,y_data)
    y_pred = knn.predict(x_data)
    acc_list[i-1] = accuracy(y_data,y_pred)
    #print(accuracy(y_data, y_pred))
    
z = pd.DataFrame(columns=['j','accuracy'])
z.j=j ; z.accuracy=acc_list
z



