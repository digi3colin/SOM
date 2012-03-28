package {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class Zombie implements ICharacter {
		public function Zombie(position:Number){
			this.position = position;
		}
		
		private var position:Number;
		public function getPosition() : Number {
			return position;
		}

		public function step() : void {
			position -= 1;
		}
	}
}
