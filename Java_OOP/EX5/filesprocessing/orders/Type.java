package filesprocessing.orders;
import java.io.File;

/**
 * Sort files by file type, going from ‘a’ to ‘z’
 */
public class Type extends OrderAbstract {
	/*
	Constructor
	 */
	Type(){
		super();
	}

	/*
	This function return a string that represent the file type.
	 */
	private String getFileType(File file){
		String fileName = file.getName();
		// The file type is after the last point of the file name.
		String POINT_OF_TYPE = ".";
		return fileName.substring(fileName.lastIndexOf(POINT_OF_TYPE)+ 1);

	}

	@Override
	public int compare(File fileNum1, File fileNum2) {
		String fileType1 = this.getFileType(fileNum1);
		String fileType2 = this.getFileType(fileNum2);
		if (fileType1.compareTo(fileType2) > 0){
			return FILE_NUM1_BIGGER;
		}
		else if (fileType1.compareTo(fileType2) < 0){
			return FILE_NUM2_BIGGER;
		}
		// if the file type are equals than we sort by Abs
		else{
			Abs absOrder = new Abs();
			return absOrder.compare(fileNum1, fileNum2);
		}
	}


}
