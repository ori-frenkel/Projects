package filesprocessing.filters;

import java.io.File;
import java.util.ArrayList;

/**
 * the class represent contains filter
 */
public class ContainsFilter extends Filter {


    // the value we check the name contains
    private String value;
    /**
     * us the super method
     * add the first argument as value
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    ContainsFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        value = filterArgs.get(FIRST_IDX);
    }




    @Override
    public boolean isPass(File file) {
        if (file.getName().contains(value))
            return true;
        return false;

    }

    @Override
    public boolean errorCheck() {
        return false;
    }
}
