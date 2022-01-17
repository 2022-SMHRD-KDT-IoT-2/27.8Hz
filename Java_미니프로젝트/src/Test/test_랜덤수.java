package Test;

import java.util.Random;

public class test_·£´ı¼ö {

	public static void main(String[] args) {
		 Random rd = new Random();
		 int[] arr = new int[3];
		 
		 for (int i=0; i<arr.length; i++) {
			 arr[i] = rd.nextInt(100)+1;
		 }
		 
		 for(int a : arr) {
			 System.out.println("·£´ı¼ö : " + a);
		 }

	}

}
