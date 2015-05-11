from sklearn import svm
from numpy import genfromtxt, savetxt

def main():
    #create the training & test sets, skipping the header row with [1:]
    dataset = genfromtxt(open('unrolled.txt','r'), delimiter=' ', dtype='f8')[0:]    
    target = [x[0] for x in dataset]
    train = [x[1:] for x in dataset]
    training = genfromtxt(open('train_sub.csv','r'), delimiter=',', dtype='f8')[0:]
    #test = [x[2:] for x in testdata]
   # test = genfromtxt(open('Data/test.csv','r'), delimiter=',', dtype='f8')[1:]


    clf = svm.SVR()
    clf.fit(train, target)
    predicted_probs = [x[1] for x in clf.predict(train)]

    savetxt('submission.csv', predicted_probs, delimiter=' ', fmt='%f')

if __name__=="__main__":
    main()
