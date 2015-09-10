package
{
	
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class player extends MovieClip
	{
		
		public var playerWidth:Number;
		public var playerheight:Number;
		public var rollingStatus:int = 1;
		public var position:int = 0;
		
		public function player(xPosition, yPosition)
		{
		// constructor code
		//position the player on the stage
			this.x = xPosition;
			this.y = yPosition;
		}
		
		
		
		

	}

}