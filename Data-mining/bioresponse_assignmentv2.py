import os
import pandas as pd
import numpy as np
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split

data_path = ['bioresponse']

# Import the data using the file path
filepath_train = os.sep.join(data_path + ['train.csv'])
filepath_test = os.sep.join(data_path + ['test.csv'])

train_data = pd.read_csv(filepath_train) #, sep=','
test_data = pd.read_csv(filepath_test)

train_noanser = train_data.iloc[:,1:len(train_data)]
train_anser = train_data.iloc[:,0]

#create the gradiant boost classifier with the corresponding params
gb_clf = GradientBoostingClassifier(n_estimators=300,max_features=700,verbose=1)
#fir the training set
gb_clf.fit(train_noanser,train_anser)
#predict the Activity with the test_dat set.
gb_clfprob = gb_clf.predict_proba(test_data)


#creating new pd.DataFrame to export for the competition
comp_response = pd.DataFrame()
comp_response['MoleculeId'] = [int(x) for x in range(1, len(gb_clfprob) + 1)]
comp_response['PredictedProbability'] = gb_clfprob[:,1]
#comp_response.to_csv('bioresponse_10000.csv',index=None, header=True)