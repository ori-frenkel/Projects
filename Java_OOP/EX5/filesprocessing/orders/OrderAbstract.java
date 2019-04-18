package filesprocessing.orders;

import java.io.File;
import java.util.Comparator;

/**
 * This class Orders, and what each order should include, I choose to do it abstract because there is no
 * reason/logic to make an instance of this class
 */
public abstract class OrderAbstract implements Comparator<File> {

	/* represent if error from type 1 been occurred */
	private boolean type1ErrorOccurred;
	int  FILE_NUM1_BIGGER = 1;
	int  FILE_NUM2_BIGGER = -1;
	int THE_FILES_ARE_EQUALS = 0;

	/*
	Constructor
	 */
	OrderAbstract(){
		this.type1ErrorOccurred = false;
	}

	/**
	 *
	 * @param fileNum1 -  A file to compare to another file
	 * @param fileNum2 - The second file that we want to compare to the first file
	 * @return - 1 if the fileNum1 is bigger than fileNum2, -1 if the opposite is true, 0 if they both equals.
	 */
	public abstract int compare(File fileNum1, File fileNum2);

	/**
	 *
	 * @return true if type 1 Error been occur, false otherwise
	 */
	public boolean type1ErrorBeenOccur() {
		return type1ErrorOccurred;
	}

	/**
	 * This function set the given parameter as type1ErrorOccurred (if type 1 error occurred or not)
	 * @param errorOccur - represent boolean expression that says if type 1 error occurred
	 */
	public void SetType1ErrorBeenOccur(boolean errorOccur) {
		this.type1ErrorOccurred = errorOccur;
	}

}
