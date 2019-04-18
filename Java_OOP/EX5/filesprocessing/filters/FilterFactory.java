package filesprocessing.filters;
import java.util.ArrayList;
import java.util.Collections;


/**
 * This class is a Filter Factory than get name and parameter of filter and return the suitable filter
 */
public class FilterFactory {
    //all are finals of the filters names
    private static final String GREATER_THAN = "greater_than" ;
    private static final String BETWEEN = "between" ;
    private static final String SMALLER_THAN = "smaller_than" ;
    private static final String FILE = "file" ;
    private static final String CONTAINS = "contains" ;
    private static final String PREFIX = "prefix";
    private static final String SUFFIX = "suffix" ;
    private static final String WRITABLE = "writable" ;
    private static final String EXECUTABLE = "executable" ;
    private static final String HIDDEN = "hidden";
    private static final String ALL = "all" ;

    //final for the string #
    private static final String SEPARATE_STRING = "#";
    private static final boolean ERROR_OCCUR = true;


    /**
     * A default constructor
     */
    public FilterFactory(){}


    /**
     * check if the name of the asked filter is fit for the exist filters if not return allFilter
     * than check if the parameters are suitable for the Certain filter if not return  allFilter
     * @param askedFilter - a string of the name and parameters of the filter
     * @return suitable filter for the asked filter
     */
    public Filter filterFactory(String askedFilter){
        Filter suitableFilter;
        ArrayList<String> filterArgs = splitFilerString(askedFilter);
        int count = 0;
        for (int i=0; i<filterArgs.size();i++){
        	if(filterArgs.get(i).equals("-1")){
        		count++;
			}
		}
        switch (filterArgs.get(Filter.FILTER_NAME)){
            case GREATER_THAN:
            	/* there can be max 3 args greater_than than a number and than NOT, if there is more args, or
				 that the third argument isn't NOT than that type 1 error and create the default filter*/
				if((filterArgs.size()-count) >= 3 && !filterArgs.get(2).equals("NOT")){
					suitableFilter = new AllFilter(ERROR_OCCUR);
				}
				else{
					suitableFilter = new GreaterThanFilter(filterArgs);
				}
                break;
            case BETWEEN:
                suitableFilter = new BetweenFilter(filterArgs);
                break;
            case SMALLER_THAN:
            	/* there can be max 3 args smaller_than than a number and than NOT, if there is more args, or
				 that the third argument isn't NOT than that type 1 error and create the default filter*/
				if((filterArgs.size()-count) >= 3 && !filterArgs.get(2).equals("NOT")){
					suitableFilter = new AllFilter(ERROR_OCCUR);
				}
				else{
					suitableFilter = new SmallerThanFilter(filterArgs);
				}
                break;
            case FILE:
                suitableFilter = new FileFilter(filterArgs);
                break;
            case CONTAINS:
                suitableFilter = new ContainsFilter(filterArgs);
                break;
            case PREFIX:
                suitableFilter = new PrefixFilter(filterArgs);
                break;
            case SUFFIX:
                suitableFilter = new SuffixFilter(filterArgs);
                break;
            case WRITABLE:
                suitableFilter = new WritableFilter(filterArgs);
                break;
            case EXECUTABLE:
                suitableFilter = new ExecutableFilter(filterArgs);
                break;
            case HIDDEN:
                suitableFilter = new HiddenFilter(filterArgs);
                break;
            case ALL:
                suitableFilter = new AllFilter(filterArgs);
                break;
            default:
                suitableFilter = new AllFilter(ERROR_OCCUR);
                break;
        }
        if (suitableFilter.errorCheck())
            suitableFilter = new AllFilter(ERROR_OCCUR);
        return suitableFilter;
    }

    /**
     * the function returns an array of the words that have # between them
     * @param string the string we want to split
     * @return an array of strings
     */
    private static ArrayList<String> splitFilerString(String string){
		String[] commandParts = string.split(SEPARATE_STRING);
        ArrayList<String> stringArray = new ArrayList<String>();
		Collections.addAll(stringArray, commandParts);
		for(int i = 0; i < Filter.SECOND_IDX; i++)
            stringArray.add(Filter.DEFAULT_STRING);
		return stringArray;
    }
}
