#include<stdio.h>
#include<stdlib.h>

int main(){
	int i;
	int click,impression;
	char display_url[50],ad_id[20],advertiser_id[20],query_id[20],keyword_id[20],title_id[20],description_id[20],user_id[20];
	int depth,position;
	float ensmbl1,ensmbl2;
	float ctr;
	FILE *fp1=fopen("ensemble_test_part1.txt","r");
	FILE *fp2=fopen("ensemble_test_part2.txt","r");
	FILE *fp3=fopen("test_sub.txt","r");
	FILE *fp4=fopen("ensembled_test.data.vw","w");
	for(i=0;i<200000;i++){
		fscanf(fp1, " %f",&ensmbl1);
		fscanf(fp2, " %f",&ensmbl2);
		fscanf(fp3, " %d %d %s %s %s %d %d %s %s %s %s %s", &click, &impression, display_url, ad_id, advertiser_id, &depth, &position, query_id, keyword_id, title_id, description_id, user_id);
		ctr = (click * 1.0)/(impression * 1.0);
		fprintf(fp4, " %f | 1:%f 2:%f\n",ctr,ensmbl1,ensmbl2);
	}
	fclose(fp1);
	fclose(fp2);
	fclose(fp3);
	fclose(fp4);
	return 0;
}
