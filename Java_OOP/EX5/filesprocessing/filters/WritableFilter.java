package filesprocessing.filters;

import java.io.File;
import java.util.ArrayList;

/**
 * the class represent writable filter
 */
public class WritableFilter extends Filter {

    // the question we ask if the file is writable
    private String writable;

    /**
     * us the super method
     * add the first argument as writable
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    WritableFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        writable = filterArgs.get(FIRST_IDX);
    }

    @Override
    public boolean isPass(File file) {
        if (file.canWrite() == writable.equals(YES))
            return true;
        return false;
    }

    @Override
    public boolean errorCheck() {
        if(writable.equals(YES) || writable.equals(NO))
            return false;
        return true;
    }
}
