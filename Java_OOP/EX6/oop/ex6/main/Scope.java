package oop.ex6.main;

import java.util.HashSet;

public class Scope {
    private Scope parent;
    private HashSet<Variable> vars;

    /**
     * A class that represents a scope, which for our porpoise is a HashSet with a reference
     * to the parent scope and a set of variables
     */

    /**
     * A scope constructor
     * @param newParent The parent of the current scope (Notice that since it is not global it will always
     *        have
     *                  a parent).
     */
    public Scope(Scope newParent){
        parent = newParent;
        vars = new HashSet<>();
    }

    /**
     * @return the global scope that at the end of the list
     */
    public Global getGlobal(){
        return parent.getGlobal();
    }

    /**
     * @return This scope's parent
     */
    public Scope getParent(){
        return parent;
    }


    /**
     * Adds a variable to the current scope
     * @param var The variable to add
     * @return True if added succesfully, otherwise false
     */
    public boolean addVar(Variable var){
        if (!nameInCurrentScope(var.getName())){
            return vars.add(var);
        }
        else return false;
    }

    /**
     * @param varName The name to check
     * @return Checks whether the variable is in this scope or any
     * of it's parents.
     */
    public boolean isNameInScope(String varName){
        if (nameInCurrentScope(varName)){
            return true;
        }
        if (parent != null){
            return parent.isNameInScope(varName);
        } else {
            return false;
        }
    }

    /**
     * Retrieves a variable by name
     * @param name The name to retrieve by
     * @return null if not found
     */
    public Variable getVarByName(String name){
        for (Variable var: vars){
            if (var.getName().equals(name)){
                return var;
            }
        }
        if (parent != null)
            return parent.getVarByName(name);
        return null;
    }

    /**
     * Checks whether the given name is a variable in this scope (does not check the parents)
     */
    public boolean nameInCurrentScope(String varName){
        for (Variable var: vars){
            if (var.getName().equals(varName)){
                return true;
            }
        }
        return false;
    }

    /**
     * Whether this is the global. Since this is overridden by global, this
     * version of it always returns false
     */
    public boolean isGlobal(){
        return false;
    }
}
