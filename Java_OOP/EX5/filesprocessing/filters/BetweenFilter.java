package filesprocessing.filters;
import java.util.ArrayList;
import java.io.File;

/**
 * the class represent between filter
 */
public class BetweenFilter extends Filter {

    //the minimal size of a file
    private double sizeFrom;
    //the maximal size of a file
    private double sizeTo;

    /**
     * us the super method
     * add the first argument as sizeFrom
     * add the second argument as sizeTo
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    BetweenFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        sizeFrom = Double.parseDouble(filterArgs.get(FIRST_IDX));
        sizeTo = Double.parseDouble(filterArgs.get(SECOND_IDX));
    }


    @Override
    public boolean isPass(File file) {
        if (file.length() / BITE_FACTOR >= sizeFrom && file.length() / BITE_FACTOR <= sizeTo)
            return true;
        return false;
    }


    @Override
    public boolean errorCheck (){
        if (sizeFrom < SIZE_ERODE_PARAM || sizeTo < SIZE_ERODE_PARAM || sizeFrom > sizeTo)
            return true;
        return false;
    }
}

