package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class Main extends Sprite{
		private var world:World;
		private var dictCharacterSprite:Dictionary;

		public function Main(){
			//setup characters
			world = new World(500);
			world.addObj(new Zombie(500), 1);
			world.addObj(new Player(0), 0);

			//setup sprites
			dictCharacterSprite = new Dictionary(true);

			for(var teamId:int=0;teamId<2;teamId++){
				var team:Array = world.getTeam(teamId);
				for(var j:int=0;j<team.length;j++){
					dictCharacterSprite[team[j]] = makeSprite(teamId);		
				}
			}

			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function makeSprite(teamId:Number):Sprite{
			var result:Sprite = new Sprite();
			result.graphics.beginFill((teamId==0)?0xFF0000:0x00FF00, 1);
			result.graphics.drawCircle(0, 0, 10);
			this.addChild(result);
			//test position;
			result.y = 100;

			return result;
		}

		private function loop(e:Event):void{
			world.step();
			for(var char:Object in dictCharacterSprite){
				Sprite(dictCharacterSprite[char]).x = ICharacter(char).getPosition();
			}
			
/*			for(var char:ICharacter in dictCharacterSprite){
				trace(char);
//				
			}*/
		}
	}
}
