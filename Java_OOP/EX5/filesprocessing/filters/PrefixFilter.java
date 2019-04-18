package filesprocessing.filters;

import java.io.File;
import java.util.ArrayList;
/**
 * the class represent prefix filter
 */

public class PrefixFilter extends Filter {

    // the wishing prefix of the file name
    private String prefix;


    /**
     * us the super method
     * add the first argument as prefix
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    PrefixFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        prefix = filterArgs.get(FIRST_IDX);
    }

    @Override
    public boolean isPass(File file) {
        if (file.getName().startsWith(prefix))
            return true;
        return false;
    }

    @Override
    public boolean errorCheck() {
        return false;
    }
}
