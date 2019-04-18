package filesprocessing.exceptions;

/**
 * This Exception would be thrown when the number of args is incorrect
 */
	public class WrongNumberOfArgsMyException extends Exception implements ExceptionInterface {
	private static final long serialVersionUID = 1L;

	public WrongNumberOfArgsMyException() {
			super("ERROR:");
		}

	@Override
	public String GET_ERROR_MSG() {
		return "ERROR: Wrong number of arguments, the number of arguments should be 2";
	}
}
