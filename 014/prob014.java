public class prob014{
	static long table[];
	public static void main(String[] args){
		int i;
		long len =0;
		long maxlen = 0;
		long maxstart = 0;
		table = new long[1000000];
		
		long timeS = System.currentTimeMillis();
		for(i=2;i<1000000;i++){
			//add to table
			table[i] = seq(i);
			len = table[i];
			
			if(len > maxlen){
				maxlen = len;
				maxstart = i;
			}
		}
		long timeE = System.currentTimeMillis();
		
		System.out.printf("max length: %d\n\tstart: %d\nTime: %d ms\n", maxlen, maxstart,timeE-timeS);
	}

	public static long seq(long n){
		//find out what the next one will be
		Long next;
		if (n%2==0){
			next = n/2;
		}else{
			next = 3*n+1;
		}
	
		//check entry in table
		if(next<1000000 && table[next.intValue()] != 0){
			return 1 + table[next.intValue()];
		}
	
		if(n == 1){ //end
			return 1;
		}else{ //odd or even
			return 1 + seq(next);
		}
	}
}
