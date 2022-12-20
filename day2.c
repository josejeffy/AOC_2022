#include<stdio.h>
#include<string.h>
#include<stdlib.h>

enum shape{ROCK=1,PAPER,SCISSORS};
enum outcome{WIN=6,LOSE=0,DRAW=3};

int part2_outcome(char code){
        switch(code){
                case 'X':return LOSE;
                case 'Y':return DRAW;
                case 'Z':return WIN;
        }
}

int getShape(char shapecode){
        if(shapecode == 'A' || shapecode == 'X'){return ROCK;}
        if(shapecode == 'B' || shapecode == 'Y'){return PAPER;}
        return SCISSORS;
}

int calculate_score_p1(char shapecode1, char shapecode2){
        int shape1 = getShape(shapecode1);
        int shape2 = getShape(shapecode2);
        int score = shape2;
        if(shape1 == shape2)
                score+=DRAW;
        else if(
                shape2 == ROCK && shape1 == SCISSORS ||
                shape2 == PAPER && shape1 == ROCK ||
                shape2 == SCISSORS && shape1 == PAPER
        )
                score+= WIN;
        else
                score+=LOSE;
        return score;
}

int calculate_score_p2(char shapecode1,char outcomecode){
        int shape2 = 0;
        int shape1 = getShape(shapecode1);
        int outcome = part2_outcome(outcomecode);
        if(outcome == DRAW) shape2=shape1;
        else if (outcome == WIN){
                if(shape1 == ROCK) shape2 = PAPER;
                if(shape1 == PAPER) shape2 = SCISSORS;
                if(shape1 == SCISSORS) shape2 += ROCK;
        }else{
                if(shape1 == ROCK) shape2 = SCISSORS;
                if(shape1 == PAPER) shape2 = ROCK;
                if(shape1 == SCISSORS) shape2 = PAPER;
        }
        return outcome+shape2;
}

int main(){
        int score_p1 = 0,score_p2=0;
        char p1,p2;
        FILE* input = fopen("day2.txt","r");
        while(!feof(input)){
                fscanf(input,"%c %c\n",&p1,&p2);
                score_p1 += calculate_score_p1(p1,p2);
                score_p2 += calculate_score_p2(p1,p2);
        }
        fclose(input);
        printf("Part 1: %d\n",score_p1);
        printf("Part 2: %d\n",score_p2);
        return 0;
}
