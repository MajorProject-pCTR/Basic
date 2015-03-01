#include<iostream>
#include<fstream>
#include<string>

#define MAX 50
#define ID_L 20

using namespace std;

int main(){
	int click, impression, depth, position, i, index;
	char display_url[MAX], ad_id[ID_L], advertiser_id[ID_L], query_id[ID_L], keyword_id[ID_L], title_id[ID_L], description_id[ID_L], user_id[ID_L];
	ifstream input_file ("input.txt");
	ofstream output_file ("orig.txt");
	
	index = 1;

	if(input_file.is_open() && output_file.is_open()){
		while(true){

			input_file >> click >> impression >> display_url >> ad_id >> advertiser_id >> depth >> position >> query_id >> keyword_id >> title_id >> description_id >> user_id;	

			if(input_file.eof())
				break;

			output_file << index << " " << click << " " << impression << " " << display_url << " " << ad_id << " " << advertiser_id << " " << depth << " " << position << " " << query_id << " " << keyword_id << " " << title_id << " " << description_id << " " << user_id << "\n";
				index++;
			

		}
		input_file.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	
