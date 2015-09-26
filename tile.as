package  {

	import flash.display.*;
	import flash.events.*;
	
	public class tile extends MovieClip{
		public var tileName;
		
		private var cross:Cross = new Cross();
		private var node:Node = new Node();
		
		public function tile(xPos, yPos, tileNumber) {
			// constructor code
			
			this.cross.visible = false;
			this.node.visible = false;
			
			this.addChild(this.node);
			this.addChild(this.cross);
			
			this.x = xPos;
			this.y = yPos;
			this.tileName = tileNumber;
			main.gameBoardTilesVector.push(this);
			this.addEventListener(MouseEvent.CLICK, showtilenumber);
			
		}
		
		public function showtilenumber(event:MouseEvent)
		{
			
			trace(this.tileName);
		
		}
		
		public function showCross() {
			if (this.node.visible == false) {
				this.cross.visible = true;
			}
			
		}
		
		public function showNode() {
			if (this.cross.visible == false) {
				this.node.visible = true;
			}
		}

	}
	
	
	
}
