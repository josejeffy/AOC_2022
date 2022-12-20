#include<stdio.h>
#include<string.h>

int get_priority(char c){return c>96?c-96:c-64+26;}

char buffer[3][200];

int compare(){
        for(int i=0;i<strlen(buffer[0]);i++){
                for(int j=0;j<strlen(buffer[1]);j++){
                        for(int k=0;k<strlen(buffer[2]);k++){
                                if(buffer[0][i]==buffer[1][j]&&buffer[1][j]==buffer[2][k]){
                                        return get_priority(buffer[0][i]);
                                }
                        }
                }
        }
        return 0;
}

int main(){
        int value = 0,count = 0,common = 0;
        FILE* input = fopen("day3.txt","r");
        while(!feof(input)){
                fgets(buffer[count],199,input);
                int len = strlen(buffer[count]);
                for(int i=0;i<len/2;i++){
                        for(int j=len/2;j<len;j++){
                                if(buffer[count][i] == buffer[count][j]){
                                        value += get_priority(buffer[count][i]);
                                        goto next;
                                }
                        }
                }
                next:
                if(count==2){
                        count = 0;
                        common += compare();
                }else{
                        count += 1;
                }
        }
        printf("Part 1: %d\n",value);
        printf("Part 2: %d\n",common);
        fclose(input);
}
