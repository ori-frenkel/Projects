package filesprocessing.filters;
import java.io.File;
import java.util.ArrayList;

/**
 * the class represent greater_than filter
 */
public class GreaterThanFilter extends Filter {

    // the minimal size of a file
    private double sizeFactor;

    /**
     * us the super method
     * add the first argument as sizeFactor
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    GreaterThanFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        sizeFactor = Double.parseDouble(filterArgs.get(FIRST_IDX));
    }

    @Override
    public boolean isPass(File file) {
        if (file.length() / BITE_FACTOR > sizeFactor)
            return true;
        return false;

    }

    @Override
    public boolean errorCheck (){
        if (sizeFactor < SIZE_ERODE_PARAM)
            return true;
        return false;
    }

}
