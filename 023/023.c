#include <stdio.h>
#include <math.h>

#define TRUE 1
#define FALSE 0
#define MAX 28123
#define DEBUG FALSE

int summer(int n);
int abund(int n);

// to find answer to this problem, use 28123 as the argument
int table[MAX];

int main(int argc, char * argv[]){
	
	int limit = (int) atoi(argv[1]);
	long sum = 0;
	int i = 0;
	
	//initialize table
	for(i = 0;i<=limit;i++){
		table[i] = FALSE;
	}
	
	
	for(i=0;i < limit;i++){
		if(summer(i) == FALSE){
/*			if(DEBUG == TRUE){
				printf("%d: FALSE\n",i);
			}*/
			sum += i;
		}
	}
	printf("%ld\n",sum);
}

//return true if n is an abundant number
int abund(int n){
	
	if(n<12) return FALSE;
	
	long divsum = 1;
	int i;
	if(table[n] == TRUE){
		return TRUE;
	}
	for(i = 2;i<=sqrt(n);i++){
		if(n%i == 0){
			divsum += i + n/i;
			if(i == n/i){
				divsum -= i;
			}
		}
	}
	
	/*
	if(DEBUG == TRUE && divsum > n){
		printf("\tabundant: %d\n\t%d == 1 ",n,n);
		int k;
		for(k = 2;k<=sqrt(n);k++){
			if(n%k == 0){
				printf("+ %d + %d ",k,n/k);
			}
		}
		printf("\n");
	}
	*/
	
	return table[n] = (divsum > n?TRUE:FALSE);
}

//return true if n can be expressed as the sum of two abundant numbers
int summer(int n){
	int i = 2;
	int j;
	for(i = 2;i <= n/2;i++){
		j = n-i;
		if( (abund(i) == TRUE) && (abund(j) == TRUE)){
/*			if(DEBUG == TRUE){
				printf("%d = %d + %d\n",n,i,j);
			} */
			return TRUE;
		}
	}
	return FALSE;
}
