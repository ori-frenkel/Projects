package filesprocessing.exceptions;

/**
 * This exception would be thrown when 'ORDER' is missing or written incorrect (and it's type 2 error)
 */
public class OrderSubSectionException extends Exception implements ExceptionInterface {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor
	 */
	public OrderSubSectionException(){
		super("ERROR:");
	}

	@Override
	public String GET_ERROR_MSG() {
		return "ERROR: Order sub-section is incorrect, it should be 'ORDER' ";
	}
}
