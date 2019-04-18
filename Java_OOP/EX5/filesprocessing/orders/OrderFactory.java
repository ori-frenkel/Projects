package filesprocessing.orders;
import filesprocessing.ScanAndSection;
import filesprocessing.exceptions.UnsupportedOrderRequestException;

/**
 * This class implements the factory design pattern, it's main method is getOrder which create and return
 * the right order object.
 */
public class OrderFactory {
	/* represent SEPARATOR string */
	private final static String SEPARATOR = "#";
	private final static int THE_ORDER = 0;

	/**
	 *
	 * @param order - string that represent the line under 'ORDER'
	 * @return - object of the right order
	 */
	public static OrderAbstract getOrder(String order)  {
		// if got a null than use the default order, meaning abs order.(without any error)
		// if got FILTER, Than that mean that we need to use the default (if ORDER followed by FILTER)
		if (order == null || order.equals(ScanAndSection.FILTER)){
			return new Abs();
		}
		// separate the order command in order to know whether or not to use the reverse of the command
		String[] commandSplitter = order.split(SEPARATOR);
		// represent the index that reverse would appear if exist
		int REVERSE = commandSplitter.length - 1;
		OrderAbstract orderToReturn;
		try{
			if (commandSplitter[THE_ORDER].equals("size")){
				orderToReturn = new Size();
			}
			else if ((commandSplitter[THE_ORDER].equals("type"))){
				orderToReturn = new Type();
			}
			else if ((commandSplitter[THE_ORDER].equals("abs"))){
				orderToReturn = new Abs();
			}
			else{
				throw new UnsupportedOrderRequestException();
			}
			// Checks if we need to reverse the order, and if so do that. (if there is a reverse command it
			// would appear in the last index of the array.
			if (commandSplitter[REVERSE].equals("REVERSE")){
				orderToReturn = new ReverseTheOrder(orderToReturn);
			}
		}
		catch (UnsupportedOrderRequestException error){
			// if given wrong order name, than uses the abs order.
			orderToReturn = new Abs();
			orderToReturn.SetType1ErrorBeenOccur(true);
		}
		return orderToReturn;
	}
}
