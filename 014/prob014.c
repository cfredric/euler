#include<stdio.h>
#define LIMIT 10000000

unsigned long seq(unsigned long n, int acc);

long table[LIMIT];

void main(){
    unsigned long i;
    unsigned long len;
    unsigned long maxlen = 0;
    unsigned long maxstart = 0;

    for(i=0;i<LIMIT;i++){ //initialize array
        table[i] = 0;
    }

    for(i=2;i<=LIMIT;i++){

        //add to table
        table[i] = seq(i, 1);
        len = table[i];

        if(len > maxlen){
            maxlen = len;
            maxstart = i;
        }
    }
    printf("max length: %ld\n\tstart: %ld\n", maxlen, maxstart);
}

unsigned long seq(unsigned long n, int acc){
    //find out what the next one will be
    long next;
    if (n%2==0){
        next = n/2;
    }else{
        next = 3*n+1;
    }

    //check entry in table
    if(next<LIMIT && table[next] != 0){
        return acc + table[next];
    }

    if(n == 1){ //end
        return acc;
    }else{ //odd or even
        return seq(next, 1 + acc);
    }
}
