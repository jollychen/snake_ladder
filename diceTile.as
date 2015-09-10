package  {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class diceTile extends MovieClip{
		public var diceTileName:String;
		public function diceTile(xPos, yPos, tileName) {
			// constructor code
			
			this.x = xPos;
			this.y = yPos;
			this.diceTileName = tileName;
			
			this.addEventListener(MouseEvent.CLICK, rollingDice);
		}
		
		public function rollingDice():Number {
			var num = Math.ceil(Math.random()*6);
			trace(num);
			return num;
		}

	}
	
}
