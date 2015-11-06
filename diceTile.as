package  {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.events.KeyboardEvent;
	
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
			
			
			
		}
		
		public function rollingDice(e:KeyboardEvent):void {  //event listener is binded in main create dicetile
			var num = 0;
			switch(e.keyCode) {
				case 87: //w
					num = 1;
					this.dicePoints = num;
					trace("1");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				case 65: //a
					num = 2;
					this.dicePoints = num;
					trace("2");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				case 83: //s
					num = 3;
					this.dicePoints = num;
					trace("3");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				case 68: //d
					num = 4;
					this.dicePoints = num;
					trace("4");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				case 70: //f
					num = 5;
					this.dicePoints = num;
					trace("5");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				case 71: //g
					num = 6;
					this.dicePoints = num;
					trace("6");
					this.gotoAndStop(num);
					this.documentClass.movePlayer(num);
					break;
				default:
					trace("you input wrong")
			}
		}
		
		public function getDicePoints():int {
			return this.dicePoints;
		}
		
		/*public function addClickListener() {
			this.addEventListener(MouseEvent.CLICK, rollingDice);
		}
		
		public function removeClickListener() {
			this.removeEventListener(MouseEvent.CLICK, rollingDice);
		}*/
		
	}
	
}
