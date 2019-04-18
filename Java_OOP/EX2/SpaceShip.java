import java.awt.Image;
import oop.ex2.*;

/**
 * The API spaceships need to implement for the SpaceWars game. 
 * It is your decision whether SpaceShip.java will be an interface, an abstract class,
 *  a base class for the other spaceships or any other option you will choose.
 *  
 * @author Ori Frenkel , Id 314643164
 */
public abstract class SpaceShip {
	private SpaceShipPhysics shipPhysics ;
	private int health, maximalEnergy, currentEnergy, round, lastRoundShotBeenFire;
	private boolean isShieldOn;

	/** A possible Move in the move function */
	public static int RIGHT_TURN = -1;

	/** A possible Move in the move function */
	public final int LEFT_TURN = 1;

	/** A possible Move in the move function */
	public final int NO_TURN = 0;

	private final int DEFAULT_HEALTH = 22;
	public SpaceShip(){
		this.shipPhysics = new SpaceShipPhysics();
		this.health = DEFAULT_HEALTH;
		this.maximalEnergy = 210; // start with maximal energy of 210
		this.currentEnergy = 190; // start with current energy of 190
		this.round = 8;
		this.isShieldOn = false;
		this.lastRoundShotBeenFire  = 1;
	}

	/*
	If 7 rounds or more passed since the last Fired shot , then return True, else return false.
	 */
	private boolean isEnoughRoundPassedToFire(){
		return this.round - this.lastRoundShotBeenFire >= 7;
	}

	/**
	 *
	 * @return IsShieldOn parameter - true if shield is on, else return false
	 */
	boolean getIsShieldOn() {
		return isShieldOn;
	}

	/**
	 * This function set a new maximalEnergy
	 * @param energy - the amount of energy to set for the maximalEnergy
	 */
	public void setMaxEnergy(int energy){
		this.maximalEnergy = energy;
	}

	/**
	 * This function set the a new currentEnergy
	 * @param energy - the amount of energy to set as currentEnergy
	 */
	public void setCurrentEnergy(int energy){
		this.currentEnergy = energy;
	}

	/**
	 *
	 * @return - the round which the space ship is in.
	 */
	public int getRound(){
		return this.round;
	}

	/**
     * Does the actions of this ship for this round.
     * This is called once per round by the SpaceWars game driver.
     *
     * @param game the game object to which this ship belongs.
     */
    public void doAction(SpaceWars game){};

    /**
     * This method is called every time a collision with this ship occurs 
     */
    public void collidedWithAnotherShip(){
		if(this.isShieldOn){
			this.maximalEnergy += 18; // when ship "bashing" another ship, add 18 points to max energy
			this.currentEnergy += 18; // // when ship "bashing" another ship, add 18 points to current energy
		}
		else{
			this.health -= 1; // collision without shield reduce the health by 1.
		}
    }

    /** 
     * This method is called whenever a ship has died. It resets the ship's 
     * attributes, and starts it at a new random position.
     */
    public void reset(){
		this.shipPhysics = new SpaceShipPhysics();
		this.health = DEFAULT_HEALTH;
		this.maximalEnergy = 210; // start with maximal energy of 210
		this.currentEnergy = 190; // start with current energy of 190
		this.round = 8;
		this.lastRoundShotBeenFire  = 1;
		this.isShieldOn = false;
	}

    /**
     * Checks if this ship is dead.
     * 
     * @return true if the ship is dead. false otherwise.
     */
    public boolean isDead() {
    	this.updateThatOccurEachEndOfRound();
		return this.health <= 0; /* if health is at 0, then the ship is dead and return true, else false.
		I did 0 or lower, because in 1 round the ship can get hit more than 1 time, so it can get lower than 0
		but after that round the ship would be dead) */
	}

    /**
     * Gets the physics object that controls this ship.
     * 
     * @return the physics object that controls the ship.
     */
    public SpaceShipPhysics getPhysics() {
        return this.shipPhysics;
    }

    /**
     * This method is called by the SpaceWars game object when ever this ship
     * gets hit by a shot.
     */
    public void gotHit() {
    	if (!this.isShieldOn){
			this.health -= 1; // reduce the health by 1.
			this.maximalEnergy -= 10; /* reduce 10 points from the max energy when the ship has been hit
			 without shield on. */
			if(this.maximalEnergy < this.currentEnergy){
				this.currentEnergy = maximalEnergy; /* if after the ship has been hit, and it new max energy
				 is lower than the current energy,then change the current energy to the max energy the
				 new one)*/
			}
		}

    }

    /**
     * Gets the image of this ship. This method should return the image of the
     * ship with or without the shield. This will be displayed on the GUI at
     * the end of the round.
     * 
     * @return the image of this ship.
     */
    public Image getImage(){ return null; };

    /**
     * Attempts to fire a shot.
     * Can fire a shoot only if has more than 19 current energy and if at least 7 round been passed since the
	 * last shot.
     * @param game the game object.
     */
    public void fire(SpaceWars game) {
		if((this.currentEnergy >= 19)&&(this.isEnoughRoundPassedToFire())){
			game.addShot(shipPhysics);
			this.currentEnergy -= 19;
			this.lastRoundShotBeenFire = this.round;
		}
    }

    /**
     * Attempts to turn on the shield. (possible only if there is 3 or more current energy)
     */
    public void shieldOn() {
        if(this.currentEnergy >= 3){
        	this.isShieldOn = true;
        	this.currentEnergy -= 3;
		}
    }

    /**
     * Attempts to teleport. (possible only if there is 140 current energy)
     */
    public void teleport() {
    	if(this.currentEnergy >= 140){
    		this.shipPhysics = new SpaceShipPhysics();
    		this.currentEnergy -= 140; /* decrease 140 points from the current energy if the teleport has been
    		 made successfully */
		}

    }

    /*
    Each end of round (starting of new one) the shield should turn off and round counter should be updated
    and the current energy gain 1 more point
     */
    private void updateThatOccurEachEndOfRound(){
		this.isShieldOn = false;
		this.round += 1; // update the number of rounds.
		this.currentEnergy += 1;

	}
    
}
