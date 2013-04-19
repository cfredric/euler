import java.util.Scanner;
import java.io.*;

public class prob067{
	private static int ncount = 0;
	
	public static void main(String args[]){
		
		int linecnt = 0;
		
		String fname = "triangle.txt";
		
		try{
			File numf = new File(fname);
			Scanner numscan = new Scanner(numf);
			while(numscan.hasNextLine()){
				//count lines
				String temp = numscan.nextLine();
				linecnt++;
			}
		}catch(Exception e){
			System.out.println("ERROR counter\n" + e);
			System.exit(1);
		}
		
		
		Node nums[][] = new Node[linecnt][];
		
		//get numbers to add
		try{
			File numf = new File(fname);
			Scanner numscan = new Scanner(numf);
			int i = 0;
			int lim = 1;
			while(numscan.hasNextLine()){
				//read numbers from the file, and store in array
				String temp = numscan.nextLine();
				Scanner scan = new Scanner(temp);
				
				//make row
				nums[i] = new Node[lim++];
				
				int j = 0;
				while(scan.hasNextInt()){ //populate row
					nums[i][j++] = new Node(scan.nextInt()); //store the value
				}
				
				i++;
			}
		}catch(Exception e){
			System.out.println("ERROR populator\n" + e);
			System.exit(1);
		}
		
		//use dynamic programming
		
		
		int max = 0;
		nums[0][0].sum = nums[0][0].n;
		
		for(int i =1;i<nums.length;i++){
			for(int j = 0;j<nums[i].length;j++){
				if(j==0){ //first in the row
					nums[i][j].sum = nums[i-1][j].sum + nums[i][j].n;
				}else if(j==nums[i].length-1){ //last in the row
					nums[i][j].sum = nums[i-1][j-1].sum + nums[i][j].n;
				}else{
					nums[i][j].sum = Math.max(nums[i-1][j].sum,nums[i-1][j-1].sum) + nums[i][j].n;
				}
				if(i==nums.length-1){ //store the maximum
					max = Math.max(max, nums[i][j].sum);
				}
			}
		}
		
		System.out.println("Maximum: " + max);
	}
}

class Node{
	public int n;
	public int sum;
	
	Node(int n){
		this.n = n;
		sum = 0;
	}
}
