from sklearn.ensemble import RandomForestClassifier
from numpy import genfromtxt, savetxt

def main():
    #create the training & test sets, skipping the header row with [1:]
    dataset = genfromtxt(open('Data/unrolled_train.csv','r'), delimiter=',', dtype='f8')[0:]    
    target = [x[1] for x in dataset]
    train = [x[2:] for x in dataset]
    traindata = genfromtxt(open('Data/train_sub.csv','r'), delimiter=',', dtype='f8')[0:] #to find training data accuracy
    testdata = genfromtxt(open('Data/test_sub.csv','r'), delimiter=',', dtype='f8')[0:] #to find test data accuracy
    training = [x[2:] for x in traindata]
    testing = [x[2:] for x in testdata]
   # test = genfromtxt(open('Data/test.csv','r'), delimiter=',', dtype='f8')[1:]

    #create and train the random forest
    #multi-core CPUs can use: rf = RandomForestClassifier(n_estimators=100, n_jobs=2)
    rf = RandomForestClassifier(n_estimators=10)
    rf.fit(train, target)
    predicted_probs = [x[1] for x in rf.predict_proba(training)]

    savetxt('Data/submission_train_rf.csv', predicted_probs, delimiter=',', fmt='%f')

    predicted_probs = [x[1] for x in rf.predict_proba(testing)]

    savetxt('Data/submission_test_rf.csv', predicted_probs, delimiter=',', fmt='%f')
if __name__=="__main__":
    main()
