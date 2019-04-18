package oop.ex6.main;

/**
 * A class that represents a function. The name is saved elsewhere (as the key in an hashmap), so here only
 * a Type array, and functions to help.
 */

public class Function {
    Variable.Type[] varType;

    public Function(Variable.Type[] types) {
        varType = types;
    }

    /**
     * @param input An arrays of Type to check
     * @return true if the given types satisfy the function.
     */
    public boolean isLegalInput(Variable.Type[] input) {
        if (input.length != varType.length)
            return false;

        for (int i = 0; i < input.length; i++) {
            if (!Variable.isTypeApplicable(varType[i], input[i])) {
                return false;
            }
        }
        return true;
    }

    /**
     * Checks whether a function name is legal
     * @param name the name to check.
     */
    public static boolean isLegalFunctionName(String name) {
        // This regex check if the name is correct (while the first letter isn't underscore)
        final String validNameRegex = "^[a-zA-Z][a-zA-z0-9_]*";
        // this regex check if the name is correct (while the first letter is underscore)
        return (name.matches(validNameRegex));
    }
}