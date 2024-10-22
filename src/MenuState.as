package  
{
	import flash.system.*;
	import org.flixel.*;
	
	/**
	 * MenuState class
	 * @author KittenMittens
	 * @version 1.0
	 * 4/3/14
	 */
	public class MenuState extends FlxState 
	{
		private var infoButton:FlxButton;
		private var playButton:FlxButton;
		private var quitButton:FlxButton;
		static  var numOfPlays:int;
		
		// create a class for the background music
		[Embed(source = "../assets/MainTheme.mp3")]
		private var BackgroundSound:Class;
		
		// create a class for StartMenu.png
		[Embed(source = "../assets/StartMenu.png")]
		private var Start:Class;
		
		// create a class for infobutton.png
		[Embed(source = "../assets/infobutton.png")]
		private var InfoB:Class;
		
		// create a class for playbutton.png
		[Embed(source = "../assets/playbutton.png")]
		private var PlayB:Class;
		
		// create a class for quitbutton.png
		[Embed(source = "../assets/quitbutton.png")]
		private var QuitB:Class;
		
		public function MenuState() 
		{
			// use singleton pattern to allocate
			// only one instance of sound
			if (numOfPlays == 0) 
			{
				// variable for sound
				var sound:FlxSound = new FlxSound();
				sound.loadEmbedded(BackgroundSound, true, false);
				sound.survive = false;
				sound.volume = 5;
				sound.play();
			}
			numOfPlays = 1;
		}
		
		// override create function in super class
		// change state of game
		override public function create():void
		{			
			// create flixel sprite for ring
			var start:FlxSprite = new FlxSprite(0, 0, Start);
			// display ring in game
			add(start);
			
			// show mouse
			FlxG.mouse.show();
			
			// allocate an info button object and call getInfo on click			
			infoButton = new FlxButton(120, 420, null, getInfo);
			infoButton.loadGraphic(InfoB, false, false, 157, 61);
			// display info button in game
			add(infoButton);
			
			// allocate a play button object and call playGame on click			
			playButton = new FlxButton(320, 420, null, playGame);
			playButton.loadGraphic(PlayB, false, false, 157, 61);
			// display play button in game
			add(playButton);
			
			// allocate a quit button object and call quitGame on click			
			quitButton = new FlxButton(520, 420, null, quitGame);
			quitButton.loadGraphic(QuitB, false, false, 157, 61);
			// display quit button in game
			add(quitButton);
		}
		
		// switch state when called
		private function getInfo():void
		{
			// switch to InfoState
			FlxG.switchState(new InfoState);
		}
		
		// switch state when called
		private function playGame():void
		{
			// switch to PlayState
			FlxG.switchState(new CharacterSelectState);
		}
		
		// quit the game when called
		private function quitGame():void
		{
			System.exit(0);
		}
	}
}