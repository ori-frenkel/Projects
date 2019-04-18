import oop.ex2.SpaceShipPhysics;

public class BasherSpaceShip extends RunnerSpaceShip {

	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 *	This spaceship trying to "ram" the closest ship (and when close turn the shield on)
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		this.pursueClosestShip(game); // the function pursue the closest ship
		this.closeProximityShield(game); // trying to turn shield on when close to another ship
	}

	/*
	This function attempt to turn the shield on, when getting close to another ship (0.19 inclusive distance)
	 */
	private void closeProximityShield(SpaceWars game){
		if(game.getClosestShipTo(this).getPhysics().distanceFrom(this.getPhysics()) <= 0.19){
			this.shieldOn();
		}
	}

	/**
	 * 	This function make a move according to the closest ship,
	 * if the closest ship is to the left of the ship (or behind) then make a move to the left
	 * if the closest ship is to the right of the ship, then make a move to the right
	 * if the closest ship is in front of the ship, then continue accelerate to the same direction
	 * (The ship always accelerate)
	 * @param game - the game that running
	 */
	public void pursueClosestShip(SpaceWars game){
		SpaceShipPhysics closetShip = game.getClosestShipTo(this).getPhysics();
		if( 0 < this.getPhysics().angleTo(closetShip) && this.getPhysics().angleTo(closetShip) <= Math.PI){
			getPhysics().move(true, LEFT_TURN);
		}
		else if (- Math.PI <= this.getPhysics().angleTo(closetShip) &&
				this.getPhysics().angleTo(closetShip) < 0){
			getPhysics().move(true, RIGHT_TURN);
		}
		else if (this.getPhysics().angleTo(closetShip) == 0){
			getPhysics().move(true, NO_TURN);
		}
	}


}
