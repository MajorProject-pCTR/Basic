#include<iostream>
#include<fstream>

#define MAX 50

using namespace std;

int main(){
	int if_click, i;
	double nn_ctr, log_ctr, lin_ctr;

	ifstream input_file ("train_improved_join.txt");
	ifstream input_file_nn ("nn_train_unrolled.csv");
	ifstream input_file_log ("log_train_unrolled.csv");
	ifstream input_file_lin ("lin_train_unrolled.csv");
	ofstream output_file ("unrolled_ensemble.txt");

	i = 1;

	if(input_file.is_open() && input_file_nn.is_open() && input_file_log.is_open() && input_file_lin.is_open() && output_file.is_open()){
		while(true){

			input_file >> if_click;
			input_file_nn >> nn_ctr;
			input_file_log >> log_ctr;
			input_file_lin >> lin_ctr;	

			cout << i++ << "\n" ;

			if(input_file.eof())
				break;

			output_file << if_click << " " << nn_ctr << " " << log_ctr << " " << lin_ctr << "\n";
			
		}
		input_file.close();
		input_file_nn.close();
		input_file_log.close();
		input_file_lin.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	
