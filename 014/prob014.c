#include<stdio.h>

unsigned long seq(unsigned long n);

long table[1000000];

void main(){
	unsigned long i;
	unsigned long len;
	unsigned long maxlen = 0;
	unsigned long maxstart = 0;
	
	
	for(i=0;i<1000000;i++){ //initialize array
		table[i] = 0;
	}
	
	for(i=2;i<=1000000;i++){
		
		//add to table
		table[i] = seq(i);
		len = table[i];
		
		if(len > maxlen){
			maxlen = len;
			maxstart = i;
		}
	}
	printf("max length: %ld\n\tstart: %ld\n", maxlen, maxstart);
}

unsigned long seq(unsigned long n){
	//find out what the next one will be
	long next;
	if (n%2==0){
		next = n/2;
	}else{
		next = 3*n+1;
	}
	
	//check entry in table
	if(next<1000000 && table[next] != 0){
		return 1 + table[next];
	}
	
	if(n == 1){ //end
		return 1;
	}else{ //odd or even
		return 1 + seq(next);
	}
}
