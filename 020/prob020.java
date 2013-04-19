

public class prob020{
	public static void main(String[] args){
		
		//find 100! using strings
		
		String prod = "1";
		
		//calculate
		for(int i = 1;i<=100;i++){ //calculate 100!
			prod = smult(prod, i);
		}
		
		System.out.println("\n100! == " + prod);
		
		int sum = 0;
		
		for(int i = 0;i<prod.length();i++){
			sum += Integer.parseInt(String.valueOf(prod.charAt(i)));
		}
		
		System.out.println("\nsum of digits = " + sum);
	}
	
	public static String smult(String s, int k){
		int carry = 0;
		for(int j = s.length()-1;j>=0;j--){ //process each digit of prev power, starting from the back
			int num = Integer.parseInt(String.valueOf(s.charAt(j)));
			int n = num*k; //mult by k
			n += carry; //add the carried value
			carry = n / 10; //recalc carry value
			n %= 10;
			
			char[] chs = s.toCharArray();
			chs[j] = String.valueOf(n).charAt(0);
			
			s = new String(chs);
			
			if(j==0 && carry!=0){
				String news = String.valueOf(carry) + s;
				s = news;
				carry = 0;
			}
		}
		return s;
	}
}
