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




***************************************************************************

Computed actual value of CTR=click/impr
But sum(click/impr == CTR) is not equal to 0
AUC found using scoreKDD = 0.49 for both Lin Reg and this perfect output !

Lin Reg:
python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.494707
NWMAE: 65.516552
WRMSE: 482.236432

Perfect Output:
python scoreKDD.py csvinput.txt perfect_op.txt 
AUC  : 0.493226
NWMAE: 65.455168
WRMSE: 482.226255

1-Lin_reg output :
python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.505293
NWMAE: 66.185098
WRMSE: 482.114910

Changed Lin_reg outputs of some tuples manually :
python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.494707
NWMAE: 65.516549
WRMSE: 482.236432

With normalization :

Cost(Training dataset) = 0.017650 
Max_difference = 0.989005
Min_difference = 0.000009
Avg_difference = 0.073835
Predictions with difference less than 0.000100 = 2 out of 3000000 tuples
Accuracy = 0.000067

python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.494480
NWMAE: 65.517884
WRMSE: 482.236243

python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.505520
NWMAE: 66.183766
WRMSE: 482.115094

Adding quad features :

Cost(Training dataset) = 0.017649 
Max_difference = 0.991191
Min_difference = 0.000051
Avg_difference = 0.073838
Predictions with difference less than 0.000100 = 1 out of 3000000 tuples
Accuracy = 0.000033

python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.494480
NWMAE: 65.517856
WRMSE: 482.236418

python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.505520
NWMAE: 66.183794
WRMSE: 482.114919

Adding poly features :

Cost(Training dataset) = 0.017635 
Max_difference = 0.988286
Min_difference = 0.000050
Avg_difference = 0.073805
Predictions with difference less than 0.000100 = 3 out of 3000000 tuples
Accuracy = 0.000100

python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.497216
NWMAE: 65.517861
WRMSE: 482.236824

python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.502784
NWMAE: 66.183789
WRMSE: 482.114514

Adding quad and then poly :
Cost(Training dataset) = 0.017628 
Max_difference = 0.985880
Min_difference = 0.000034
Avg_difference = 0.073762
Predictions with difference less than 0.000100 = 2 out of 3000000 tuples
Accuracy = 0.000067

python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.497216
NWMAE: 65.517872
WRMSE: 482.236892

python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.502784
NWMAE: 66.183778
WRMSE: 482.114445

Adding poly and then quad :
Cost(Training dataset) = 0.017628 
Max_difference = 0.985722
Min_difference = 0.000007
Avg_difference = 0.073754
Predictions with difference less than 0.000100 = 2 out of 3000000 tuples
Accuracy = 0.000067

python scoreKDD.py csvinput.txt output.txt 
AUC  : 0.497216
NWMAE: 65.517876
WRMSE: 482.236919

python scoreKDD.py csvinput.txt comp_output.txt 
AUC  : 0.502784
NWMAE: 66.183774
WRMSE: 482.114418


2.) Linear Regression with all features except url hash(column 3)

- Without Normalization :
	alpha = 0.01
	num_iters = 1000
	Gradient descent shoots up, ends up with NaN

- With Normalization :
	Cost(Training dataset) = 0.017577 
	Max_difference = 1.004240
	Min_difference = 0.000000
	Avg_difference = 0.073553
	Predictions with difference less than 0.000100 = 756 out of 3000000 tuples
	Accuracy = 0.025200

	python scoreKDD.py csvinput.txt output.txt 
	AUC  : 0.497186
	NWMAE: 65.517645
	WRMSE: 482.236828

	python scoreKDD.py csvinput.txt comp_output.txt 
	AUC  : 0.502814
	NWMAE: 66.184013
	WRMSE: 482.114511



