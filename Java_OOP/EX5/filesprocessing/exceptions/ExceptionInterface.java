package filesprocessing.exceptions;

/**
 * Use this interface in order to inforce that each exception that use this interface would have error msg
 * getter. use it in part of the design, so it would be easy to add new exception with out add new 'catch' in
 * DirectoryProcessor. (so I would be able to do this : error.GET_ERROR_MSG )
 */
public interface ExceptionInterface {
	String GET_ERROR_MSG();
}