package filesprocessing.orders;

import java.io.File;
/**
 * Sort files by absolute name (using File.getAbsolutePath() ), going from ‘a’ to ‘z’
 */
public class Abs extends OrderAbstract {
	/*
	 * Constructor
	 */
	Abs(){
		super();
	}

	@Override
	public int compare(File fileNum1, File fileNum2) {
		String fileNum1Path = fileNum1.getAbsolutePath();
		String fileNum2Path = fileNum2.getAbsolutePath();
		// according to compareTo string api, when the files are equals it's return 0.
		if (fileNum1Path.compareTo(fileNum2Path) == 0){
			return THE_FILES_ARE_EQUALS;
		}
		/* according to compareTo string api, when the fileNum1Path is "bigger" than fileNum1Path it returns
		positive number */
		else if (fileNum1Path.compareTo(fileNum2Path) > 0){
			return FILE_NUM1_BIGGER;
		}
		/* according to compareTo string api, when the fileNum1Path is "smaller" than fileNum1Path it returns
		negative number */
		else{
			return FILE_NUM2_BIGGER;
		}
	}


}
