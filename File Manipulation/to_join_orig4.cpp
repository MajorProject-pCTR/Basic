#include<iostream>
#include<fstream>
#include<string>

#define MAX 50
#define ID_L 20

using namespace std;

int main(){
	int click, impression, depth, position, index, desc_id_tokencnt, titid_tokencnt, purc_k_id_tokencnt, qid_tokencnt,query_id_freq, keyword_id_freq, title_id_freq, description_id_freq, user_id_freq, gender , age;
	char display_url[MAX], ad_id[ID_L], advertiser_id[ID_L], qid[ID_L], purc_k_id[ID_L], titid[ID_L], desc_id[ID_L], user_id[ID_L];
	ifstream input_file ("join.txt");
	ofstream output_file ("improved_join_orig.txt");

	if(input_file.is_open() && output_file.is_open()){
		while(true){

			input_file >> user_id >> qid >> purc_k_id >> titid >> desc_id >> index >> click >> impression >> display_url >> ad_id >> advertiser_id >> depth >> position >> ad_url_freq >> query_id_freq >> keyword_id_freq >> title_id_freq >> description_id_freq >> user_id_freq >> desc_id_tokencnt >> titid_tokencnt >> purc_k_id_tokencnt >> qid_tokencnt<<gender<<age;	

			if(input_file.eof())
				break;
				
			output_file << click << " " << impression << " " << ad_id << " " << advertiser_id << " " << depth << " " << position << " " << ad_url_freq <<  " " << user_id_freq << " " << gender << " " << age << " " << description_id_freq << " " << desc_id_tokencnt << " " title_id_freq << " " << titid_tokencnt << " " << keyword_id_freq << " " << purc_k_id_tokencnt << " " << query_id_freq << " "<< qid_tokencnt << "\n";

		}
		input_file.close();
		output_file.close();
	}
	else
		printf("Could not open file\n");
	
	return 0;
}	
