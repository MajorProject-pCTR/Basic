Basic
=====

Implement ML algos in octave on subset of KDD Cup 2012 dataset 

On just a subset - hence the name "Basic" !

Work on whole data coming soon....

-----------------------------------------------------------------------------

sort -R training.txt -T "(location)"| head -n 1000000 > rand_sub.txt


In R :

data <- read.table("rand_sub.txt")

train <- data[c(1:600000),]

valid <- data[c(600001:800000),]

test <- data[c(800001:1000000),]



To find AUC
	python scoreKDD.py input.csv output.csv

*****************************************************************************









