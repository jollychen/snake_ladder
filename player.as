package
{
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.sampler.Sample;
	
	public class player extends MovieClip
	{
		
		public var playerWidth:Number;
		public var playerheight:Number;
		
		public var position:int = 0;
		
		public var playerName:String;
		
		public var rollingStatus:Boolean;
		
		public function player(xPosition, yPosition, pName, status) {
		// constructor code
		//position the player on the stage
			this.x = xPosition;
			this.y = yPosition;
			this.playerName = pName;
			this.rollingStatus = status;
		}
		
		public function getName ():String {
			return this.playerName;
		}
		
		public function setRollingStatus (status:Boolean):void {
			this.rollingStatus = status;
		}
		
		public function movePosition (num) {
			this.position += num;
			if(! main.checkWin(this)) {
				updatePosition(main.gameBoardTilesVector[this.position].x, main.gameBoardTilesVector[this.position].y);
			}
		}
		
		public function updatePosition(xPos, yPos) {
			this.x = xPos;
			this.y = yPos;
		}
		
		
		

	}

}