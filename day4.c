#include<stdio.h>

int main(){
        int n1,m1,n2,m2,counta=0,countb=0;
        FILE* input = fopen("day4.txt","r");
        while(!feof(input)){
                fscanf(input,"%d-%d,%d-%d",&n1,&m1,&n2,&m2);
                counta += (n1-n2)*(m1-m2) <= 0 ? 1 : 0;
                countb += (m2-n1)*(n2-m1) <= 0 ? 1 : 0;
        }
        printf("Part 1:%d\n",counta);
        printf("Part 2:%d\n",countb);
        fclose(input);
}
