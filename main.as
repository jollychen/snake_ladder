﻿package  {

	
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
			
			var aDiceTile = new diceTile(xPos, yPos, "ImDice1", this);
			aDiceTile.gotoAndStop(1);
			stage.addChild(aDiceTile);
			
		}
		
		
		public function createPlayer() {
			player1 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y, "Player1", true, this);
			player1.gotoAndStop(1);
			stage.addChild(player1);
			
			player2 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y, "Player2", false, this);
			player2.gotoAndStop(2);
			stage.addChild(player2);
		}
		
		public function movePlayer(num) {
			if (player1.rollingStatus) {
				player1.movePosition(num);
				player1.setRollingStatus(false);
				player2.setRollingStatus(true);
			}
			else{
				if(player2.rollingStatus) {
					player2.movePosition(num);
					player2.setRollingStatus(false);
					player1.setRollingStatus(true);
				}
			}
		}
		
		public function checkWin(player):Boolean {
			if (player.position >= 99) {
				var winner = player.getName();
				//createWinnerBulletin(winner);
				return true;
			}
			return false;
		}
		
		public function createWinnerBulletin(winner) {
			var bulletin:winnerBulletin = new winnerBulletin(winner);
			stage.addChild(bulletin);
		}
		

	}
	
}
