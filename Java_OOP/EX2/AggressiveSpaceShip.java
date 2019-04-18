public class AggressiveSpaceShip extends BasherSpaceShip {

	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 *
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		this.pursueClosestShip(game); // pursue the closest ship
		this.fireWhenClose(game);

	}

	/**
	 * This function checks if the ship angle through the closest ship is less than 0.21 rad , if so try to
	 * fire.
	 * @param game - the game the we ruining in.
	 */
	protected void fireWhenClose(SpaceWars game){
		if(Math.abs(this.getPhysics().angleTo(game.getClosestShipTo(this).getPhysics())) < 0.21 ){
			this.fire(game);
		}
	}

}
