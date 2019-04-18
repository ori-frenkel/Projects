package filesprocessing.filters;
import java.io.File;
import java.util.ArrayList;
/**
 * This class represent a Filter for file of array of files
 */

public abstract class Filter {

    /** the place of the name of the filter in the array */
    static final int FILTER_NAME = 0;
    /** the place of the first argument in the array if there is one */
    static final int FIRST_IDX = 1;
    /** the place of the second argument in the array if there is one */
    static final int SECOND_IDX = 2;
    /** a final for the string YES */
    static final String YES = "YES";
    /** a final for the string NO */
    static final String NO = "NO";
    /** a final for the string NOt */
    private static final String NOT = "NOT";
    /** the parameter for negative int */
    static final int SIZE_ERODE_PARAM = 0;
    /** the divider factor to calculate the size of a file */
    static final double BITE_FACTOR = 1024;
    /** a default value to string */
    static final String DEFAULT_STRING = "-1";


    // true if the Filter have /had type 1 error
    private boolean type1Error = false;
    //if the filter contain not in the name
    private boolean dontContainNot = true;

    /**
     * constrictor that get array of string and check if its contain the word NOT
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    public Filter(ArrayList<String> filterArgs) {
        dontContainNot = !filterArgs.contains(NOT);
    }

    /**
     * constrictor that get array of string and check if its contain the word NOT,
     * @param type1Error - true if need to print for type 1 error
     */
    public Filter( boolean type1Error) {
        this.type1Error = type1Error;

    }

    /**
     * @return true if type1Error have been occur
     */
    public boolean type1ErrorBeenOccur(){
        return type1Error;
    }

    /**
     * @param file - the file to check
     * @return true if the file adheres to the conditions of the filter
     */
    public abstract boolean isPass(File file);


    /**
     * check if the filter have an error in the arguments
     * @return true if the arguments dont suite the filter
     */
    public abstract boolean errorCheck();


    /**
     * check for each file if he suitable to the filter,considerate if NOT was part of the name
     * @param fileList - the files we want to check
     * @return an array of the suitable files
     */
    public ArrayList<File> handleFilter(File[] fileList){
        ArrayList<File> fileList2 = new ArrayList<File>();
        for (File file : fileList)
            if (file.isFile() && dontContainNot == isPass(file)) //if we have NOT so we would like to give
                // the opposite Filter
                fileList2.add(file);
        return fileList2;
    }
}

