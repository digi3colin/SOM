package {
	/**
	 * @author Digi3Studio - Colin Leung
	 */
	public class World {
		private var zones:Array;
		private var teams:Array;
		private var width:Number;
		
		public function World(width:Number):void{
			this.width = width;
			zones = [];
			teams = [];
		}
		public function addObj(obj:ICharacter,teamId:int):void{
			var team:Array = teams[teamId]||[];
			team.push(obj);
			teams[teamId] = team;
		}

		public function step():void{
			//update all objects;
			for(var i:int=0;i<teams.length;i++){
				var team:Array = teams[i];
				for(var j:int=0;j<team.length;j++){
					ICharacter(team[j]).step();
				}
			}
		}

		public function getTeam(teamId:int):Array{
			return teams[teamId];
		}
	}
}
