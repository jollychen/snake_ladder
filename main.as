package  {

	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	
	import flash.text.*;
	import flash.utils.Dictionary;
	
	public class main extends MovieClip {

		public var gameBoardStartX: int = 50;
		public var gameBoardStartY: int = 50;
		public var gameBoardTilesWide = 10;
		public var gameBoardTilesHigh = 10;
		public var tileWidth = 80;
		public var target: Boolean = false;
		public var aDiceTile: diceTile;
		public var aShowStep: showStep;
		public var bulletin: winnerBulletin;
		public var ladder1:ladderAndSnake;
		public var ladder2:ladderAndSnake;
		public var ladder3:ladderAndSnake;
		public var snake1:ladderAndSnake;
		public var snake2:ladderAndSnake;
		public var snake3:ladderAndSnake;
		
		public static var player1:player;
		public static var player2:player;
		
		public static var gameBoardTilesVector:Vector.<tile> = new Vector.<tile>();
		
		public static var ladderAndSnakeDict:Dictionary = new Dictionary();
		
		public function main() {
			// constructor code
			game();			
			
		}
		
		public function game() {
			createGameBoard();
			createLadders();
			createSnakes();
			createPlayer();
			createDiceTile();
			createShowStep();
		}
		
		//  ================================  Create Game Board  ===========================
		
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
		
		
		// ===============================  Create Dice  =================================
		
		
		public function createDiceTile() {
			
			var diceTileWidth = 120;
			
			var xPos = gameBoardStartX + gameBoardTilesWide*tileWidth + gameBoardStartX + diceTileWidth/2;
			var yPos = gameBoardStartY + 4*tileWidth;
			
			aDiceTile = new diceTile(xPos, yPos, "ImDice1", this);
			aDiceTile.gotoAndStop(1);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, aDiceTile.rollingDice);
			stage.addChild(aDiceTile);
			
		}
		
		
		// =============================== player related method  ==================================
		
		public function createPlayer() {
			player1 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y, "Nought", true, this);
			player1.gotoAndStop(1);
			stage.addChild(player1);
			
			player2 = new player(gameBoardTilesVector[0].x, gameBoardTilesVector[0].y, "Cross", false, this);
			player2.gotoAndStop(2);
			stage.addChild(player2);
		}
		
		public function movePlayer(num) {
				if (player1.rollingStatus) {
				player1.movePosition(num);
				player1.setRollingStatus(false);
				player2.setRollingStatus(true);
				aShowStep.gotoAndStop(1);
			    }
				else{
					if(player2.rollingStatus) {
						player2.movePosition(num);
						player2.setRollingStatus(false);
						player1.setRollingStatus(true);
						aShowStep.gotoAndStop(2);
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
		
		public function disableMovement() {
			target = true;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, aDiceTile.rollingDice);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, cleanGame);
			//aDiceTile.removeClickListener();
		}
		
		public function cleanGame(e:KeyboardEvent) {
			for(var i = 0; i <= 99; i++ ) {
				stage.removeChild(main.gameBoardTilesVector[i]);
			}
			main.gameBoardTilesVector = Vector.<tile>([]);
			
			stage.removeChild(ladder1);
			stage.removeChild(ladder2);
			stage.removeChild(ladder3);
			stage.removeChild(snake1);			
			stage.removeChild(snake2);
			stage.removeChild(snake3);			
			stage.removeChild(aDiceTile);
			stage.removeChild(aShowStep);
			stage.removeChild(bulletin);
			stage.removeChild(player1);
			stage.removeChild(player2);
			//main.gameBoardTilesVector.forEach(removeGameBoard);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, cleanGame);
			game();
				
		}
		
		
		//  ========================  Create Winner Bulletin  ======================
		
		public function createWinnerBulletin(winner) {
			bulletin = new winnerBulletin(winner);
			stage.addChild(bulletin);
		}
		
		
		// ======================== Create showStep ======================================
		
		public function createShowStep() {
			aShowStep = new showStep();
			aShowStep.gotoAndStop(3);
			stage.addChild(aShowStep);
		}
		
		
		//  ========================  Create Ladders and Snakes  =============================
		
		public function createLadders() {
			ladder1 = new ladderAndSnake(280, 550);
			ladder1.gotoAndStop(1);
			ladderAndSnakeDict[22] = 56;
			stage.addChild(ladder1)
			
			ladder2 = new ladderAndSnake(470, 650);
			ladder2.gotoAndStop(2);
			ladderAndSnakeDict[12] = 34;
			stage.addChild(ladder2);
			
			ladder3 = new ladderAndSnake(600, 220);
			ladder3.gotoAndStop(3);
			ladderAndSnakeDict[67] = 93;
			stage.addChild(ladder3);
		}
		
		public function createSnakes() {
			snake1 = new ladderAndSnake(540, 370);
			ladderAndSnakeDict[84]=32;
			snake1.gotoAndStop(6);
			stage.addChild(snake1);
			
			snake2 = new ladderAndSnake(255, 220);
			ladderAndSnakeDict[96]=77;
			snake2.gotoAndStop(7);
			stage.addChild(snake2);
			
			snake3 = new ladderAndSnake(300, 680);
			ladderAndSnakeDict[41]=4;
			snake3.gotoAndStop(8);
			stage.addChild(snake3);
		}
		

	}
	
}
