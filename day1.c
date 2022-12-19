#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int comparator(const void* a, const void* b){return *(int*)a<*(int*)b;}

int main(void) {
  int sum = 0, topThree = 0, top[1000],count=0;
  char nums[100];
  FILE *input = fopen("./day1.txt", "r");
  do {
    fgets(nums, 10, input);
    if (strcmp(nums, "\n") == 0) {
      top[count] = sum;
      count++;
      sum = 0;
    } else {
      sum += atoi(nums);
    }
  } while (!feof(input));
  top[count] = sum;
  
  qsort(top, count, sizeof(int), comparator);
  
  printf("Part 1: %d", top[0]);
  
  for(int i = 0;i<3;i++){topThree+=top[i];}
  printf("Part 2: %d", topThree);
  
  fclose(input);
  return 0;
}
