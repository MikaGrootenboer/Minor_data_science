import os
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from pandas import DataFrame
from sklearn.preprocessing import MinMaxScaler
from sklearn.ensemble import GradientBoostingClassifier





data_path = ['bioresponse']

# Import the data using the file path
filepath_train = os.sep.join(data_path + ['train.csv'])
filepath_test = os.sep.join(data_path + ['test.csv'])

features_train = pd.read_csv(filepath_train) #, sep=','
features_test = pd.read_csv(filepath_test)


#select all but the activity column
features = features_train.iloc[:,1:len(features_train.columns)]
#select only the activity column
y = features_train.iloc[:,0]

#RandomForest model
#create a variable for the randomforrestclassifier
clf = RandomForestClassifier(n_estimators=100,n_jobs=-1,random_state=0)
#fit the model with the previous variables
clf.fit(features,y)
testing = clf.predict_proba(features_test)

#creating new pd.DataFrame to export for the competition
comp_response = pd.DataFrame()
comp_response['MoleculeId'] = [int(x) for x in range(1, len(testing) + 1)]
comp_response['PredictedProbability'] = testing[:,1]
#comp_response.to_csv('bioresponse_10000.csv',index=None, header=True)

