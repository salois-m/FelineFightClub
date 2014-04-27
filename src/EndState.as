package  
{
	import flash.media.Sound;
	import mx.core.FlexSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author KittenMittens
	 */
	public class EndState extends FlxState
	{
		// EndMenu background
		[Embed(source = "../assets/EndMenu.png")]
		private var End:Class;
		
		// playagain & home buttons
		[Embed(source = "../assets/playagainbutton.png")]
		private var PlayAgain:Class;
		[Embed(source = "../assets/homebutton.png")]
		private var Home:Class;
		
		//the high score save
		private var bestEverScore:FlxSave;
		// store buttons in variables
		private var playAgainButton:FlxButton;
		private var homeButton:FlxButton;
		// saves
		private var stage1SavedTime:FlxSave; 
		private var stage2SavedTime:FlxSave;
		private var stage3SavedTime:FlxSave;
		private var stage4SavedTime:FlxSave;
		private var stage5SavedTime:FlxSave;
		private var stage1AttackCheck:FlxSave; 
		private var stage2AttackCheck:FlxSave; 
		private var stage3AttackCheck:FlxSave; 
		private var stage4AttackCheck:FlxSave; 
		private var stage5AttackCheck:FlxSave; 
		//the level scores this session
		private var levelOneTime:Number;
		private var levelTwoTime:Number;
		private var levelThreeTime:Number;
		private var levelFourTime:Number;
		private var levelFiveTime:Number;
		//variables to check if the user won
		//a perticular level
		private var didPressSpaceOne:Boolean;
		private var didPressSpaceTwo:Boolean;
		private var didPressSpaceThree:Boolean;
		private var didPressSpaceFour:Boolean;
		private var didPressSpaceFive:Boolean;
		//number of levels won
		private var numberOfRoundsWon:int;
		//the high score
		private var highScore:Number;
		//best time this session
		private var bestTime:Number;
		//was the best time beat?
		private var beatBestTime:Boolean = false;
		//the average reaction time
		private var averageReactionTime:Number;
		// sprites
		private var cat:FlxSprite;
				
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			//create the FlxSave Objects to check/reset scores.
			//and loads their values into the given variable.
			
			stage1AttackCheck = new FlxSave()
			stage1AttackCheck.bind("Stage1Attacked");
			didPressSpaceOne = stage1AttackCheck.data.DidAttack;
			
			stage2AttackCheck = new FlxSave()
			stage2AttackCheck.bind("Stage2Attacked");
			didPressSpaceTwo = stage2AttackCheck.data.DidAttack;
			
			stage3AttackCheck = new FlxSave()
			stage3AttackCheck.bind("Stage3Attacked");
			didPressSpaceThree = stage3AttackCheck.data.DidAttack;
			
			stage4AttackCheck = new FlxSave()
			stage4AttackCheck.bind("Stage4Attacked");
			didPressSpaceFour = stage4AttackCheck.data.DidAttack;
			
			stage5AttackCheck = new FlxSave()
			stage5AttackCheck.bind("Stage5Attacked");
			didPressSpaceFive = stage5AttackCheck.data.DidAttack;
			
			
			//if there is no high score a default one is made
			//at a high value
			bestEverScore = new FlxSave()
			bestEverScore.bind("HighScore");
			highScore = bestEverScore.data.HighScore;
			if (highScore < 0.00) {
				highScore = 24;
				bestEverScore.data.HighScore = highScore;
				bestEverScore.flush()
			}
			
			stage1SavedTime = new FlxSave()
			stage1SavedTime.bind("Stage1Time");
			levelOneTime = stage1SavedTime.data.Time;
			
			stage2SavedTime = new FlxSave()
			stage2SavedTime.bind("Stage2Time");
			levelTwoTime = stage2SavedTime.data.Time;
			
			stage3SavedTime = new FlxSave()
			stage3SavedTime.bind("Stage3Time");
			levelThreeTime = stage3SavedTime.data.Time;
			
			stage4SavedTime = new FlxSave()
			stage4SavedTime.bind("Stage4Time");
			levelFourTime = stage4SavedTime.data.Time;
			
			stage5SavedTime = new FlxSave()
			stage5SavedTime.bind("Stage5Time");
			levelFiveTime = stage5SavedTime.data.Time;	
			
			// create flixel sprite for EndMenu
			var endMenu:FlxSprite = new FlxSprite(0, 0, End);
			add(endMenu);
			
			cat = new FlxSprite(650, 390, CharacterSelectState.playerChosen);
			add(cat);
			
			numberOfRoundsWon = this.howManyRounds(); //get the number of rounds won.
			this.findBestTime(); //give a value to best session time, so it can be called.
			this.findAverageReaction(); // find the average reaction time.
			
			// allocate a play again button object and call replay on click			
			playAgainButton = new FlxButton(438, 380, null, replay);
			playAgainButton.loadGraphic(PlayAgain, false, false, 157, 61);
			add(playAgainButton);
			
			// allocate a home button object and call toHome on click			
			homeButton = new FlxButton(438, 480, null, toHome);
			homeButton.loadGraphic(Home, false, false, 157, 61);
			add(homeButton);
		}
		
		//reset the scores once the numbers are calculated.
		//same as the method in character select
		//Character Select screen resets all of the last sessions' scores
		
		
		//check if the best time this session beat the highscore
		private function checkHighScore():void {
			if (bestTime < highScore) {
				beatBestTime = true;
				highScore = bestTime;
				bestEverScore.data.HighScore = highScore;
				bestEverScore.flush()
			} else { beatBestTime = false; }
		}
		
		//find number of stages beat.
		//needed to find the average
		private function howManyRounds():int {
			if (didPressSpaceFive == true) {
				return 5;
			} if (didPressSpaceFour == true) {
				return 4;
			} if (didPressSpaceThree == true) {
				return 3;
			} if (didPressSpaceTwo == true) {
				return 2;
			} if (didPressSpaceOne == true) {
				return 1;
			}
			
			return 0; //returns zero if no levels were beat.
		}		
		
		//find the best time this session
		private function findBestTime():void {
			bestTime = 24.0;
			if (didPressSpaceFive == true) {
				bestTime = levelFiveTime;
			} if (didPressSpaceFour == true) {
				if (levelFourTime < bestTime) {
					bestTime = levelFourTime;
				}
			} if (didPressSpaceThree == true) {
				if (levelThreeTime < bestTime) {
					bestTime = levelThreeTime;
				}
			} if (didPressSpaceTwo == true) {
				if (levelTwoTime < bestTime) {
					bestTime = levelTwoTime;
				}
			} if (didPressSpaceOne == true) {
				if (levelOneTime < bestTime) {
					bestTime = levelOneTime;
				}
			} if (didPressSpaceOne == false) {
				bestTime = 0; 
			} else {
					this.checkHighScore();	
				} 
		}
		
		private function findAverageReaction():void {
			//these steps are done one step
			//at a time to ensure there are no errors
			if (numberOfRoundsWon == 0) {
				averageReactionTime = 0;
			} if (numberOfRoundsWon == 1) {
				averageReactionTime = levelOneTime;
			} if (numberOfRoundsWon == 2) {
				averageReactionTime = levelOneTime + levelTwoTime;
				averageReactionTime = averageReactionTime / 2.00;
			} if (numberOfRoundsWon == 3) {
				averageReactionTime = levelOneTime + levelTwoTime;
				averageReactionTime = averageReactionTime + levelThreeTime;
				averageReactionTime = averageReactionTime / 3.00;
			} if (numberOfRoundsWon == 4) {
				averageReactionTime = levelOneTime + levelTwoTime;
				averageReactionTime = averageReactionTime + levelThreeTime;
				averageReactionTime = averageReactionTime + levelFourTime;
				averageReactionTime = averageReactionTime / 4.00;
			} if (numberOfRoundsWon == 5) {
				averageReactionTime = levelOneTime + levelTwoTime;
				averageReactionTime = averageReactionTime + levelThreeTime;
				averageReactionTime = averageReactionTime + levelFourTime;
				averageReactionTime = averageReactionTime + levelFiveTime;
				averageReactionTime = averageReactionTime / 5.00;
			}
		}
		
		// switch state when called
		private function replay():void {
			this.clearscores();
			FlxG.switchState(new CharacterSelectState);
			}
		
		// switch state when called
		private function toHome():void {
			this.clearscores();
			FlxG.switchState(new MenuState);
			}
	
		//delete the session's scores.
		//Called at the end.
	
		private function clearscores():void 
	{
		stage1SavedTime.data.Time = 0.00;
		stage2SavedTime.data.Time = 0.00;
		stage3SavedTime.data.Time = 0.00;
		stage4SavedTime.data.Time = 0.00;
		stage5SavedTime.data.Time = 0.00;
		
		stage1AttackCheck.data.DidAttack = false;
		stage2AttackCheck.data.DidAttack = false;
		stage3AttackCheck.data.DidAttack = false;
		stage4AttackCheck.data.DidAttack = false;
		stage5AttackCheck.data.DidAttack = false;
	
		stage1AttackCheck.flush();
		stage2AttackCheck.flush();
		stage3AttackCheck.flush();
		stage4AttackCheck.flush();
		stage5AttackCheck.flush();
		stage1SavedTime.flush();
		stage2SavedTime.flush();
		stage3SavedTime.flush();
		stage4SavedTime.flush();
		stage5SavedTime.flush();
	}	
	}	
}