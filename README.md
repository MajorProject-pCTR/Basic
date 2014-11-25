Basic
=====

Implement basic ML algos in octave on subset of KDD Cup 2012 dataset 

-----------------------------------------------------------------------------

sort -R training.txt | head -n 3000000 > rand_sub.txt
	This gives rand_sub.txt

split -l 4000000 training.txt 
	This gives files of the name xaa, ..., xbl

*****************************************************************************
1.)Linear Regression

Using only depth and position as the features

Exec 1 :
alpha = 0.01
num_iters = 1000

Cost(Training dataset) = 0.017677 
Training set accuracy : 95.538733

xaa
Cost = 0.020507 
Test set accuracy : 95.125150

xar
Cost = 0.020270 
Test set accuracy : 95.192525

xbl
Cost = 0.021239 
Test set accuracy : 94.969938 

The above result is incorrect. "round" was used in predictAccuracy function, after removing "round" accuracy of all datasets are 0. 
In regression problem, Cost itself is the best measure for accuracy.

Exec 2 - Corrected findAccuracy
alpha = 0.01
num_iters = 10000

Cost(Training dataset) = 0.017650 
Max_difference = 0.989096
Min_difference = 0.000093
Predictions with difference less than 0.000100 = 1 out of 3000000 tuples
Accuracy = 0.000033

Onto test set xaa
Cost = 0.020467 
Max_difference = 0.989096
Min_difference = 0.000246
Predictions with difference less than 0.000100 = 0
 out of 4000000 tuplesAccuracy = 0.000000
Onto test set xar
Cost = 0.020234 
Max_difference = 0.989096
Min_difference = 0.000246
Predictions with difference less than 0.000100 = 0
 out of 4000000 tuplesAccuracy = 0.000000
Onto test set xbl
Cost = 0.021194 
Max_difference = 0.989096
Min_difference = 0.000246
Predictions with difference less than 0.000100 = 0
 out of 1639105 tuplesAccuracy = 0.000000


Exec 3
alpha = 0.01
num_iters = 1000

Cost(Training dataset) = 0.017677 
Max_difference = 0.976141
Min_difference = 0.000017
Avg_difference = 0.072037
Predictions with difference less than 0.000100 = 5 out of 3000000 tuples
Accuracy = 0.000167

AUC  : 0.494707
NWMAE: 65.516552
WRMSE: 482.236432

Onto test set xaa
Cost = 0.020507 
Max_difference = 0.976141
Min_difference = 0.000588
Avg_difference = 0.077556
Predictions with difference less than 0.000100 = 0 out of 4000000 tuples
Accuracy = 0.000000

Onto test set xar
Cost = 0.020270 
Max_difference = 0.976141
Min_difference = 0.000643
Avg_difference = 0.077053
Predictions with difference less than 0.000100 = 0 out of 4000000 tuples
Accuracy = 0.000000

Onto test set xbl
Cost = 0.021239 
Max_difference = 0.976141
Min_difference = 0.000643
Avg_difference = 0.079005
Predictions with difference less than 0.000100 = 0 out of 1639105 tuples
Accuracy = 0.000000








