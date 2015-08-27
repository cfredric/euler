#include<stdio.h>
#include<math.h>  // use gcc -o ......  ....  -lm for this to work

void main(){
	int i=3;
	int primeCount = 1;
	while(primeCount <10001){
		//test primality of each number
		int j;
		int p=1;
		for(j=2;j<=sqrt((double)i);j++){
			if(i%j == 0){
				p=0;
				break;
			}
		}
		if(p==1){
			primeCount++;
		}
		i++;
	}
	i--;
	printf("prime #%d: %d\n",primeCount,i);
}
