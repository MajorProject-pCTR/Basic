#include<iostream>
#include<fstream>
#include<string>

#define MAX 50
#define ID_L 20

using namespace std;

int main(){
	int y, depth, position, index, desc_id_tokencnt, titid_tokencnt, purc_k_id_tokencnt, qid_tokencnt;
	char display_url[MAX], ad_id[ID_L], advertiser_id[ID_L], qid[ID_L], purc_k_id[ID_L], titid[ID_L], desc_id[ID_L], user_id[ID_L];
	ifstream input_file ("join.txt");
	ofstream output_file ("improved_join.txt");

	if(input_file.is_open() && output_file.is_open()){
		while(true){

			input_file >> qid >> purc_k_id >> titid >> desc_id >> index >> y >> display_url >> ad_id >> advertiser_id >> depth >> position >> user_id >> desc_id_tokencnt >> titid_tokencnt >> purc_k_id_tokencnt >> qid_tokencnt;	

			if(input_file.eof())
				break;
				
			output_file << y << " " << display_url << " " << ad_id << " " << advertiser_id << " " << depth << " " << position << " " << user_id << " " << desc_id << " " << desc_id_tokencnt << " " << titid << " " << titid_tokencnt << " " << purc_k_id << " " << purc_k_id_tokencnt << " " << qid << " " << qid_tokencnt << " " << "\n";

		}
		input_file.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	


