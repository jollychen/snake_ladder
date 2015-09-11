package  {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class diceTile extends MovieClip{
		public var diceTileName:String;
		public var dicePoints:int;
		
		public var _player;
		//private var dicePointField:TextField;
		
		public function diceTile(xPos, yPos, tileName, player) {
			// constructor code
			
			this.x = xPos;
			this.y = yPos;
			this.diceTileName = tileName;
			this._player = player;
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, rollingDice);
			this.addEventListener(MouseEvent.MOUSE_UP, movePlayer);
			
		}
		
		public function rollingDice(e:MouseEvent):void {
			var num = Math.ceil(Math.random()*6);
			this.dicePoints = num;
			this.gotoAndStop(num);
		}
		
		public function getDicePoints():int {
			return this.dicePoints;
		}
		
		public function movePlayer(e:MouseEvent) {
			this._player.position += getDicePoints();
			if(! main.checkWin(this._player)) {
				updatePosition(main.gameBoardTilesVector[this._player.position].x, main.gameBoardTilesVector[this._player.position].y);
			}
		}
		
		public function updatePosition(xPos, yPos) {
			this._player.x = xPos;
			this._player.y = yPos;
		}
		
	}
	
}
