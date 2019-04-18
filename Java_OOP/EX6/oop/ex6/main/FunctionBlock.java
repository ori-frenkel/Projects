package oop.ex6.main;


import java.util.ArrayList;

/**
 * A group of lines, all sharing the same scope.
 * This is basically an ArrayList, we just extend it using facade to
 * simplify usability and extend readability.
 */

public class FunctionBlock {
    private ArrayList<Line> lines;

    public FunctionBlock(){
        lines = new ArrayList<>();
    }

    /**
     * Adds a line to the FunctionBlock
     * @param line
     */
    public void addLine(Line line){
        lines.add(line);
    }

    /**
     * Checks Whether the code in the block is legal
     * @return true if all the code is legal, false otherwise
     */
    public boolean checkBlock(){
        for (Line line: lines){
            if (!line.isLegal()){
                return false;
            }
        }
        for (int i = lines.size() - 1; i >= 0; i--){
            if (lines.get(i).isReturn()){
                return true;
            } else if (!lines.get(i).isEmpty()){
                return false;
            }
        }
        return false;
    }
}
