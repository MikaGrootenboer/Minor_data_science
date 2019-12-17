import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.legend_handler import HandlerLine2D
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
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
#train_anser = y.to_frame()
    
gb_clf = GradientBoostingClassifier(verbose=1,n_estimators=20,learning_rate=0.1, max_features=600)

gb_clf.fit(train_noanser,train_anser)

gb_clfprob = gb_clf.predict_proba(test_data)
#random_forest_1_probabilities = pd.DataFrame(GBC.predict_proba(test_data))

# export data for kaggle score
#bio_response_prediction = pd.DataFrame()
#bio_response_prediction['MoleculeId'] = [int(x) for x in range(1, len(test_data) + 1)]
#bio_response_prediction['PredictedProbability'] = random_forest_1_probabilities.iloc[:,1]
#bio_response_prediction.to_csv(os.sep.join(data_path + ['bio_resp_rft.csv']), index = None, header=True)