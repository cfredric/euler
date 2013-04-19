

public class prob016{
	public static void main(String[] args){
		
		//find 2^1000 using strings
		
		String prod = "1";
		
		int carry = 0;
		
		//calculate
		for(int i = 0;i<1000;i++){ //calculate 1000 powers of 2
			for(int j = prod.length()-1;j>=0;j--){ //process each digit of prev power, starting from the back
				int num = Integer.parseInt(String.valueOf(prod.charAt(j)));
				int n = num*2; //mult by two
				n += carry; //add the carried value
				carry = n / 10; //recalc carry value
				n %= 10;
				
				char[] chprod = prod.toCharArray();
				chprod[j] = String.valueOf(n).charAt(0);
				
				prod = new String(chprod);
				
				if(j==0 && carry!=0){
					String newprod = String.valueOf(carry) + prod;
					prod = newprod;
					carry = 0;
				}
			}
		}
		
		System.out.println("\n2^1000 == " + prod);
		
		int sum = 0;
		
		for(int i = 0;i<prod.length();i++){
			sum += Integer.parseInt(String.valueOf(prod.charAt(i)));
		}
		
		System.out.println("\nsum of digits = " + sum);
	}
}
