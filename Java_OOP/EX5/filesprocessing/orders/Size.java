package filesprocessing.orders;
import java.io.File;

/**
 * This class represent order, it order the files by their size
 */
public class Size extends OrderAbstract  {
	/*
	Constructor
	 */
	Size(){
		super();
	}

	@Override
	public int compare(File fileNum1, File fileNum2) {
		double fileNum1Size = fileNum1.length();
		double fileNum2Size = fileNum2.length();
		if (fileNum1Size > fileNum2Size){
			return FILE_NUM1_BIGGER;
		}
		else if (fileNum1Size < fileNum2Size){
			return FILE_NUM2_BIGGER;
		}
		// if both file has the same size, than order it according to abs.
		else{
			Abs absOrder = new Abs();
			return absOrder.compare(fileNum1, fileNum2);
		}
	}

}
