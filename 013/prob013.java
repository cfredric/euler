import java.io.*;
import java.util.Scanner;

public class prob013{
	public static void main(String args[]){
		
		String numbers[] = new String[100];
		
		//get numbers to add
		try{
			File numf = new File("nums.txt");
			Scanner numscan = new Scanner(numf);
			int i = 0;
			while(numscan.hasNextLine()){
				//read numbers from the file, and store in array
				numbers[i++] = numscan.nextLine();
			}
		}catch(Exception e){
			System.out.println("ERROR OH GOD NO\n" + e);
			System.exit(1);
		}
		
		//array of ints to store column sums
		int sum[] = new int[50];
		
		for(int i = 49; i >= 0;i--){ //for each column, starting at the back
			for(int j = 0;j < numbers.length;j++){ //for each long number
				//add to the int storing the sum for that column
				sum[i] += Integer.parseInt(String.valueOf(numbers[j].charAt(i))); 
			}
			
			//catch overflow
			if(i > 0){
				sum[i-1] += sum[i]/10;
				sum[i] %= 10;
			}	
		}
		
		String sumS = new String();
		for(int i = 0;i<50;i++){
			System.out.print(sum[i] + "");
			sumS += sum[i];
		}
		
		System.out.println();
		System.out.printf("%.10s\n",sumS);
	}
}
