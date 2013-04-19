//As an alternate way to test for primality, this works, but is slow because
//it relies on the speed of the memory, rather than the speed of the processor.
//With very large primes, it might be faster than trial division with a for-loop.

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef int BOOL;
#define TRUE 1
#define FALSE 0

typedef struct N{
	struct N * next;
	long num;
} Node;

BOOL isPrime(long n, Node ** pn);
void insert(long n, Node ** pn);

int main(){

	long sum = 2;
	long i;
	Node * primes = NULL;
	
	insert(2, &primes); //start with 2 already recognized as a prime, even though we're dealing only with odd nums
	
	for(i = 3; i < 2000000;i+=2){ //check all odd numbers < 2,000,000 for primality
	
		BOOL prime = TRUE;
		
		prime = isPrime(i, &primes);
		
		//finished checking number, add it to sum if prime
		if(prime == TRUE){
			sum += i;
		}
	}

	printf("sum = %ld\n",sum);
}

void insert(long n, Node ** pn){
	if((*pn) == NULL){ //found a new spot
		//request memory for a new node
		(*pn) = (Node *) malloc(sizeof(Node));
		(*pn)->next = NULL;
		(*pn)->num = n;
	}else{
		insert(n, &((*pn)->next));
	}
}

BOOL isPrime(long n, Node ** pn){
	if((*pn) == NULL){ //found a new spot
		//request memory for a new node
		(*pn) = (Node *) malloc(sizeof(Node));
		(*pn)->next = NULL;
		(*pn)->num = n;
		return TRUE;
	}else{
		if(n%((*pn)->num) == 0){
			return FALSE;
		}else{
			return isPrime(n, &((*pn)->next));
		}
	}
}

