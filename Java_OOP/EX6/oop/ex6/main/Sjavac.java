package oop.ex6.main;

import java.io.*;
import java.util.Stack;

public class Sjavac {

    /**
     * Our main function
     */
    public static void main(String[] args) {
        try {
            if (loadCode(args[0])) {
                System.out.println("0");
            } else {
                System.out.println("1");

            }
        }catch (JavacIOException ex){
            System.out.println(2);
            System.err.println(ex.getMessage());
        }
    }

    /**
     * Loads the code from the file
     * @param path the file's path
     * @return True if the code was loaded and legal
     */
    private static boolean loadCode(String path) throws JavacIOException{
        boolean toReturn = false;
        try {
            FileReader fileReader = new FileReader(path);
            BufferedReader reader = new BufferedReader(fileReader);
            toReturn = analyzeCode(reader);
            reader.close();
        } catch (IOException ex){
            throw new JavacIOException("Error while handling file.");
        }
        return toReturn;
    }

    /**
     * Analyzes the code
     * @param reader Buffered Reader that is targeted on the file
     * @return true if the code is legal, false otherwise
     */
    private static boolean analyzeCode(BufferedReader reader){

        Global global = new Global();
        Stack<Scope> scopes = new Stack<Scope>();
        scopes.push(global);
        Stack<FunctionBlock> functionBlocks = new Stack<>();
        int depth = 0;
        boolean addDpeth = false;
        Scope lastScope = scopes.peek();

        String currentString;
        try {
            while ((currentString = reader.readLine()) != null) {

                // Create the Line
                // If a new Scope is needed
                if (currentString.contains("{")) {
                    Scope currentScope = scopes.peek();
                    scopes.push(new Scope(currentScope));
                    // We want to add to depth, but if it is a function
                    // we still want to analyze it here so we'll do it later
                    addDpeth = true;
                }
                // If the scope is finished
                if (currentString.contains("}")) {
                    scopes.pop();
                    depth--;
                    if (depth < 0) return false;
                }

                Line currentLine = new Line(currentString, scopes.peek());

                // if in global, check the line now:
                if (depth == 0) {
                    if (!currentLine.isLegal()) {
                        return false;
                    }
                } else{
                    functionBlocks.peek().addLine(currentLine);
                }
                if (addDpeth){
                    depth++;
                    if (depth == 1){
                        functionBlocks.push(new FunctionBlock());
                    }
                    addDpeth = false;
                }

            }
        } catch (IOException ex){}
        if (depth != 0)
            return false;
        // After finishing with the global lines, we start the non-global lines:
        for (FunctionBlock functionBlock : functionBlocks){
            if (!functionBlock.checkBlock()){
                return false;
            }
        }


        return true;
    }

}
