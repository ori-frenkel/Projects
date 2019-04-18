package filesprocessing.exceptions;

/** This class represent an exception that will be thrown when there is no filter under 'FILTER' sub-section
 * (it's type 2 error)
 *  */

public class MissingFilterUnderFilterException extends Exception implements ExceptionInterface {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor
	 */
	public MissingFilterUnderFilterException(){
		super("ERROR:");
	}
	@Override
	public String GET_ERROR_MSG() {
		return "ERROR: There is not filter under 'FILTER'";
	}
}
