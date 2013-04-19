public class prob017{
	public static void main(String args[]){
		
		//sum the amount of letters needed to spell out all the numbers from 1 to 1000
		//(not including spaces, hyphens)
		
		long sum = 0;
		
		for(int i = 1;i<=1000;i++){
			sum += count(i);
		}
		
		//print out answer
		
		System.out.println("Total characters: " + sum);
	}
	
	public static int count(int n){
		int c = 0;
		
		//deal with 1000
		if(n/1000 == 1){
			c += amtOnes(n/1000) + 8; // num + "thousand"
		}
		
		//deal with hundreds
		if((n%1000)/100 > 0){
			c += amtOnes((n%1000)/100) + 7; // num + "hundred"
			if(n%100 != 0){
				c += 3; // "and"
			}
		}
		
		//deal with tens
		if((n%100)/10 > 1){
			c += amtTens((n%100)/10);
		}
		
		//deal with teens, and ones
		if(n%100 <= 19){ //teens, ten
			c += amtOnes(n%100);
		}else{ //deal only with ones
			c += amtOnes(n%10);
		}
		
		return c;
	}
	public static int amtOnes(int n){
		switch (n){
			case 1:  //one
			case 2:  //two
			case 6:  //six
			case 10:  //ten
				return 3;
			case 4:  //four
			case 5:  //five
			case 9:  //nine
				return 4;
			case 3:  //three
			case 7:  //seven
			case 8:  //eight
				return 5;
			case 11:  //eleven
			case 12:  //twelve
				return 6;
			case 15:  //fifteen
			case 16:  //sixteen
				return 7;
			case 13:  //thirteen
			case 14:  //fourteen
			case 18:  //eighteen
			case 19:  //nineteen
				return 8;
			case 17:  //seventeen
				return 9;
			default:
				if(n != 0) System.out.println("ERROR ones ("+n+")");
				return 0;
		}
		
	}
	public static int amtTens(int n){
		switch (n){
			case 4:  //forty
			case 5:  //fifty
			case 6:  //sixty
				return 5;
			case 2:  //twenty
			case 3:  //thirty
			case 8:  //eighty
			case 9:  //ninety
				return 6;
			case 7:  //seventy
				return 7;
			default:
				if(n != 0) System.out.println("ERROR tens ("+n+")");
				return 0;
		}
	}
}
