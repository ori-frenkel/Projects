package filesprocessing.filters;
import java.io.File;
import java.util.ArrayList;

/**
 * the class represent smaller_than filter
 */
public class SmallerThanFilter extends Filter {
    // the maximal size of the file
    private double sizeFactor;

    /**
     * us the super method
     * add the first argument as sizeFactor
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    SmallerThanFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        sizeFactor = Double.parseDouble(filterArgs.get(FIRST_IDX)) ;
    }


    @Override
    public boolean isPass(File file) {
        if (file.length() / BITE_FACTOR < sizeFactor)
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
