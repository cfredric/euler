#include <stdio.h>
#include <math.h>
#define max(a,b) (a>b?a:b)

void main(){
	int i;
	int maxDiv = 0;
	int div =0;
	int j;
	for(i=3; maxDiv <500;i++){
		int tri = i*(i+1)/2;
		//find divisors
		div = 1;
		for(j=2;j <= sqrt(tri);j++){ //only go up to the square root, then double
			if(tri%j==0){
				div++;
			}
		}
		div*=2;
		if(sqrt(tri) == floor(sqrt(tri))){ //if it's a perfect square, don't count sqrt twice
			div--;
		}
		/*
		if(i%50==0){
			printf("%6d\t%3d\n\t%10d->%3d\n",i,maxDiv,tri,div);
		}
		*/
		maxDiv = max(div, maxDiv); //update maximum
	}
	i--; //undo last test (which was false)
	printf("%d\n",(i*(i+1)/2));
}
