package  {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class diceTile extends MovieClip{
		public var diceTileName:String;
		public var dicePoints:int;
		
		public var _player;
		public var documentClass;
		
		public function diceTile(xPos, yPos, tileName, docClass) {
			// constructor code
			
			this.x = xPos;
			this.y = yPos;
			this.diceTileName = tileName;

			this.documentClass = docClass
			
			this.addEventListener(MouseEvent.CLICK, rollingDice);
			
		}
		
		public function rollingDice(e:MouseEvent):void {
			var num = Math.ceil(Math.random()*6);
			this.dicePoints = num;
			this.gotoAndStop(num);
			this.documentClass.movePlayer(num);
		}
		
		public function getDicePoints():int {
			return this.dicePoints;
		}
		
	}
	
}
