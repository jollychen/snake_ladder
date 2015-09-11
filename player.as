package
{
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.sampler.Sample;
	import flash.utils.*;
	
	public class player extends MovieClip
	{
		
		public var playerWidth:Number;
		public var playerheight:Number;
		
		public var position:int = 0;
		
		public var playerName:String;
		
		public var rollingStatus:Boolean;
		
		public var documentClass;
		
		public function player(xPosition, yPosition, pName, status, docClass) {
		// constructor code
		//position the player on the stage
			this.documentClass = docClass;
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
			if(! documentClass.checkWin(this)) {
				updatePosition(main.gameBoardTilesVector[this.position].x, main.gameBoardTilesVector[this.position].y);
			} else {
				this.position = 99;
				updatePosition(main.gameBoardTilesVector[this.position].x, main.gameBoardTilesVector[this.position].y);
				documentClass.createWinnerBulletin(this.playerName);
			}
		}
		
		public function updatePosition(xPos, yPos) {
			this.x = xPos;
			this.y = yPos;
			if (this.playerName == "Player1") {
				main.gameBoardTilesVector[this.position].showNode();
			}
			else if (this.playerName == "Player2") {
				main.gameBoardTilesVector[this.position].showCross();
			}
			if (checkIsLadderAndSnake(this.position)) {
				updatePosition(main.gameBoardTilesVector[this.position].x, main.gameBoardTilesVector[this.position].y);
			}
		}
		
		public function checkIsLadderAndSnake(position):Boolean {
			if (main.ladderAndSnakeDict[position]) {
				this.position = main.ladderAndSnakeDict[position];
				return true
			}
			return false
		}
		
		
		

	}

}