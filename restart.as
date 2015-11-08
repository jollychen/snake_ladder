package  {
	import flash.display.*;
	import flash.events.MouseEvent;

	public class restart extends MovieClip {

		public function restart(xPos, yPos) {
			// constructor code

			this.x = xPos;
			this.y = yPos;
			
			this.gotoAndStop(1);
			this.addEventListener(MouseEvent.MOUSE_OVER, changeStyle);
			this.addEventListener(MouseEvent.MOUSE_OUT, recoverStyle);
			
			
		}
		
		public function changeStyle(e:MouseEvent) {
			this.gotoAndStop(2)
		}
		
		public function recoverStyle(e:MouseEvent) {
			this.gotoAndStop(1)
		}

	}
	
}
