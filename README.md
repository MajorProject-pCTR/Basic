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





