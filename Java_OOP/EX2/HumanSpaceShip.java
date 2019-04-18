import java.awt.Image;
import oop.ex2.*;

public class HumanSpaceShip extends SpaceShip {
	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 * (do action according to the user input)
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		GameGUI gui = game.getGUI();
		this.teleport(gui); // checks if the user want to teleport
		this.accelAndTurn(gui); // checks if the user want to accelerate and turn
		this.activeShieldIfPossible(gui); // checks if the user want to turn the shield on
		this.fireShoot(gui, game); // check if the user wants to fire (and do so if possible)

	}

	/*
	fire a shoot if the player want so, and if possible (enough energy + enough round been passed since last
	 fired)
	 */
	private void fireShoot(GameGUI gui, SpaceWars game){
		if(gui.isShotPressed()){
			this.fire(game);
		}
	}

	/*
	teleport if the user wants so, and if there is enough energy.
	 */
	private void teleport(GameGUI gui){
		if(gui.isTeleportPressed()){
			this.teleport();
		}
	}

	/*
	This function responsible to turn the shield on if it possible.
	 */
	private void activeShieldIfPossible(GameGUI gui){
		if(gui.isShieldsPressed()){
			this.shieldOn();
		}
	}

	/*
	This function check if the user want to accelerate and/or turn, and if so do that.
	 */
	private void accelAndTurn(GameGUI gui){
		boolean rightTurn = false;
		boolean leftTurn = false;
		boolean accel = false;
		if(gui.isLeftPressed()){ // checks if left pressed
			leftTurn = true;
		}
		if(gui.isRightPressed()){ // // checks if right pressed
			rightTurn = true;
		}
		if(gui.isUpPressed()){ // check if acceleration is pressed
			accel = true;
		}
		if(rightTurn && !leftTurn){ // if right pressed and left densest, then turn right
			getPhysics().move(accel, RIGHT_TURN);
		}
		else if(!rightTurn && leftTurn){ // if left pressed and right densest, then turn left
			getPhysics().move(accel, LEFT_TURN);
		}
		else { // if both right and left been pressed than make no turn.
			getPhysics().move(accel, NO_TURN);
		}
	}


	/**
	 * Gets the image of this ship. This method should return the image of the
	 * ship with or without the shield. This will be displayed on the GUI at
	 * the end of the round.
	 *
	 * @return the image of this ship.
	 */
	public Image getImage(){
		if(getIsShieldOn()){
			return GameGUI.SPACESHIP_IMAGE_SHIELD;
		}
		return GameGUI.SPACESHIP_IMAGE;
	}
}
