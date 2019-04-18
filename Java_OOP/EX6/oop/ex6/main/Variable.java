package oop.ex6.main;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

public class Variable {

    // A representation of variable in the scope

    final static String INT_STR = "int";
    final static String DOUBLE_STR = "double";
    final static String STRING_STR = "String";
    final static String BOOLEAN_STR = "boolean";
    final static String CHAR_STR = "char";

    public final static HashSet<String> RESERVED = new HashSet<>(Arrays.asList("void", "final", "if", "while",
            "true","false", "return", INT_STR, DOUBLE_STR, STRING_STR, BOOLEAN_STR, CHAR_STR));


    public enum Type{
        INT, DOUBLE, STRING, BOOLEAN, CHAR, UNDEFINED
    }

    private String name;
    private Type type;
    private boolean inited;
    private boolean isFinal;

    public Variable(String name, Type type, boolean inited, boolean isFinal){
        this.name = name;
        this.type = type;
        this.inited = inited;
        this.isFinal = isFinal;
    }

    /**
     * Returns the variables name
     */
    public String getName(){
        return name;
    }

    /**
     *
     * @return The variable type
     */
    public Type getType(){
        return type;
    }

    /**
     * @return whether the variable was inited
     */
    public boolean getInited(){
        return inited;
    }

    /**
     * @return whether the variable is final
     */
    public boolean getFinal(){
        return isFinal;
    }

    /**
     * @param typeName the string to check
     * @return the type number if legal, -1 otherwise.
     */
    public static Type getType(String typeName) {
        Type toReturn;
        switch (typeName) {
            case (INT_STR):
                toReturn = Type.INT;
                break;
            case (DOUBLE_STR):
                toReturn = Type.DOUBLE;
                break;
            case (STRING_STR):
                toReturn = Type.STRING;
                break;
            case (BOOLEAN_STR): {
                toReturn = Type.BOOLEAN;
                break;
            }
            case (CHAR_STR): {
                toReturn = Type.CHAR;
                break;
            }
            default:
                toReturn = Type.UNDEFINED;
        }
        return toReturn;
    }

    /**
     * Analyzed the value to understand what type of variable it is
     * @param var The String to analyze
     * @return The found type, Type.UNDEFINED if failed to find.
     */
    public static Type getTypeFromValue(String var){
        String regexDub = "^[-]{0,1}[0-9]+[.][0-9]+";
        String regexInt = "^[-]{0,1}[0-9]+";
        if (var.charAt(0) == '\"' && var.charAt(var.length()-1) == '\"') {
            return Type.STRING;
        }
        if (var.charAt(0) == '\'' && var.charAt(var.length()-1) == '\'') {
            return Type.CHAR;
        }
        if (var.equals("true") || var.equals("false")){
            return Type.BOOLEAN;
        }
        if (var.matches(regexDub)){
            return Type.DOUBLE;
        }
        if (var.matches(regexInt)){
            return Type.INT;
        }
        return Type.UNDEFINED;
    }

    /**
     * @param typeInto The type we are trying to fit into
     * @param typeFrom The type we are checking if good
     * @return True if typeFrom can fit into typeInto
     */
    public static boolean isTypeApplicable(Type typeInto, Type typeFrom) {
        switch (typeInto) {
            case DOUBLE:
                if (!(typeFrom == Type.DOUBLE || typeFrom == Type.INT)) {
                    return false;
                }
                break;
            case BOOLEAN:
                if (!(typeFrom == Type.DOUBLE || typeFrom == Type.INT || typeFrom == Type.BOOLEAN)) {
                    return false;
                }
                break;
            default:
                return (typeFrom == typeInto);
        }
        return true;
    }

    /**
     * @return True if the given name is legal, otherwise false
     */
    public static boolean isLegalName(String name, Scope scope) {

        if (scope.nameInCurrentScope(name)){
            return false;
        }

        if (Variable.RESERVED.contains(name)){
            return false;
        }

        // This regex check if the name is correct (while the first letter isn't underscore)
        final String validNameRegex ="^[a-zA-Z][a-zA-z0-9_]*";
        // this regex check if the name is correct (while the first letter is underscore)
        final String startWithUnderScoreValidRegex = "^[_][a-zA-Z0-9_]+";
        if(name.equals("")){
            return false;
        }
        // first two matches checks that the name is ok
        if(name.matches(validNameRegex) || name.matches(startWithUnderScoreValidRegex)){
            return true;
        }
        return false;
    }
}