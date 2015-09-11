package
{
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.sampler.Sample;
	
	public class player extends MovieClip
	{
		
		public var playerWidth:Number;
		public var playerheight:Number;
		public var rollingStatus:int = 1;
		public var position:int = 0;
		
		public var playerName:String;
		
		public function player(xPosition, yPosition, pName)
		{
		// constructor code
		//position the player on the stage
			this.x = xPosition;
			this.y = yPosition;
			this.playerName = pName;
		}
		
		public function getName ():String {
			return this.playerName;
		}
		
		
		

	}

}