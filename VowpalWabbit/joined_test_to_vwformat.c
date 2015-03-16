#include<stdio.h>
#include<stdlib.h>

int main(){
	int i;
	int click,impression;
	char display_url[50],ad_id[20],advertiser_id[20],query_id[20],keyword_id[20],title_id[20],description_id[20],user_id[20];
	int keyword_token_count,title_token_count,description_token_count,query_token_count;
	int depth;
	int position;
	float ctr;
	FILE *fp1=fopen("join_test.txt","r");
	FILE *fp2=fopen("test.data.vw","w");
	for(i=0;i<200000;i++){
		fscanf(fp1, " %d %d %s %s %s %d %d %s %s %d %s %d %s %d %s %d", &click, &impression, display_url, ad_id, advertiser_id, &depth, &position, user_id, description_id, &description_token_count, title_id, &title_token_count, keyword_id, &keyword_token_count, query_id, &query_token_count);
		ctr = (click * 1.0)/(impression * 1.0);
		fprintf(fp2, " %f | ADID:%s ADVERID:%s DEP:%d POS:%d UID:%s DID:%s DTKN:%d TID:%s TTKN:%d KID:%s KTKN:%d QID:%s QTKN:%d\n", ctr, ad_id, advertiser_id, depth, position, user_id, description_id, description_token_count, title_id, title_token_count, keyword_id, keyword_token_count, query_id, query_token_count);
	}
	fclose(fp1);
	fclose(fp2);
	return 0;
}
