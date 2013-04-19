public class prob019{
	public static void main(String args[]){
		//count the sundays that fall on the first of the month
		//from 1/1/1901 to 12/31/2000
		
		
		//use mod to decide which day a date is
		//Sunday: 0
		//Monday: 1
		//Tuesday: 2
		//Wednesday: 3
		//Thursday: 4
		//Friday: 5
		//Saturday: 6
		
		int sunCounter = 0;
		
		int curDay = 2; // 1/1/1901 was a Tuesday
		
		int curMonth; //start at January
		int curYear; //start in 1901
		
		
		//progress through years, until 2001
		for(curYear = 1901;curYear<2001;curYear++){ //years loop
			for(curMonth = 0;curMonth<12;curMonth++){ //months loop
				curDay += addM(curMonth,curYear);
				curDay %= 7; //keep track of what day it is
				if(curDay == 0) sunCounter++;
			}
		}
		
		System.out.println("Total: " + sunCounter);
		
	}
	
	public static int addM(int month, int year){
		switch (month){
			case 0: //january
			case 2: //march
			case 4: //may
			case 6: //july
			case 7: //august
			case 9: //october
			case 11: //december
				return 31;
			case 3: //april
			case 5: //june
			case 10: //november
				return 30;
			case 1: //february
				return (((year%4==0 && year%100!=0)||year%400==0)?29:28); //deal with leap years
			default:
				return 0;
		}
	}
	
}
