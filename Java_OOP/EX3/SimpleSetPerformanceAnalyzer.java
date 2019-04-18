import java.util.*;
public class SimpleSetPerformanceAnalyzer {


	private static final int OPEN_HASHSET = 0;
	private static final int CLOSE_HASTSET = 1;
	private static final int JAVA_TREESET = 2;
	private static final int JAVA_LINKED_LIST = 3;
	public static void main(String[] args){
		final int  NUMBER_OF_STRUCTURES_TO_CHECK = 5; // the number of  data structures that need to be check
		String[] data1Arr = Ex3Utils.file2array("src/data1.txt");
		String[] data2Arr = Ex3Utils.file2array("src/data2.txt");
		long[] openHashTimes = new long[6];
		long[] closeHashTimes = new long[6];
		long[] treeSetTimes = new long[6];
		long[] linkedListTimes = new long[6];
		long[] hashSetTimes = new long[6];
		for (int i = 0; i<NUMBER_OF_STRUCTURES_TO_CHECK; i++){
			if(i == OPEN_HASHSET){ // it's possible use Case instead of if, (but I choose to stay with if)
				SimpleSet openHashAr = new OpenHashSet();
				assert data1Arr != null;
				warmUp(openHashAr);
				TimesOpenHash(data1Arr,data2Arr , openHashAr,openHashTimes);
			}
			else if(i == CLOSE_HASTSET){
				SimpleSet closeHashAr = new ClosedHashSet();
				warmUp(closeHashAr);
				TimesCloseHashSet(data1Arr,data2Arr , closeHashAr, closeHashTimes);
			}
			else if(i == JAVA_TREESET){
				SimpleSet treeSetAr = new CollectionFacadeSet(new TreeSet<String>());
				warmUp(treeSetAr);
				TimesCloseHashSet(data1Arr,data2Arr , treeSetAr, treeSetTimes);
			}
			else if(i == JAVA_LINKED_LIST){
				SimpleSet linkedListArr = new CollectionFacadeSet(new LinkedList<String>());
				warmUp(linkedListArr);
				TimesCloseHashSet(data1Arr,data2Arr , linkedListArr, linkedListTimes);
			}
			else{ // else = java HashSet
				SimpleSet hashSetAr = new CollectionFacadeSet(new HashSet<String>());
				warmUp(hashSetAr);
				TimesCloseHashSet(data1Arr,data2Arr , hashSetAr, hashSetTimes);
			}
		}
		FinalTimes(openHashTimes);
		FinalTimes(closeHashTimes);
		FinalTimes(treeSetTimes);
		FinalTimes(linkedListTimes);
		FinalTimes(hashSetTimes);
	}
	private static void FinalTimes(long[] arr){
		System.out.println("Add all the words from data 1 "+ arr[0]);
		System.out.println("Add all the words from data 2 "+ arr[1]);
		System.out.println("Check if 'hi' is in the set that was made from data 1 "+ arr[2]);
		System.out.println("Check if '-13170890158' is in the set that was made from data 1 "+ arr[3]);
		System.out.println("Check if '23' is in the set that was made from data 2 "+ arr[4]);
		System.out.println("Check if 'hi' is in the set that was made from data 2 "+ arr[5]);
	}
	private static void TimesCloseHashSet(String[] data1Arr, String[] data2Arr, SimpleSet closeHashAr,
										    long[] closeHashTimes){
		dataOneTimes(data1Arr, closeHashAr, closeHashTimes, 0); // checks time to add data 1
		containCheck(closeHashAr,closeHashTimes, "hi",2); /* the time it take check for
				contain hi */
		containCheck(closeHashAr,closeHashTimes, "-13170890158",3); /* the time it take
				check for  -13170890158  */
		closeHashAr = new ClosedHashSet();
		assert data2Arr != null;
		dataOneTimes(data2Arr, closeHashAr, closeHashTimes, 1); // checks time to add data 2
		containCheck(closeHashAr,closeHashTimes, "23",4); // the time it take check for  23
		containCheck(closeHashAr,closeHashTimes, "hi",5); // the time it take check for  hi

	}

	/*
	Calculate the times with open hash data structure and add the times openHashTimes.
	(Calculate the times for the given operation)
	 */
	private static void TimesOpenHash(String[] data1Arr, String[] data2Arr, SimpleSet openHashAr,
									  long[] openHashTimes){
		dataOneTimes(data1Arr, openHashAr, openHashTimes, 0); // checks time to add data 1
		containCheck(openHashAr,openHashTimes, "hi",2); /* the time it take check for
				contain hi */
		containCheck(openHashAr,openHashTimes, "-13170890158",3); /* the time it take
				check for  -13170890158  */
		openHashAr = new OpenHashSet();
		assert data2Arr != null;
		dataOneTimes(data2Arr, openHashAr, openHashTimes, 1); // checks time to add data 2
		containCheck(openHashAr,openHashTimes, "23",4); // the time it take check for  23
		containCheck(openHashAr,openHashTimes, "hi",5); // the time it take check for  hi

	}



	/*
	String[] dataArr - the array that we want to add all of it's information to openHashAr
	SimpleSet HashAr - The set that we want to transfer all the information to.
	long[] hashTime - An array that contains the times it's take to do the required operation
	int num - The index in the hashTime, that we want to add the times it's takes to do the add operations
	 */
	private static void dataOneTimes(String[] dataArr, SimpleSet HashAr, long[] hashTime, int num){
		long timeBefore = System.nanoTime();
		for (int j = 0; j<dataArr.length; j++){
			HashAr.add(dataArr[j]);
		}
		long difference = ((System.nanoTime() - timeBefore)/(1000000)); /* compute the time in
				milliseconds */
		hashTime[num] = difference;
	}

	/*
	This function do contains for 1000000000 nanoSec (= 1 sec) and than take avg, in order to compute
	as accurately as possible the time it's take to do that method
	SimpleSet checkHere - the SimpleSet that we want to check if the String check is in.
	long[] hashTime - array the contains the times it's take to do the given operations.
	String check - the string that we want to search for (if contain).
	int index - the index in the time's array that we want to add the times for the contain operation.
	 */
	private static void containCheck(SimpleSet checkHere, long[] hashTime,String check, int index){
		long difference = 0, count = 0;
		long timeBefore = System.nanoTime();
		while(difference < 1000000000){
			checkHere.contains(check);
			count++;
			difference = (System.nanoTime() - timeBefore);
		}
		long avg = (1000000000/count);
		hashTime[index] = avg;
	}

	/*
	This function responsible for the warm up, it's add and remove strings from the sets in order to warm up
	highly used method
	 */
	private static void warmUp(SimpleSet hashAr){
		for (int i = 0; i<25000; i++){
			hashAr.add("a");
			hashAr.contains("a");
			hashAr.delete("a");
		}
	}



}
