package  {
	
	/*
	In this project we will create a grid of tiles.
	The tiles are drawn from a symbol created on the stage and then saved into the library.
	*/
	
	import flash.display.MovieClip;
	
	import flash.text.*;
	
	public class main extends MovieClip {

		public var gameBoardStartX: int = 10;
		public var gameBoardStartY: int = 10;
		public var gameBoardTilesWide = 10;
		public var gameBoardTilesHigh = 10;
		public var tileWidth = 80;
		
		public function main() {
			// constructor code
			createGameBoard();
			
			createDiceTile();
			
		}
		
		public function createGameBoard ()
		{
			
			//var tileNumber: int = gameBoardTilesWide * gameBoardTilesHigh;
			var tileNumber:int = 1;
			var rowCounter = 1;
			var tileChange = -1;
			
			for (var i = 1; i <= gameBoardTilesHigh; i++)
			{
				
				var yPos = gameBoardStartY + (gameBoardTilesHigh - i)*tileWidth + tileWidth/2;
				
				if (i%2 == 1) {
					for (var j = 0; j < gameBoardTilesWide; j++)
					{
						var xPos = gameBoardStartX + tileWidth/2 + (j*tileWidth);
						var aTile:tile = new tile(xPos, yPos, tileNumber);
						stage.addChild(aTile);
						var myText:TextField = new TextField();
						aTile.addChild(myText);
						myText.text = tileNumber+"";
						tileNumber++;
					}
				}
				else{
					for (var k=0; k < gameBoardTilesWide; k++) {
						var xPos = gameBoardStartX + (gameBoardTilesWide - 1 - k)*tileWidth + tileWidth/2;
						var aTile:tile = new tile(xPos, yPos, tileNumber);
						stage.addChild(aTile);
						var myText:TextField = new TextField();
						aTile.addChild(myText);
						myText.text = tileNumber+"";
						tileNumber++;
					}
				}
				
				
			}
		}
		
		
		public function createDiceTile() {
			
			var diceTileWidth = 120;
			
			var diceTileName = "ImDice"
			
			var xPos = gameBoardStartX + gameBoardTilesWide*tileWidth + gameBoardStartX + diceTileWidth/2;
			var yPos = gameBoardStartY + gameBoardTilesHigh/2*tileWidth;
			
			var aDiceTile:diceTile = new diceTile(xPos, yPos, diceTileName);
			stage.addChild(aDiceTile);
			
			
		}
		
		

	}
	
}
