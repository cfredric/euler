#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef int BOOL;
#define TRUE 1
#define FALSE 0

int main(){

	long sum = 2;
	int i; int j;

	for(i = 3; i < 2000000;i+=2){ //check all odd numbers < 2,000,000 for primality
	
		BOOL prime = TRUE;
		for(j = 3; j <= sqrt(i); j += 2){
			if(i%j == 0){ //evenly divisible by j
				prime = FALSE;
				break;
			}
		}
	
		//finished checking number, add it to sum if prime
		if(prime == TRUE){
			sum += i;
		}
	}

	printf("sum = %ld\n",sum);
}
