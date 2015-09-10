package  {

	import flash.display.*;
	import flash.events.*;
	
	public class tile extends MovieClip{
		public var tileName;
		
		
		public function tile(xPos, yPos, tileNumber) {
			// constructor code
			
			this.x = xPos;
			this.y = yPos;
			this.tileName = tileNumber;
			
			this.addEventListener(MouseEvent.CLICK, showtilenumber);
			
		}
		
		public function showtilenumber(event:MouseEvent)
		{
			
			trace(this.tileName);
		
		}

	}
	
	
	
}
