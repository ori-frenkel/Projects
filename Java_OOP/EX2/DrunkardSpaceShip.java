import java.util.Random;

public class DrunkardSpaceShip extends RunnerSpaceShip {
	private final int NO_TURN = 0;
	/*
	Story time, the pilot of this spaceship had too many drinks, and forgot that there is a fire button,
	so this ship won't fire	, moreover the pilot love the speed (therefor always accelerate forward),
	In addition, the pilot just click the teleport button and the shield button randomly (the drinks made him
	an urge to click buttons, and the teleport button is bigger than the shield button, therefor he would
	 click randomly the button, but would hit the bigger button more times than the small button)
	 */


	/**
	 * Does the actions of this ship for this round.
	 * This is called once per round by the SpaceWars game driver.
	 *
	 * @param game the game object to which this ship belongs.
	 */
	public void doAction(SpaceWars game){
		final int SHIELD = 1;
		Random rand = new Random();
		int randomDecision = rand.nextInt(100) + 1; /* choose random number between 1 and 100, 2-100
		 represent teleport action, 1 represent activation of the shield (if possible) */
		if(randomDecision == SHIELD){
			this.drunkMove(game);
			this.shieldOn(); // trying to active the shield
		}
		else{
			this.teleport(); // trying to teleport
			this.drunkMove(game);
		}

	}

	/*
	Drunk move - the pilot love the speed, therefor he is only accelerate forward
	 */
	private void drunkMove(SpaceWars game){
		getPhysics().move(true, NO_TURN);
	}

}
