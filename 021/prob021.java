public class prob021{
	public static void main(String args[]){
		
		int sum = 0;
		
		for(int i = 1;i<10000;i++){
			int x = d(i);
			if(x != i){
				if(d(x) == i) sum += i; //amicable pair found; add one of the pair (the other has already been found, or will be found later
			}
		}
		
		System.out.println(sum);
		
	}
	
	public static int d(int n){
		//return the sum of the proper divisors of n
		int sum = 0;
		for(int i = 1;i<n;i++){
			if(n%i == 0){ //proper divisor found
				sum += i;
			}
		}
		return sum;
	}
}
