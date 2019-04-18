package filesprocessing.exceptions;

/**
 * This exception would be thrown when given wrong order name to order the files. (it type 1 error)
 */
public class UnsupportedOrderRequestException extends Exception implements ExceptionInterface {
	private static final long serialVersionUID = 1L;
	public UnsupportedOrderRequestException(){
		super();
	}

	@Override
	public String GET_ERROR_MSG() {
		return ("Error from type 1, given a wrong order name.");
	}
}
