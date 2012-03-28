package {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class Player implements ICharacter{
		public function Player(position:Number){
			this.position = position;
		}

		private var position:Number;

		public function move(x:Number):void{
			position+=x;
		};

		public function getPosition():Number{
			return position;
		}

		public function step() : void {

		}
	}
}
