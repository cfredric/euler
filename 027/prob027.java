public class prob027 {
	public static void main(String[] args){
		long startTime = System.currentTimeMillis();
		int maxStreak = 0;
		long prod = 0;
		
		boolean[] primes = new boolean[17250];
		for(int i = 0; i < primes.length; i++){ //make an array of the primes under 17250
			primes[i] = isPrime(i);
		}
		
		for(int a = -999; a <= 999; a++){
			for(int b = -999; b <= 999; b++){
				if(!primes[abs(b)] || (a == b && b < maxStreak)) //if b is not prime, or a == b and won't create a new max
					continue;
				int n = 0, streak = 0;
				while (primes[abs(eval(a,b,n))]){
					streak++;
					n++;
				}
				if(streak > maxStreak){
					maxStreak = streak;
					prod = a * b;
				}
			}
		}
		System.out.println("Time taken: " + (System.currentTimeMillis() - startTime) + " millis");
		System.out.println(prod);
	}
	
	private static boolean isPrime(int n){
		if(n % 2 == 0)
			return false;
		int k = (int) Math.sqrt(n);
		for(int i = 3; i <= k; i += 2){
			if(n % i == 0){
				return false;
			}
		}
		return true;
	}
	
	private static int eval(int a, int b, int n){
		return n*n + n*a + b;
	}
	
	private static int abs(int n){
		return n >= 0 ? n : -n;
	}
}