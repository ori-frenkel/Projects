package filesprocessing;
import filesprocessing.exceptions.*;
import filesprocessing.filters.Filter;
import filesprocessing.filters.FilterFactory;
import filesprocessing.orders.OrderAbstract;
import filesprocessing.orders.OrderFactory;
import java.io.*;
import java.util.ArrayList;

/**
 * This class gets the command file path, and it's main method is to scan the file and make an array of
 * sections
 */
public class ScanAndSection {
	private final BufferedReader fileReader;
	private ArrayList<Section> allSections;
	public final static String FILTER = "FILTER";
	private final String ORDER = "ORDER";
	private FilterFactory temp = new FilterFactory();

	/**
	 *
	 * @param commandFilePath - The path of the command file
	 * @throws FileNotFoundException  - This function throws FileNotFoundException, but it should never happen
	 * according to the instruction in the excise.
	 */
	ScanAndSection(String commandFilePath) throws IOException, EmptyCommandFileException {
		// Create a buffered reader using decorator design pattern.
		this.fileReader = new BufferedReader(new FileReader(commandFilePath));
		this.readTheFirstLineOfTheCommandFile(this.fileReader);
		this.allSections = new ArrayList<Section>();
	}

	/**
	 * This function return an array of section.
	 * @return - array of section
	 * @throws IOException - IO exception
	 * @throws FilterSubSectionException -  if 'FILTER' is missing or written incorrect
	 * @throws OrderSubSectionException - if 'ORDER' is missing or written incorrect
	 * @throws MissingFilterUnderFilterException - if there is no filter under 'FILTER'
	 */
	public ArrayList<Section> ConvertToSections() throws IOException, FilterSubSectionException,
			 OrderSubSectionException, MissingFilterUnderFilterException {
		String currentLine = fileReader.readLine();
		// keep count of the line's number that we in. (initialized with current = 1, because the first line
		// is line number 1)
		int currentLineNumber = 1;

		while (currentLine != null){
			// this two store the line that error from type 1 occurred in each section
			int filterType1Error = Section.None;
			int orderType1Error = Section.None;
			// the first line of section needs to be "FILTER"
			if (!currentLine.equals(FILTER)){
				throw new FilterSubSectionException();
			}
			// move to the next line
			currentLine = fileReader.readLine();
			// update the number of line that we in.
			currentLineNumber++;
			// If there is no filter under FILTER
			if (currentLine == null){
				throw new MissingFilterUnderFilterException();
			}
			// create the right filter.
			Filter filter = temp.filterFactory(currentLine);
			// if error from type 1 occurred, update the line that happened
			if(filter.type1ErrorBeenOccur()){
				filterType1Error = currentLineNumber;
			}
			// after we done with the filter, move to the next line (which should be ORDER)
			currentLine = fileReader.readLine();
			// update the line that we are in.
			currentLineNumber++;
			// if the ORDER subsection is incorrect, than throw an exception that says that
			if (currentLine == null || !currentLine.equals(ORDER)){
				throw new OrderSubSectionException();
			}
			// move to the next line (that contain the type of order that we want to use)
			currentLine = fileReader.readLine();
			// update the number of line that we in.
			currentLineNumber++;
			// create the right order
			OrderAbstract order;
			order = OrderFactory.getOrder(currentLine);
			// if error from type 1 occurred, update the line that happened
			if(order.type1ErrorBeenOccur()){
				orderType1Error = currentLineNumber;
			}
			// create new section with the right filter and order in it.
			Section section = new Section(filter, order);
			// save in the section the line that errors from type 1 occurred
			section.setFilterTypeOneError(filterType1Error);
			section.setOrderTypeOneError(orderType1Error);
			// add the section to the sections array.
			this.allSections.add(section);
			// move to the next line if needed
			if (currentLine != null && !currentLine.equals(FILTER)){{
					currentLine = fileReader.readLine();
					currentLineNumber++;
				}
			}
		}
		// close the reader because we no more use it.
		fileReader.close();
		// return the array of section
		return allSections;
	}

	/*
	This class gets BufferedReader, read the first line, if it's null throw an exception, so the program
	would know to do nothing.
	 */
	private void readTheFirstLineOfTheCommandFile(BufferedReader buf) throws IOException,
			EmptyCommandFileException {
		buf.mark(1000);
		if(buf.readLine() == null){
			throw new EmptyCommandFileException();
		}
		// return to the first line of the command file in the first line isn't null
		buf.reset();
	}

}
