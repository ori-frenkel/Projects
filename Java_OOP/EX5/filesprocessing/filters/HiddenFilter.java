package filesprocessing.filters;
import java.io.File;
import java.util.ArrayList;

/**
 * the class represent hidden filter
 */
public class HiddenFilter extends Filter {

    // the question we ask if the file need to be hidden
    private String hiddenParameter;

    /**
     * us the super method
     * add the first argument as hiddenParameter
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    HiddenFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        hiddenParameter = filterArgs.get(FIRST_IDX);
    }

    @Override
    public boolean isPass(File file) {
        if (file.isHidden() == hiddenParameter.equals(YES))
            return true;
        return false;

    }


    @Override
    public boolean errorCheck() {
        if(hiddenParameter.equals(YES) || hiddenParameter.equals(NO))
            return false;
        return true;
    }
}
