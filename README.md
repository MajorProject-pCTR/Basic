Basic
=====

Implement basic ML algos in octave on subset of KDD Cup 2012 dataset 

-----------------------------------------------------------------------------

sort -R training.txt | head -n 3000000 > rand_sub.txt
	This gives rand_sub.txt

split -l 4000000 training.txt 
	This gives files of the name xaa, ..., xbl

To find AUC
	From Octave
	data = load("rand_sub.txt");
	csvwrite("csvinput.txt", data)

	Then execute python code
	python scoreKDD.py csvinput.txt output.txt

*****************************************************************************









