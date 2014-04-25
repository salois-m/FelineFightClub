package 
{

	public class scoreTracker 
	{
		//requires ScoreSave.txt to work
		var scorelocation:File = File.desktopDirectory.resolvePath("ScoreSave.txt");
		var scorewriter:FileStream = new FileStream();
		var highscore:Number = 999999;
		var level:int = 1;
		var scoreslist:Array = Array(6);
		
		public function readCurrentHighScore():void
		{
			//reads the high score from a file
			scorewriter.open(scorelocation, FileMode.READ);
			highscore = scorewriter.readFloat();
			scorewriter.close();
			scoreslist[0] = highscore;
		}
		
		public function checkHighScore(userTime:Number):void
		{
			if (userTime < highscore)
			{
				highscore = userTime;
				this.saveHighScore(); //updates the high score on the text file
				scoreslist[0] = highscore;
			}
		}
		
		public function saveHighScore():void
		{
			scorewriter.open(scorelocation, FileMode.WRITE);
			scorewriter.writeFloat(highscore); //writes the highscore into the text file
			scorewriter.close();
		}
		
		public function resetGame():void
		{
			level = 1;
			//reset the level to 1.
		}
		
		public function nextLevel():void
		{
			level = level + 1;
			//increase the level by 1.
			if (level > 5)
			{
				this.resetGame();
				//if the level counter goes pass four, the reset goes back to level 1.
			}
		}
		
		public function getLevel():int 
		{
			return level;
			//returns the level counter
		}
		
		public function getHighScore():Number 
		{
			return highscore;
		}
		
		//public function setLevelScore(presstime:Number):void
		//{
			//adds the time to an array to be called at a later time.
		//	scoreslist(level) = presstime;
		//}
		
		/**public function resetSessionScores():void
		{
			//set all session scores to 0.
			var stagetodelete:int;
			for (stagetodelete = 1; stagetodelete < 5; stagetodelete++)
			scoreslist[stagetodelete] = 0;
		}
		*/
		public function getLevelOneTime():Number
		{
			return scoreslist[1];
		}
		
		public function getLevelTwoTime():Number
		{
			return scoreslist[2];
		}
		
		public function getLevelThreeTime():Number
		{
			return scoreslist[3];
		}
		
		public function getLevelFourTime():Number
		{
			return scoreslist[4];
		}
		
		public function getLevelFiveTime():Number
		{
			return scoreslist[5];
		}
		
		public function getAverageTimeLosing():Number
		{
			var calculatorvar:Number;
			//called after losing the game therefore the
			//level one time would be called if the game ended at level 2
			//levels one and two would called if the game ended at level 3 etc.
			if (level == 1) {
				calculatorvar = 0;
			}
			else if (level == 2) {
				calculatorvar = this.getLevelOneTime();
			}
			else if (level == 3) {
				calculatorvar = this.getLevelOneTime();
				calculatorvar = calculatorvar + this.getLevelTwoTime();
				calculatorvar = calculatorvar / 2.00;
			}
			else if (level == 4) {
				calculatorvar = this.getLevelOneTime();
				calculatorvar = calculatorvar + this.getLevelTwoTime();
				calculatorvar = calculatorvar + this.getLevelThreeTime();
				calculatorvar = calculatorvar / 3.00;
			}
			else if (level == 5) {
				calculatorvar = this.getLevelOneTime();
				calculatorvar = calculatorvar + this.getLevelTwoTime();
				calculatorvar = calculatorvar + this.getLevelThreeTime();
				calculatorvar = calculatorvar + this.getLevelFourTime();
				calculatorvar = calculatorvar / 4.00;
			}
			return calculatorvar;
		}
		
		public function getAverageTimeWinning():Number
		{
			//gets the average time if all five levels are beat.
			var accumulator:Number;
			accumulator = this.getLevelFiveTime();
			accumulator = this.getLevelFourTime() + accumulator;
			accumulator = this.getLevelThreeTime() + accumulator;
			accumulator = this.getLevelTwoTime() + accumulator;
			accumulator = this.getLevelOneTime() + accumulator;
			accumulator = accumulator / 5.00;
			
			return accumulator;
		}
	}
}