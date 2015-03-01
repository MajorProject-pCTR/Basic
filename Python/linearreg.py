from sklearn import linear_model
from numpy import genfromtxt, savetxt

def main():
    #create the training & test sets, skipping the header row with [1:]
    dataset = genfromtxt(open('Data/train_sub.csv','r'), delimiter=',', dtype='f8')[0:]    
    target = [x[1] for x in dataset]
    train = [x[2:] for x in dataset]
    traindata = genfromtxt(open('Data/train_sub.csv','r'), delimiter=',', dtype='f8')[0:] #to find training data accuracy
    testdata = genfromtxt(open('Data/test_sub.csv','r'), delimiter=',', dtype='f8')[0:] #to find test data accuracy
    training = [x[2:] for x in traindata]
    testing = [x[2:] for x in testdata]
   # test = genfromtxt(open('Data/test.csv','r'), delimiter=',', dtype='f8')[1:]

    #create and train the random forest
    #multi-core CPUs can use: rf = RandomForestClassifier(n_estimators=100, n_jobs=2)
    regr = linear_model.LinearRegression()
    regr.fit(train, target)
    #predicted_probs = [x[1] for x in regr.predicted_proba(training)]

    savetxt('Data/submission_train_lin.csv', regr.predict(training), delimiter=',', fmt='%f')

    #predicted_probs = [x[1] for x in regr.predicted_proba(testing)]

    savetxt('Data/submission_test_lin.csv', regr.predict(testing), delimiter=',', fmt='%f')
if __name__=="__main__":
    main()
