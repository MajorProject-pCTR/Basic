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
	ofstream output_file ("train_unrolled.txt");
	
	index = 1;

	if(input_file.is_open() && output_file.is_open()){
		for(i=1; i<=3000000; ++i){

/*
			fscanf(input_file, " %d %d %s %s %d %d %s %s %s %s %s", &click, &impression, display_url, ad_id, advertiser_id, &depth, &position, query_id, keyword_id, title_id, description_id, user_id);
			printf(" %d %d %s %s %d %d %s %s %s %s %s\n", click, impression, display_url, ad_id, advertiser_id, depth, position, query_id, keyword_id, title_id, description_id, user_id);
*/

			input_file >> click >> impression >> display_url >> ad_id >> advertiser_id >> depth >> position >> query_id >> keyword_id >> title_id >> description_id >> user_id;	

			for(j=1; j<=click; ++j){
				output_file << index << " " << 1 << " " << display_url << " " << ad_id << " " << advertiser_id << " " << depth << " " << position << " " << query_id << " " << keyword_id << " " << title_id << " " << description_id << " " << user_id << "\n";
				index++;
			}
	
			for(j=1; j<=impression-click; ++j){
				output_file << index << " " << 0 << " " << display_url << " " << ad_id << " " << advertiser_id << " " << depth << " " << position << " " << query_id << " " << keyword_id << " " << title_id << " " << description_id << " " << user_id << "\n";
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
