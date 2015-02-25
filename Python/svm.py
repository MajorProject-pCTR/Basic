from sklearn import svm
from numpy import genfromtxt, savetxt

def main():
    #create the training & test sets, skipping the header row with [1:]
    dataset = genfromtxt(open('Data/unrolled.txt','r'), delimiter=',', dtype='f8')[0:]    
    target = [x[1] for x in dataset]
    train = [x[2:] for x in dataset]
    testdata = genfromtxt(open('Data/rand_csv.txt','r'), delimiter=',', dtype='f8')[0:]
    test = [x[2:] for x in testdata]
   # test = genfromtxt(open('Data/test.csv','r'), delimiter=',', dtype='f8')[1:]


    clf = svm.SVR()
    clf.fit(train, target)
    predicted_probs = [x for x in clf.predict(test)]

    savetxt('Data/submission.csv', predicted_probs, delimiter=',', fmt='%f')

if __name__=="__main__":
    main()
