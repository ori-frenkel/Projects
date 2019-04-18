package filesprocessing.filters;
import java.io.File ;
import java.util.ArrayList;

/**
 * the class represent file filter
 */
public class FileFilter extends Filter {

    // the name of the file we wish to check
    private String fileName;

    /**
     * us the super method
     * add the first argument as fileName
     * @param filterArgs - array that hold the name and more arguments for the filter
     */
    FileFilter(ArrayList<String> filterArgs){
        super(filterArgs);
        fileName = filterArgs.get(FIRST_IDX);
    }



    @Override
    public boolean isPass(File file) {
        if (file.getName().equals(fileName))
            return true;
        return false;

    }

    @Override
    public boolean errorCheck() {
        return false;
    }
}
