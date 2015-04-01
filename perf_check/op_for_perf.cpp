#include<iostream>
#include<fstream>
#include<string>

#define MAX 50
#define ID_L 20

using namespace std;

int main(){
	int click, impression, depth, position, i, if_click;
	char display_url[MAX], ad_id[ID_L], advertiser_id[ID_L], query_id[ID_L], keyword_id[ID_L], title_id[ID_L], description_id[ID_L], user_id[ID_L];
	double pred_ctr;
	ifstream input_file ("train_unrolled.txt");
	ifstream predictions ("pred_train.txt");
	ofstream output_file ("perf_out.txt");

	if(input_file.is_open() && predictions.is_open() && output_file.is_open()){
		while(true){

			input_file >> click >> impression >> if_click >> display_url >> ad_id >> advertiser_id >> depth >> position >> query_id >> keyword_id >> title_id >> description_id >> user_id;
			
			predictions >> 	pred_ctr;

			if(input_file.eof())
				break;
	
			output_file << if_click << " " << pred_ctr << "\n";

		}
		input_file.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	
