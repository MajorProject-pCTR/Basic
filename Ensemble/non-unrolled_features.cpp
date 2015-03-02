#include<iostream>
#include<fstream>

#define MAX 50

using namespace std;

int main(){
	int click, impression, i;
	char nn_fname[MAX], log_fname[MAX], lin_fname[MAX], op_name[MAX];
	double nn_ctr, log_ctr, lin_ctr;

	cin >> ip_fname >> nn_fname >> log_fname >> lin_fname >> op_name;

	ifstream input_file (ip_fname);
	ifstream input_file_nn (nn_fname);
	ifstream input_file_log (log_fname);
	ifstream input_file_lin (lin_fname);
	ofstream output_file (op_name);

	i = 1;

	if(input_file.is_open() && input_file_nn.is_open() && input_file_log.is_open() && input_file_lin.is_open() && output_file.is_open()){
		while(true){

			input_file >> click >> impression;
			input_file_nn >> nn_ctr;
			input_file_log >> log_ctr;
			input_file_lin >> lin_ctr;

			cout << i++ << "\n" ;	

			if(input_file.eof())
				break;

			output_file << click << " " << impression << " " << nn_ctr << " " << log_ctr << " " << lin_ctr << "\n";
			
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
