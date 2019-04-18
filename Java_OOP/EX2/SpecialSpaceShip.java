
public class SpecialSpaceShip extends AggressiveSpaceShip {

	/*
	Story time, this class represent the special force of the galactic authorities, the ship of the special
	force is much stronger and has much more firepower than the average spaceship, this ship purpose is to
	destroy all of the criminal in the galaxy, and therefor the ship pursue the criminal ships. (moreover
	the ship shield are very strong and almost impossible to breach there for the special force developed a
	fast tactic of destroy ship, which is to pursue criminal ship's and ram and shoot them.)
	In addition, the special ship has a nuclear power ship, which mean is almost unlimited amount of energy.
	The ship wont teleport because the nuclear power in sensitive to it.
	(the shield is off only for maintenance 1 per 100 round on average)
	 */

	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 *
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		this.unlimitedEnergy();
		this.pursueClosestShip(game);
		this.turnShield();
		this.fireWhenClose(game);
	}


	/*
	Each move the nuclear power restore the energy to 1000000000
	 */
	private void unlimitedEnergy(){
		this.setMaxEnergy(1000000000);
		this.setCurrentEnergy(1000000000);
	}

	/*
	The ship shield is almost always on (in average the shield is off 1 to 100 rounds)
	 */
	private void turnShield(){
		if(this.getRound() % 100 != 0){
			this.shieldOn();
		}
	}

}
