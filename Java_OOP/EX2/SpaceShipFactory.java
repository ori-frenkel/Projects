
public class SpaceShipFactory {
    public static SpaceShip[] createSpaceShips(String[] args) {
		SpaceShip spaceShipArray[] = new SpaceShip[args.length];
		for(int i=0;i<args.length;i++) {
			if(args[i].equals("h")){
				SpaceShip humanShip = new HumanSpaceShip();
				spaceShipArray[i] = humanShip;
			}
			else if(args[i].equals("r")){
				SpaceShip runnerShip = new RunnerSpaceShip();
				spaceShipArray[i] = runnerShip;
			}
			else if(args[i].equals("b")){
				SpaceShip basherShip = new BasherSpaceShip();
				spaceShipArray[i] = basherShip;
			}
			else if(args[i].equals("a")){
				SpaceShip aggressiveShip = new AggressiveSpaceShip();
				spaceShipArray[i] = aggressiveShip;
			}
			else if(args[i].equals("d")){
				SpaceShip drunkenShip = new DrunkardSpaceShip();
				spaceShipArray[i] = drunkenShip;
			}
			else if (args[i].equals("s")){
				SpaceShip specialShip = new SpecialSpaceShip();
				spaceShipArray[i] = specialShip;
			}
			else return null;

		}
	return spaceShipArray;
    }
}
