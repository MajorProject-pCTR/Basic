#include<stdio.h>
#include<stdlib.h>

int main(){
	int position=0,i;
	char rad[20];
	float crim,zn,indus,chas,nox,rm,age,dis,tax,ptratio,b,lstat,medv;
	FILE *fp1=fopen("housing.data","r");
	FILE *fp2=fopen("input.data.vw","w");
	for(i=0;i<=505;i++){
		fscanf(fp1, " %f %f %f %f %f %f %f %f %s %f %f %f %f %f", &crim, &zn, &indus, &chas, &nox, &rm, &age, &dis, rad, &tax, &ptratio, &b, &lstat, &medv);
		fprintf(fp2, " %f | CRIM:%f ZN:%f INDUS:%f CHAS:%f NOX:%f RM:%f AGE:%f DIS:%f RAD:%s TAX:%f PTRATIO:%f B:%f LSTAT:%f\n", medv, crim, zn, indus, chas, nox, rm, age, dis, rad, tax, ptratio, b, lstat);
	}
	fclose(fp1);
	fclose(fp2);
	return 0;
}
