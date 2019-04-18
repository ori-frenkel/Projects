package filesprocessing.orders;
import java.io.File;

/**
 * This class represent reverse order, it purpose is to get order and do the reverse of that order.
 */
public class ReverseTheOrder extends OrderAbstract {
	private OrderAbstract order;
	/*
	Constructor
	 */
	ReverseTheOrder(OrderAbstract order){
		this.order = order;
	}

	/**
	 *
	 * @param file1 - The first file to compare (compare to file2)
	 * @param file2 - The second file to compare (compare to file1)
	 * @return - Integer the represent if file 1 bigger than file 2, or if the opposite in true, or if they'r
	 * equals.
	 */
	public int compare(File file1, File file2){
		// compare the file according to the original order
		int compareFilesResult = order.compare(file1, file2);
		// return the opposite of the return result
		if (compareFilesResult > 0){
			return FILE_NUM2_BIGGER;
		}
		else if (compareFilesResult < 0){
			return FILE_NUM1_BIGGER;
		}
		else
			return THE_FILES_ARE_EQUALS;
	}

	@Override
	public boolean type1ErrorBeenOccur() {
		return this.order.type1ErrorBeenOccur();
	}

	@Override
	public void SetType1ErrorBeenOccur(boolean errorOccur) {
		this.order.SetType1ErrorBeenOccur(errorOccur);
	}
}
