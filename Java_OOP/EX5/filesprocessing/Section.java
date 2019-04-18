package filesprocessing;
import filesprocessing.filters.Filter;
import filesprocessing.orders.OrderAbstract;

/**
 * This class represent a single section in the command file
 */
public class Section {
	private Filter filter;
	private OrderAbstract order;
	// represent the line/order that error type 1 occur
	private int filterTypeOneError, orderTypeOneError;
	static final int None = -1;

	/**
	 * Constructor.
	 * @param filter - represent the filter in that section
	 * @param order - represent the order in that section
	 */
	Section(Filter filter, OrderAbstract order){
		this.filterTypeOneError = None;
		this.orderTypeOneError = None;
		this.filter = filter;
		this.order = order;
	}

	/*
	Set the line that error from type 1 been occur
	 */
	void setFilterTypeOneError(int line){
		this.filterTypeOneError = line;
	}
	// set the line that error from type 1 been occur
	void setOrderTypeOneError(int line){
		this.orderTypeOneError = line;
	}
	// get the line that error occurred
	public int getFilterTypeOneError() {
		return filterTypeOneError;
	}
	// get the line that error occurred
	public int getOrderTypeOneError() {
		return orderTypeOneError;
	}

	/*
	 * Filter getter.
	 * return: the section's filter.
	 */
	Filter getFilter() {
		return filter;
	}

	/*
	 * Order getter.
	 * return: the section's order.
	 */
	OrderAbstract getOrder() {
		return order;
	}


}