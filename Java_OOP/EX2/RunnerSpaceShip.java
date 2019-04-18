import oop.ex2.GameGUI;
import oop.ex2.SpaceShipPhysics;
import java.awt.*;

public class RunnerSpaceShip extends SpaceShip {

	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 * (this ship trying to run from the other ships, and when ship get too closed (less than 0.25) and aim
	 *  to the ship (angle - less than 0.23) then trying to teleport
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		this.teleportIfThreaten(game); // teleport if threaten
		this.moveAwayFromShips(game); // do a move (run away from the closest ship)

	}

	/*
	This function checks where the closest ship, if the closest ship is to the right of the ship, then do a
	 move to left, if the closest ship is to the left, then do a move to the right
	 */
	private void moveAwayFromShips(SpaceWars game){
		SpaceShipPhysics closetShip = game.getClosestShipTo(this).getPhysics();
		if( 0 <= this.getPhysics().angleTo(closetShip) && this.getPhysics().angleTo(closetShip) < Math.PI){
			getPhysics().move(true, RIGHT_TURN);
		}
		else if (- Math.PI < this.getPhysics().angleTo(closetShip) &&
				this.getPhysics().angleTo(closetShip)<0){
			getPhysics().move(true, LEFT_TURN);
		}
		else if (Math.abs(this.getPhysics().angleTo(closetShip)) == Math.PI){
			getPhysics().move(true, NO_TURN);
		}
	}
	/*
	The ship tries to teleport If the nearest ship is closer than 0.25 units,
	and if its angle to the Runner is less than 0.23 radians, the Runner feels threatened and will
	attempt to teleport.
	 */
	private void teleportIfThreaten(SpaceWars game){
		if((Math.abs(game.getClosestShipTo(this).getPhysics().angleTo(this.getPhysics())) < 0.23) &&
				(game.getClosestShipTo(this).getPhysics().distanceFrom(this.getPhysics()) < 0.25)){
			this.teleport();
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
			return GameGUI.ENEMY_SPACESHIP_IMAGE_SHIELD;
		}
		return GameGUI.ENEMY_SPACESHIP_IMAGE;
	}

}

