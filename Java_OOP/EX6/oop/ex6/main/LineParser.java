package oop.ex6.main;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Stack;

public class LineParser {

	private final String AND = "&&";
	private final String OR = "||";

    private Scope scope;
    public LineParser(Scope newScope){
        scope = newScope;
    }

    /**
     * checks whether the line is valid mathod call (i.e "legalFunction();");
     * @param parts The substrings of the checked line
     * @return true if legal, false otherwise.
     */
    public boolean parseMethodCall(String[] parts, Scope scope) {
        int[] types;
        // Edge case: when begining with " "
		if (parts[0].equals("")){
			parts = Arrays.copyOfRange(parts, 1, parts.length);
		}
        String funcName = parts[0];
        if (!(parts[1].equals("("))){
        	return false;
		}
		ArrayList<Variable.Type> vars = new ArrayList<>();
        for (int i = 2; i < parts.length-2; i+=2){
			Variable.Type result = Variable.getTypeFromValue(parts[i]);
        	if (result == Variable.Type.UNDEFINED){
				// The name was not legal value, but it might be legal name
        		Variable var = scope.getVarByName(parts[i]);

				if (var != null) {
					// We found matching variable, make sure it was inited:
					if (var.getInited()) {
						vars.add(var.getType());
					} else return false;
				} else return false;
			} else {
				vars.add(result);
			}
        	if (!(parts[i+1].equals(",") || parts[i+1].equals(")"))){
        		return false;
			}
		}
		Variable.Type[] varArr = new Variable.Type[vars.size()];
		vars.toArray(varArr);

        return scope.getGlobal().isMethodCallLegal(funcName, varArr);
    }


	/**
	 * Parses a variables initializig (i.e. "int a = 5" etc);
	 * @param type The type of the variable
	 * @param parts The splitted string
	 * @param isFinal Whether the varible is final
	 * @return true if the line was legal, false otherwise
	 */
    public boolean parseVarInit(Variable.Type type, String[] parts, boolean isFinal){
    	// Let's rearrange the data to 1/3 sized blocks:
		ArrayList<ArrayList<String>> stack = new ArrayList<ArrayList<String>>();
    	stack.add(new ArrayList<String>());

    	int startPoint = isFinal ? 2 : 1;

    	for (int i = startPoint; i < parts.length-1; i++){
    		if (parts[i].equals(",")){
    			stack.add(new ArrayList<String>());
			} else {
    			stack.get(stack.size()-1).add(parts[i]);
			}
		}

		ArrayList<String> list = stack.remove(0);
		while (list != null){
			// Now we deal with each such block
			if (list.size() == 3 || list.size() == 1){
				if (!analyzeBlock(list, type, isFinal)){
					return false;
				}
			} else {return false;}
			list = stack.isEmpty() ? null : stack.remove(0);
		}
		return true;
    }



    /**
     * Analyzes variable assignment such as 'a = 5'
     * @param parts The substrings of the checked line
     * @param scope The scope we are in
     * @return Whether the assign is true
     */
    public boolean parseVarAssign(String[] parts, Scope scope){
    	if (parts.length != 4){
    		return false;
		}
		Variable var = scope.getVarByName(parts[0]);
		if (var != null){
			Variable.Type type  = Variable.getTypeFromValue(parts[2]);
			if (Variable.isTypeApplicable(var.getType(), type) && !var.getFinal()){
				return true;
			}
			return false;
		} else return false;
    }

    /**
     * Parses a "if" or "while" line
     * @param parts The splitted string
     * @param scope The scope the line is in
     * @return True if legal line, false otherwise
     */
    public boolean parseIfOrWhile(String[] parts, Scope scope){
		if (!parts[parts.length - 1].equals("{"))
			return false;
		if (!parts[1].equals("(") || !parts[parts.length-2].equals(")")){
			return false;
		}
		return isLegalBooleanValue(parts);
    }

	/**
	 * Parses a function declare
	 * @param parts The splitted string
	 * @param scope The scope the line is in
	 * @return True if legal line, false otherwise
	 */
	public boolean parseDeclareFunction (String[] parts, Scope scope) {
    	String methodName = parts[1];
    	boolean isFinal;

		ArrayList<Variable.Type> arr = new ArrayList<>();
    	if (!parts[2].equals("(") || !parts[parts.length-2].equals(")")){
    		return false;
		}
		int count = 2;
    	// If we have no variables we don't need to loop
		if (!parts[3].equals(")")) {
			do {
				count++;
				// if the first line is final
				if (parts[count].equals(Line.FINAL)){
					isFinal = true;
					count++;
				} else { isFinal = false;}
				Variable.Type type = Variable.getType(parts[count]);
				if (type == Variable.Type.UNDEFINED) {
					return false;
				}
				count++;
				if (!Variable.isLegalName(parts[count], scope)) {
					return false;
				}
				arr.add(type);
				scope.addVar(new Variable(parts[count], type, true, isFinal));
				count++;
			} while (parts[count].equals(","));
			// If wring number of elements
			if (!parts[count].equals(")") || !parts[count+1].equals("{")){
				return false;
			}
		}


		Variable.Type[] varType = new Variable.Type[arr.size()];
		arr.toArray(varType);
		return scope.getGlobal().addFunction(methodName,new Function(varType));
	}


	/**
	 * Analyzes a list of String that represents a variable init "a=5", "v" etc.
	 * @param list The list of Strings
	 * @param type The type of the String
	 * @param isFinal Whether it is final
	 * @return True if legal
	 */
	private boolean analyzeBlock(ArrayList<String> list, Variable.Type type, boolean isFinal){

		if (scope.nameInCurrentScope(list.get(0)) || !Variable.isLegalName(list.get(0), scope)){
			return false;
		}
		//
		if (list.size() == 1){
			if (isFinal)
				// This line (i.e. "final int a;") is illegal, final must be inited
				return false;

			scope.addVar(new Variable(list.get(0), type, false,isFinal));
		} else{
			// We know the size is 3
			if (!list.get(1).equals("=")){
				return false;
			}
			if (Variable.isTypeApplicable(type, Variable.getTypeFromValue(list.get(2)))){
				return scope.addVar(new Variable(list.get(0), type, true, isFinal));
			} else {
				Variable var = scope.getVarByName(list.get(2));
				if (var != null){
					if (Variable.isTypeApplicable(type, var.getType()) && var.getInited()){
						return scope.addVar(new Variable(list.get(0), type, true, isFinal));
					} else return false;
				} else return false;
			}
		}
		return true;

	}

	/**
	 * @return True if it is legal boolean value (inc. || and &&)
	 */
	private boolean isLegalBooleanValue(String[] parts){
		// First we find the values:
		Stack<String> values = new Stack<>();
		values.push(parts[2]);
		int i = 3;
		while (i < parts.length - 2) {
			// makes sure the line doesn't end in "&&" or "||"
			if (!parts[i].equals(OR) && !parts[i].equals(AND)) {
				return false;
			}
			i++;
			values.push(parts[i]);
			i++;
		}

		for (String val: values){
			if (!isValueLegalBool(val)){
				return false;
			}
		}
		return true;
	}

	/**
	 * @return true if the value given is legal as a boolean, false otherwise
	 */
	private boolean isValueLegalBool(String val){
		// Check if it is DOUBLE/INT/BOOL:
		if (Variable.isTypeApplicable(Variable.Type.BOOLEAN, Variable.getTypeFromValue(val))){
			return true;
		}
		// Check of existing variable:
		Variable var = scope.getVarByName(val);
		if (var != null && var.getInited() && Variable.isTypeApplicable(Variable.Type.BOOLEAN, var.getType())
				){
			return true;
		}
		return false;
	}


}
