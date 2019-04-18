package filesprocessing.exceptions;

/**
 * This exception would be thrown if 'FILTER' is missing or written incorrect in one of the sections
 * (this is considers at type 2 errors)
 */
public class FilterSubSectionException extends Exception implements ExceptionInterface {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor
	 */
	public FilterSubSectionException(){
		super("ERROR:");
	}
	@Override
	public String GET_ERROR_MSG() {
		return "ERROR: FILTER sub-section is incorrect, it should be 'FILTER' ";
	}
}
