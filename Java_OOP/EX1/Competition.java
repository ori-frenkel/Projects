/* Author: Ori Frenkel                                                                  */
/* Class Name : Competition.java                                                        */
/* Id: 314643164                                                                        */
/* Description: The Competition class represents a Nim competition between two players  */

import java.util.Scanner;

/**
 * The Competition class represents a Nim competition between two players, consisting of a given number of rounds. 
 * It also keeps track of the number of victories of each player.
 */
public class Competition {
        private Player player1, player2;
        private boolean displayMessage;
        private  int player1Wins ;
        private  int player2Wins;
    /**
     *
     * @param player1 - The Player objects representing the first player.
     * @param player2 - The Player objects representing the second player.
     * @param displayMessage - a flag indicating whether game play messages should be printed to the console.
     */
	public Competition(Player player1, Player player2, boolean displayMessage){
	    this.player1 = player1;
	    this.player2 = player2;
	    this.displayMessage = displayMessage;
	    this.player1Wins = 0;
	    this.player2Wins = 0;
	}

    /**
     * @return - The number of times that player 1 won the game.
     */
    private int getPlayer1Wins(){
	    return this.player1Wins;
    }

    /**
     * @return - The number of times that player 2 won the game.
     */
    private int getPlayer2Wins(){
        return this.player2Wins;
    }

    /**
     *
     * @param playerPosition - The player which we want to know about
     * @return - the number of victories of a player.
     */
    public int getPlayerScore(int playerPosition){
        final int NON_VALID_PLAYER_POSITION = -1;
        final int PLAYER1 = 1;
        final int PLAYER2 = 2;
        if (playerPosition == PLAYER1){
            return this.getPlayer1Wins();
        }
        else if(playerPosition == PLAYER2){
            return this.getPlayer2Wins();
        }
        else{
            return NON_VALID_PLAYER_POSITION;
        }
    }
	/*
	 * Returns the integer representing the type of player 1; returns -1 on bad
	 * input.
	 */
	private static int parsePlayer1Type(String[] args){
		try{
			return Integer.parseInt(args[0]);
		} catch (Exception E){
			return -1;
		}
	}
	
	/*
	 * Returns the integer representing the type of player 2; returns -1 on bad
	 * input.
	 */
	private static int parsePlayer2Type(String[] args){
		try{
			return Integer.parseInt(args[1]);
		} catch (Exception E){
			return -1;
		}
	}
	
	/*
	 * Returns the integer representing the type of player 2; returns -1 on bad
	 * input.
	 */
	private static int parseNumberOfGames(String[] args){
		try{
			return Integer.parseInt(args[2]);
		} catch (Exception E){
			return -1;
		}
	}

    /*
     *
     * param currentPlayer - represent the current player turn (the player that just made his turn)
     * return - The other player (which is now his turn)
     */
	private Player changeTurns(Player currentPlayer){
	    if(currentPlayer == this.player1){
	        return this.player2;
        }
        return this.player1;
    }

    /*
     *
     * param currentPlayer - The player that it's his turn, when there in no unmarked sticks left.
     */
    private void updatedWins(Player currentPlayer){
	    if(currentPlayer == this.player1){
	        this.player1Wins +=1;
        }
        else{
	        this.player2Wins +=1;
        }
    }

    /**
     *
     * @param numberOfRounds - Run the game for the given number of rounds.
     */
    public void playMultipleRounds(int numberOfRounds){
        System.out.println("Starting a Nim competition of " + numberOfRounds + " rounds between a " +
                this.player1.getTypeName() +  " player and a " + this.player2.getTypeName() + " player.");
        for(int i=0; i<numberOfRounds; i++){
            this.play1Round();
        }
        System.out.println("The results are " + this.getPlayer1Wins()+":"+this.getPlayer2Wins());

    }

	/*
	 * This function, run 1 game (round)
	 */
	private void play1Round(){
        Player currentPlayer ;
        Move currentMove;
        final int MOVE_HAS_BEEN_MADE_SUCCESSFULLY = 0;
        currentPlayer = this.player1; // In each round player1 start the game.
        Board boardObject = new Board(); // initialize new board
        if (this.displayMessage){
            System.out.println("Welcome to the sticks game!");
        }
        while(boardObject.getNumberOfUnmarkedSticks() != 0){
            if (this.displayMessage){
                System.out.println("Player " + currentPlayer.getPlayerId() + ", it is now your turn!");
            }
            currentMove = currentPlayer.produceMove(boardObject);
            if(boardObject.markStickSequence(currentMove) == MOVE_HAS_BEEN_MADE_SUCCESSFULLY){ /* if the move
             has been made successfully */
                if (this.displayMessage){
                    System.out.println("Player " + currentPlayer.getPlayerId() +
                            " made the move: " + currentMove.toString());
                }
                currentPlayer = this.changeTurns(currentPlayer); /* change the player's turn after a move has
                  been made (successfully) */
            }
            else{ // if the move is illegal
                while(boardObject.markStickSequence(currentMove) != MOVE_HAS_BEEN_MADE_SUCCESSFULLY){
                    if (this.displayMessage){
                        System.out.println("Invalid move. Enter another:");
                    }
                    currentMove = currentPlayer.produceMove(boardObject); // produceMove till get valid move.
                }
                if (this.displayMessage){ // On verbose mode, print when the player made successful move
					// (print his move)
                    System.out.println("Player " + currentPlayer.getPlayerId() +
                            " made the move: " + currentMove.toString());
                }
                currentPlayer = this.changeTurns(currentPlayer); /* After a move has been successfully made,
                change turns */
            }
        }
        if(this.displayMessage){
            System.out.println("Player " + currentPlayer.getPlayerId() + " won!");
        }
        this.updatedWins(currentPlayer); // After a player won the game, update the wins
    }

	/**
	 * The method runs a Nim competition between two players according to the three user-specified arguments. 
	 * (1) The type of the first player, which is a positive integer between 1 and 4: 1 for a Random computer
	 *     player, 2 for a Heuristic computer player, 3 for a Smart computer player and 4 for a human player.
	 * (2) The type of the second player, which is a positive integer between 1 and 4.
	 * (3) The number of rounds to be played in the competition.
	 * @param args an array of string representations of the three input arguments, as detailed above.
	 */
	public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
		int p1Type = parsePlayer1Type(args);
		int p2Type = parsePlayer2Type(args);
		int numGames = parseNumberOfGames(args);
		boolean verboseMode = false; // default value, if there is no human verbose mode is off.
        Player player1 = new Player(p1Type,1,scanner);
        Player player2 = new Player(p2Type,2,scanner);
        if(player1.getPlayerType() == Player.HUMAN || player2.getPlayerType() == Player.HUMAN){
            verboseMode = true; /* change the default value from false to true, so when human play,
             verbose mode would be on. */
        }
        Competition competitionObject = new Competition(player1, player2, verboseMode);
        competitionObject.playMultipleRounds(numGames);
        scanner.close();
	}	
	
}
