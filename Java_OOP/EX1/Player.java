/* Author: Ori Frenkel                                                */
/* Class Name : Player.java                                           */
/* Id: 314643164                                                      */
/* Description: The Player class represents a player in the Nim game  */

import java.util.Random;
import java.util.Scanner;

//  supplied.Board;
// import supplied.Move;

/**
 * The Player class represents a player in the Nim game, producing Moves as a response to a Board state. Each player 
 * is initialized with a type, either human or one of several computer strategies, which defines the move he 
 * produces when given a board in some state. The heuristic strategy of the player is already implemented. You are 
 * required to implement the rest of the player types according to the exercise description.
 * @author OOP course staff
 */
public class Player {

	//Constants that represent the different players.
	/** The constant integer representing the Random player type. */
	public static final int RANDOM = 1;
	/** The constant integer representing the Heuristic player type. */
	public static final int HEURISTIC = 2;
	/** The constant integer representing the Smart player type. */
	public static final int SMART = 3;
	/** The constant integer representing the Human player type. */
	public static final int HUMAN = 4;
	
	private static final int BINARY_LENGTH = 4;	//Used by produceHeuristicMove() for binary representation of
	// board rows.
	
	private final int playerType;
	private final int playerId;
	private Scanner scanner;
	
	/**
	 * Initializes a new player of the given type and the given id, and an initialized scanner.
	 * @param type The type of the player to create.
	 * @param id The id of the player (either 1 or 2).
	 * @param inputScanner The Scanner object through which to get user input
	 * for the Human player type. 
	 */
	public Player(int type, int id, Scanner inputScanner){		
		// Check for legal player type (we will see better ways to do this in the future).
		if (type != RANDOM && type != HEURISTIC 
				&& type != SMART && type != HUMAN){
			System.out.println("Received an unknown player type as a parameter"
					+ " in Player constructor. Terminating.");
			System.exit(-1);
		}		
		playerType = type;	
		playerId = id;
		scanner = inputScanner;
	}
	
	/**
	 * @return an integer matching the player type.
	 */	
	public int getPlayerType(){
		return playerType;
	}
	
	/**
	 * @return the players id number.
	 */	
	public int getPlayerId(){
		return playerId;
	}
	
	
	/**
	 * @return a String matching the player type.
	 */
	public String getTypeName(){
		switch(playerType){
			
			case RANDOM:
				return "Random";			    
	
			case SMART: 
				return "Smart";	
				
			case HEURISTIC:
				return "Heuristic";
				
			case HUMAN:			
				return "Human";
		}
		//Because we checked for legal player types in the
		//constructor, this line shouldn't be reachable.
		return "UnknownPlayerType";
	}
	
	/**
	 * This method encapsulates all the reasoning of the player about the game. The player is given the 
	 * board object, and is required to return his next move on the board. The choice of the move depends
	 * on the type of the player: a human player chooses his move manually; the random player should 
	 * return some random move; the Smart player can represent any reasonable strategy; the Heuristic 
	 * player uses a strong heuristic to choose a move. 
	 * @param board - a Board object representing the current state of the game.
	 * @return a Move object representing the move that the current player will play according to his strategy.
	 */
	public Move produceMove(Board board){
		
		switch(playerType){
		
			case RANDOM:
				return produceRandomMove(board);				
				    
			case SMART: 
				return produceSmartMove(board);
				
			case HEURISTIC:
				return produceHeuristicMove(board);
				
			case HUMAN:
				return produceHumanMove(board);

			//Because we checked for legal player types in the
			//constructor, this line shouldn't be reachable.
			default: 
				return null;			
		}
	}

	/*
	 *
	 * param row - the row that we want to check if has unmarked stick
	 * param board - the board that we want to check if has unmarked stick (in the previous row)
	 * return - true if the row has unmarked stick, else, return false
	 */
	private boolean isRowHasUnmarkedStick(int row, Board board){
		int rowLength = board.getRowLength(row);
		for(int i=1; i<rowLength+1; i++){
			if(board.isStickUnmarked(row, i)){
				return true;
			}
		}
		return false;
	}

	/*
	 * param board - the board that we want to find a row with unmarked stick
	 * return - a row with unmarked stick
	 */
	private int rowFinder(Board board) {
		Random myRandom = new Random();
		while(true) {
			int row = myRandom.nextInt(board.getNumberOfRows()) + 1; /* random.nextInt(max - min + 1) + min,
			random row with out 0 */
			if (this.isRowHasUnmarkedStick(row, board)) {
				return row;
			}
		}
	}

	/*
	 * Produces a random move.
	 */
	private Move produceRandomMove(Board board){
		int row = this.rowFinder(board); // find random row with unmarked stick.
		Random myRandom = new Random();
		int stick1,stick2;
		int[] unmarkedStickArray = new int[board.getRowLength(row)+1];
		final int MARKED_STICK = 0; /* MARKED_STICK has the same value as the default value of the initialized
		 array */
		final int UNMARKED_STICK = 1;
		for(int stickNum=1; stickNum<board.getRowLength(row)+1; stickNum++){ /* the location in the array
		 represent the stick in the row, if the value at that location is 1, then the stick in unmarked, else
		  the value at the location in 0 (the default initialized value) */
			if(board.isStickUnmarked(row,stickNum)){
				unmarkedStickArray[stickNum] = UNMARKED_STICK;
			}
		}
		while(true){
			int tempStick1 = myRandom.nextInt(board.getRowLength(row))+1;
			int tempStick2 = myRandom.nextInt(board.getRowLength(row))+1;
			// this if, check if the stick are legal, if not, jump to get another two random sticks
			if(unmarkedStickArray[tempStick1] == UNMARKED_STICK &&
					unmarkedStickArray[tempStick2] == UNMARKED_STICK){
				// do nothing
			}
			else{ continue;} // search for other sticks
			if(tempStick1 == tempStick2){ /* if the random sticks number are the same, so return a move that
			 contain only one sticks */
				return new Move(row,tempStick1,tempStick1);
			}
			if(tempStick1 < tempStick2){ /* this find the min number between the temp sticks and put the lower
				 number at stick1 and the higher number at stick2, I could use Math.min(), but wasn't sure
				 if it is allowed */
				 stick1 = tempStick1;
				 stick2 = tempStick2;
			}
			else{
				 stick1 = tempStick2;
				 stick2 = tempStick1;
			}
			for(int i=1; i<(stick2-stick1)+1; i++){
				int locationInArray = stick1 + i;
				if(unmarkedStickArray[locationInArray] == MARKED_STICK){ /* if there is no legal sequence
				 between stick1 and stick 2, then return a move that contain only one legal stick */
					return new Move(row,stick1,stick1);
				}
			}
			/* if there is a legal sequence then return a move that contain that sequence */
			return new Move(row,stick1,stick2);
		}
	}

	/**
	 *
	 * @param board - The board that we want to find unmarked stick in.
	 * @return - Move the contain unmarked stick in the board.
	 */
	private Move possibleMoveWith1Sticks(Board board){
		for(int row=1; row<board.getNumberOfRows()+1; row++){
			if(!this.isRowHasUnmarkedStick(row,board)){ /* for efficiency, if the row empty, move to the next
			 row. */
				continue;
			}
			for(int stickNum=1; stickNum<board.getRowLength(row)+1; stickNum++){
				if(board.isStickUnmarked(row,stickNum)){
					return new Move(row,stickNum,stickNum);
				}
			}
		}
		return null; // default return, this line shouldn't be reachable.
	}

	/**
	 * @param board - The board that we want to find legal move of 2 sticks
	 * @return - A move the contain sequence of 2 sticks if possible, else, move that contain 1 stick.
	 */
	private Move possibleMoveWith2Sticks(Board board){
		for(int row=1; row<board.getNumberOfRows()+1; row++){
			for(int stickNum=1; stickNum<board.getRowLength(row); stickNum++){
				if(board.isStickUnmarked(row,stickNum) && board.isStickUnmarked(row,(stickNum+1))){
					return new Move(row,stickNum,(stickNum+1));
				}
			}
		}
		return this.possibleMoveWith1Sticks(board); /* if there is no possible move that contains 2 sticks
		 then return the only possible move with 1 stick */
	}

	
	/*
	 * Produce some intelligent strategy to produce a move
	 */
	private Move produceSmartMove(Board board){
		int unmarkedSticks = board.getNumberOfUnmarkedSticks();
		if(unmarkedSticks%2 == 0){
			return this.possibleMoveWith1Sticks(board); // do a move with 1 stick (uneven number of stick)
		}
		else{ // mark 2 sticks if possible (even number of sticks)
			return this.possibleMoveWith2Sticks(board);
		}
	}
	
	/*
	 * Interact with the user to produce his move.
	 */
	private Move produceHumanMove(Board board){
		final int PRINT_BOARD = 1, ENTER_A_MOVE = 2;
		while(true) // keep asking the user the question below till he make a move.
		{
			System.out.println("Press 1 to display the board. Press 2 to make a move:");
			int userInput = scanner.nextInt();
			if(userInput == PRINT_BOARD){
				System.out.println(board.toString());
			}
			else if(userInput == ENTER_A_MOVE){
				System.out.println("Enter the row number:");
				int inRow = scanner.nextInt();
				System.out.println("Enter the index of the leftmost stick:");
				int leftMost = scanner.nextInt();
				System.out.println("Enter the index of the rightmost stick:");
				int rightMost = scanner.nextInt();
				return new Move(inRow,leftMost,rightMost);
			}
			else{
				System.out.println("Unsupported command");
			}
		}
	}
	
	/*
	 * Uses a winning heuristic for the Nim game to produce a move.
	 */
	private Move produceHeuristicMove(Board board){

		int numRows = board.getNumberOfRows();
		int[][] bins = new int[numRows][BINARY_LENGTH];
		int[] binarySum = new int[BINARY_LENGTH];
		int bitIndex,higherThenOne=0,totalOnes=0,lastRow=0,lastLeft=0,lastSize=0,lastOneRow=0,lastOneLeft=0;
		
		for(bitIndex = 0;bitIndex<BINARY_LENGTH;bitIndex++){
			binarySum[bitIndex] = 0;
		}
		
		for(int k=0;k<numRows;k++){
			
			int curRowLength = board.getRowLength(k+1);
			int i = 0;
			int numOnes = 0;
			
			for(bitIndex = 0;bitIndex<BINARY_LENGTH;bitIndex++){
				bins[k][bitIndex] = 0;
			}
			
			do {
				if(i<curRowLength && board.isStickUnmarked(k+1,i+1) ){
					numOnes++;
				} else {
					
					if(numOnes>0){
						
						String curNum = Integer.toBinaryString(numOnes);
						while(curNum.length()<BINARY_LENGTH){
							curNum = "0" + curNum;
						}
						for(bitIndex = 0;bitIndex<BINARY_LENGTH;bitIndex++){
							bins[k][bitIndex] += curNum.charAt(bitIndex)-'0'; //Convert from char to int
						}
						
						if(numOnes>1){
							higherThenOne++;
							lastRow = k +1;
							lastLeft = i - numOnes + 1;
							lastSize = numOnes;
						} else {
							totalOnes++;
						}
						lastOneRow = k+1;
						lastOneLeft = i;
						
						numOnes = 0;
					}
				}
				i++;
			}while(i<=curRowLength);
			
			for(bitIndex = 0;bitIndex<BINARY_LENGTH;bitIndex++){
				binarySum[bitIndex] = (binarySum[bitIndex]+bins[k][bitIndex])%2;
			}
		}
		
		
		//We only have single sticks
		if(higherThenOne==0){
			return new Move(lastOneRow,lastOneLeft,lastOneLeft);
		}
		
		//We are at a finishing state				
		if(higherThenOne<=1){
			
			if(totalOnes == 0){
				return new Move(lastRow,lastLeft,lastLeft+(lastSize-1) - 1);
			} else {
				return new Move(lastRow,lastLeft,lastLeft+(lastSize-1)-(1-totalOnes%2));
			}
			
		}
		
		for(bitIndex = 0;bitIndex<BINARY_LENGTH-1;bitIndex++){
			
			if(binarySum[bitIndex]>0){
				
				int finalSum = 0,eraseRow = 0,eraseSize = 0,numRemove = 0;
				for(int k=0;k<numRows;k++){
					
					if(bins[k][bitIndex]>0){
						eraseRow = k+1;
						eraseSize = (int)Math.pow(2,BINARY_LENGTH-bitIndex-1);
						
						for(int b2 = bitIndex+1;b2<BINARY_LENGTH;b2++){
							
							if(binarySum[b2]>0){
								
								if(bins[k][b2]==0){
									finalSum = finalSum + (int)Math.pow(2,BINARY_LENGTH-b2-1);
								} else {
									finalSum = finalSum - (int)Math.pow(2,BINARY_LENGTH-b2-1);
								}
								
							}
							
						}
						break;
					}
				}
				
				numRemove = eraseSize - finalSum;
				
				//Now we find that part and remove from it the required piece
				int numOnes=0,i=0;
				while(numOnes<eraseSize){

					if(board.isStickUnmarked(eraseRow,i+1)){
						numOnes++;
					} else {
						numOnes=0;
					}
					i++;
					
				}
				return new Move(eraseRow,i-numOnes+1,i-numOnes+numRemove);
			}
		}
		
		//If we reached here, and the board is not symmetric, then we only need to erase a single stick
		if(binarySum[BINARY_LENGTH-1]>0){
			return new Move(lastOneRow,lastOneLeft,lastOneLeft);
		}
		
		//If we reached here, it means that the board is already symmetric, and then we simply mark one stick from the last sequence we saw:
		return new Move(lastRow,lastLeft,lastLeft);		
	}
	
	
}

