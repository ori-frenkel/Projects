package filesprocessing.filters;

import java.util.ArrayList;
import java.io.File;

/**
 * the class represent suffix filter
 */
public class SuffixFilter extends Filter {

    // the wishing suffix of the file name
    private String suffix;

    /**
     * us the super method
     * add the first argument as suffix
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    SuffixFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        suffix = filterArgs.get(FIRST_IDX);
    }

    @Override
    public boolean isPass(File file) {
        if (file.getName().endsWith(suffix))
            return true;
        return false;
    }

    @Override
    public boolean errorCheck() {
        return false;
    }
}
