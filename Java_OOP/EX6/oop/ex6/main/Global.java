package oop.ex6.main;

import java.util.HashMap;
import java.util.HashSet;

public class Global extends Scope {

    private HashMap<String, Function> functions;

    /**
     * The default constructor
     */
    public Global(){
        super(null);
        functions = new HashMap<>();
    }
    public Global getGlobal(){
        return this;
    }

    /**
     * Add a new function to the global scope.
     * @param functionName the new function's name.
     * @return true if added successfully, otherwise false.
     */
    public boolean addFunction(String functionName, Function func)
    {
        if (!Function.isLegalFunctionName(functionName)){
            return false;
        }
        if (functions.containsKey(functionName)) {
            return false;
        } else{
            functions.put(functionName, func);
            return true;
        }
    }


    /**
     * @param name Name of the method we check
     * @param vars A Type array we check
     * @return Whether a function with the given name exists and can accept the Types given.
     */
    public boolean isMethodCallLegal(String name, Variable.Type[] vars){
        Function func = functions.get(name);
        if (func == null){
            return false;
        }
        return func.isLegalInput(vars);
    }

    /**
     * A function that is inherited from scope, checks if it's global (here it is).
     */
    public boolean isGlobal(){
        return true;
    }
}
