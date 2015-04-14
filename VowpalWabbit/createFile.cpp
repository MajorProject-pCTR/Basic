#include<iostream>
#include<fstream>
#include<string>

#define MAX 50
#define ID_L 20

using namespace std;

int main(){
	int click, impression, depth, position, i, j, index;
	char display_url[MAX], ad_id[ID_L], advertiser_id[ID_L], query_id[ID_L], keyword_id[ID_L], title_id[ID_L], description_id[ID_L], user_id[ID_L];
	ifstream input_file ("train_sub.txt");
	ofstream output_file ("unrolled.txt");
	
	index = 1;

	if(input_file.is_open() && output_file.is_open()){
		while(true){

			input_file >> click >> impression >> display_url >> ad_id >> advertiser_id >> depth >> position >> query_id >> keyword_id >> title_id >> description_id >> user_id;

			if(input_file.eof())
				break;

			for(j=1; j<=click; ++j){
				output_file << "1 | " << "ad_id:" << ad_id << " " << "advertiser_id:" << advertiser_id << " " << "depth:" << depth << " " << "position:" << position << " " << "query_id:" << query_id << " " << "keyword_id:" << keyword_id << " " << "title_id:" << title_id << " " << "description_id:" << description_id << " " << "user_id:" << user_id << "\n";
				index++;
			}
	
			for(j=1; j<=impression-click; ++j){
				output_file << "-1 | " << "ad_id:" << ad_id << " " << "advertiser_id:" << advertiser_id << " " << "depth:" << depth << " " << "position:" << position << " " << "query_id:" << query_id << " " << "keyword_id:" << keyword_id << " " << "title_id:" << title_id << " " << "description_id:" << description_id << " " << "user_id:" << user_id << "\n";
				index++;
			}

		}
		input_file.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	
