public class prob014{
    static long table[];
    static final int limit = 1000000;
    public static void main(String[] args){
        int i;
        long len =0;
        long maxlen = 0;
        long maxstart = 0;
        table = new long[limit];

        long timeS = System.currentTimeMillis();
        for(i=2;i<limit;i++){
            //add to table
            table[i] = seq(i, 1);
            len = table[i];

            if(len > maxlen){
                maxlen = len;
                maxstart = i;
            }
        }
        long timeE = System.currentTimeMillis();

        System.out.printf("max length: %d\n\tstart: %d\nTime: %d ms\n", maxlen, maxstart,timeE-timeS);
    }

    public static long seq(long n, int acc){
        //find out what the next one will be
        Long next;
        if (n%2==0){
            next = n/2;
        }else{
            next = 3*n+1;
        }

        //check entry in table
        if(next<limit && table[next.intValue()] != 0){
            return acc + table[next.intValue()];
        }

        if(n == 1){ //end
            return acc;
        }else{ //odd or even
            return seq(next, 1 + acc);
        }
    }
}
