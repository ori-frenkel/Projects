package filesprocessing.filters;
import java.io.File;
import java.util.ArrayList;

/**
 * the class represent executable filter
 */
public class ExecutableFilter extends Filter {

    // does the file have executable permission
    private String executableParameter;

    /**
     * us the super method
     * add the first argument as executableParameter
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    ExecutableFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        executableParameter = filterArgs.get(FIRST_IDX) ;
    }


    @Override
    public boolean isPass(File file) {
        if (file.canExecute() == executableParameter.equals(YES))
            return true;
        return false;

    }

    @Override
    public boolean errorCheck() {
        if(executableParameter.equals(YES) || executableParameter.equals(NO))
            return false;
        return true;
    }
}
