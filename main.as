package  {
	
	/*
	In this project we will create a grid of tiles.
	The tiles are drawn from a symbol created on the stage and then saved into the library.
	*/
	
	import flash.display.MovieClip;
	
	import flash.text.*;
	
	public class main extends MovieClip {

		public var gameBoardStartX: int = 50;
		public var gameBoardStartY: int = 50;
		public var gameBoardTilesWide = 10;
		public var gameBoardTilesHigh = 10;
		public var tileWidth = 80;
		
		public static var player1:player;
		public static var player2:player;
		
		//public static var aDiceTile:diceTile;
		
		public static var gameBoardTilesVector:Vector.<tile> = new Vector.<tile>();
		
		public function main() {
			// constructor code
			createGameBoard();
			
			createPlayer();
			
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
						myText.x = 15;
						myText.y = 15;
						if (tileNumber == 1) {
							myText.x = 5;
							myText.y = 15;
							myText.text = "Start";
						}
						else{
							myText.text = tileNumber+"";
						}
						
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
						myText.x = 15;
						myText.y = 15;
						myText.text = tileNumber+"";
						
						tileNumber++;
					}
				}
				
				
			}
			trace(gameBoardTilesVector)
		}
		
		
		public function createDiceTile() {
			
			var diceTileWidth = 120;
			
			var xPos = gameBoardStartX + gameBoardTilesWide*tileWidth + gameBoardStartX + diceTileWidth/2;
			var yPos = gameBoardStartY + 4*tileWidth;
			
			var aDiceTile = new diceTile(xPos, yPos, "ImDice1", player1);
			aDiceTile.gotoAndStop(1);
			stage.addChild(aDiceTile);
			
			
			xPos = gameBoardStartX + gameBoardTilesWide*tileWidth + gameBoardStartX + diceTileWidth/2;
			yPos = gameBoardStartY + 8*tileWidth;
			
			var twoDiceTile = new diceTile(xPos, yPos, "ImDice2", player2);
			twoDiceTile.gotoAndStop(1);
			stage.addChild(twoDiceTile);
			
			
			
			
			
		}
		
		
		public function createPlayer() {
			player1 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y);
			player1.gotoAndStop(1);
			stage.addChild(player1);
			
			player2 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y);
			player2.gotoAndStop(2);
			stage.addChild(player2);
		}
		
		

	}
	
}
