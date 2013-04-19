public class prob025{
	private static final int MAX = 5000;
	public static void main(String[] args){
		long startTime = System.currentTimeMillis();
		String[] fibTable = new String[MAX];
		int k = 0;
		String fib = "";
		
		while(fib.length() < 1000){
			fib = fib(++k, fibTable);
		}
		
		System.out.println("k: " + k);
		
		System.out.println("Time taken: " + (System.currentTimeMillis() - startTime) + " millis");
	}
	
	private static String fib(int n, String[] fibTable){
		if(n <= 2)
			return fibTable[1] = fibTable[2] = String.valueOf(1);
		if(fibTable[n] != null)
			return fibTable[n];
		return fibTable[n] = stringAdd(fib(n-2, fibTable), fib(n-1, fibTable));
	}
	
	private static String stringAdd(String str1, String str2){
		//only works with integral valued strings
		
		//make sure the strings are the same length: if str1 is longer, switch them
		if(str1.length() > str2.length()){
			return stringAdd(str2, str1);
		}
		
		// while 2nd is longer, pad str1 with zeroes on the left
		while(str1.length() < str2.length()){
			str1 = "0" + str1;
		}
		
		int carry = 0;
		String sum = "";
		for(int i = str1.length() - 1; i >= 0; i--){ //for each character (digit) in the string, starting on the right
			//add the two parallel digits, and the carry digit
			carry += Integer.parseInt(String.valueOf(str1.charAt(i))) + Integer.parseInt(String.valueOf(str2.charAt(i)));
			
			sum = String.valueOf(carry % 10) + sum;
			carry /= 10;
		}
		//if carry is nonzero at the end, need to extend the sum with it at the front
		if(carry != 0)
			sum = String.valueOf(carry) + sum;
		
		return sum;
	}
}
