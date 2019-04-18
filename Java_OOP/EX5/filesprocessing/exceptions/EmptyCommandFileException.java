package filesprocessing.exceptions;

/**
 * This exception would be thrown when the command file is empty. (it doesn't considers as type 2 error,
 * therefore it doesn't implement ExceptionInterface)
 */
public class EmptyCommandFileException extends Exception {
	public EmptyCommandFileException(){
		super();
	}
}
