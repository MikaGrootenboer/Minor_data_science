import numpy as np
import pandas as pd

mean_M  = 180 ; sd_M = 7
mean_F  = 170 ; sd_F = 7

male = np.random.normal(loc=mean_M,scale=sd_M,size=50)
female = np.random.normal(loc=mean_F,scale=sd_F,size=50)

lengths = np.concatenate((female,male))

#[0]*50
gender = np.asanyarray([x for x in range(0,100)])

gender[0:50]=0 # female
gender[50:100] = 1 # male

from sklearn.linear_model import LogisticRegression

LR = LogisticRegression(penalty='l2',C=10.0)

lengths = lengths.reshape(-1,1)

model = LR.fit(lengths,gender)
pred = model.predict(lengths)

sum(pred[0:50]==0)
sum(pred[50:100]==1)