package oop.ex6.main;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A class to represents a line of code
 */

public class Line {
    private LineParser parser;
    private String line;
    private Scope scope;
    private boolean isReturn;
    private boolean isEmpty;

    static final String IF = "if";
    static final String WHILE = "while";
    static final String FINAL = "final";
    static final String VOID = "void";
    static final String RETURN = "return";
    static final String TEMP_STRING = "TEMP_STRING";


    /**
     * Constructor
     * @param oldLine The string to analyze the line from
     * @param scope The scope the line exists in
     */
    public Line(String oldLine, Scope scope) {
        isReturn = false;
        isEmpty = false;
        parser = new LineParser(scope);
        this.scope = scope;

        // Removing comments
        oldLine = removeComments(oldLine);

        String[] specialChars = {"=", ";", ",", "\\(", "\\)"};
        // In the future:
        // String[] specialChars = {"=", ";", "(", ")"};
        for (String str:specialChars){
            oldLine = oldLine.replaceAll(str, " "+str+" ");
        }
        line = oldLine;

    }

    /**
     * Checks whether the line is legal.
     */
    public boolean isLegal(){
        String[] parts = getPartsArray();
        if (parts.length == 0) {
            isEmpty = true;
            return true;
        }

        //If the line is "}" it's legal (We check for scopes in another place)
        if (parts.length == 1 && parts[0].equals("}"))
            return true;

        // Whether we are in global:
        boolean isInGlobal;
        if (parts[parts.length-1].equals("{")){
            // We already opened a new scope, so we need to check the parent
            Scope parent = scope.getParent();
            isInGlobal = parent.isGlobal();
        } else {
            isInGlobal = scope.isGlobal();
        }

        // Whether the lines finished with ";"
        boolean endsWithSemi = parts[parts.length-1].equals(";");


        if (isInGlobal){
            // Things that are allowed only in Global:

            if (parts[0].equals(VOID)){
                return parser.parseDeclareFunction(parts, scope);
            }
        } else {
            // Things that are allowed only outside of global:

            if (parts[0].equals(IF) || parts[0].equals(WHILE)){
                return parser.parseIfOrWhile(parts, scope);
            }
            if (parts[0].equals(RETURN)){
                isReturn = true;
                return (parts.length == 2);
            }
            if (parts.length > 1 && parts[1].equals("("))
                return parser.parseMethodCall(parts, scope);
        }

        // Things that are allowed everywhere:
        // all of them needs to end with semicolon:
        if (endsWithSemi) {


            // Init Variable
            Variable.Type type = Variable.getType(parts[0]);
            if (type != Variable.Type.UNDEFINED) {
                // Calling the non-final version:
                return parser.parseVarInit(type, parts, false);
            }
            // Init final variable
            if (parts[0].equals(FINAL)) {
                type = Variable.getType(parts[1]);
                if (type != Variable.Type.UNDEFINED) {
                    // Calling the final version:
                    return parser.parseVarInit(type, parts, true);
                }
            }

            // Change existing variable
            if (scope.isNameInScope(parts[0])) {
                return parser.parseVarAssign(parts, scope);
            }
        }
        return false;
    }

    /**
     * Removes all the comments from a string
     * @param oldLine The string to remove from
     * @return A new string without comments
     */
    private static String removeComments(String oldLine){
        String[] newParts  = oldLine.split("//");
        return newParts[0];
    }

    /**
     * Turns the "line" member variable into an array of small strings
     * in order to ignore spaces
     * @return A splitted array
     */
    private String[] getPartsArray(){
        // If the line is completely empty
        if (line.isEmpty()){
            return new String[0];
        }

        String saved = "";
        boolean found = false;

        // Save all strings:
        String pattern = "(\"[^\"]*\")";
        Pattern pat = Pattern.compile(pattern);
        Matcher m = pat.matcher(line);
        if (m.find()) {
            saved = m.group(1);
            line = line.replace(saved, TEMP_STRING);
            found = true;
        }

                // Turn all tabs into spaces
        line = line.replace("\t", " ");
        if (line.startsWith(" "))
            line = line.substring(1);
        String[] parts = line.split("\\s+");
        // Our array must be tight, so we remove any spaces:
        ArrayList<String> words = new ArrayList<>();
        for (String s:parts){
            if (!s.isEmpty()){
                words.add(s);
            }
        }

        if (words.size() == 0)
            return new String[0];
        parts = new String[words.size()];
        words.toArray(parts);
        // Now we return the saved string:
        if (found == true) {
            for (int i = 0; i < parts.length; i++) {
                if (parts[i].equals(TEMP_STRING)) {
                    parts[i] = saved;
                }
            }
        }
        return parts;
    }

    /**
     * @return Whether the line is "return"
     */
    public boolean isReturn(){
        return isReturn;
    }

    /**
     * @return whether the line is empty
     */
    public boolean isEmpty(){
        return isReturn;
    }



}
