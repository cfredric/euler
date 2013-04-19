public class prob010{
	public static void main(String args[]){
		long sum = 2; 
		
		for(int i = 3; i < 2000000;i++){ //check all numbers < 2,000,000 for primality
			
			boolean prime = true;
			if(i%2 == 0){
				prime = false;
			}else{
				for(int j = 3; j <= Math.sqrt(i); j +=2){
					if(i%j == 0){
						prime = false;
						break;
					}
				}
			}
			
			//finished checking number, add it to sum if prime
			if(prime){
				sum += i;
			}
		}
		
		System.out.println("sum = " + sum);
	}
}
