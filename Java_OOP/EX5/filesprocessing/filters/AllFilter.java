package filesprocessing.filters;

import java.io.File;
import java.util.ArrayList;

/**
 * the class represent all filter
 */
public class AllFilter extends Filter {

    /**
     * constrictor that get array of string and check if its contain the word NOT
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    AllFilter(ArrayList<String> filterArgs){
        super(filterArgs);

    }

    /**
     * The constrictor get a boolean factor if the filter is a default because an error has occurred
     * @param type1Error - true if need to print for type 1 error
     */
    AllFilter(boolean type1Error){
        super(type1Error);
    }

    @Override
    public boolean isPass(File file) {
        return true;
    }

    @Override
    public boolean errorCheck() {
        return false;
    }
}
