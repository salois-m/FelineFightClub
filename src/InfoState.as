package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	
	/**
	 * InfoState class
	 * @author KittenMittens
	 * @version 1.0
	 * 4/4/14
	 */
	public class InfoState extends FlxState
	{
		// back button
		private var backButton:FlxButton;
		
		[Embed(source = "../assets/04.mp3")]
		private var BackgroundSound:Class;
		
		// create a class for backbutton.png
		[Embed(source = "../assets/backbutton.png")]
		private var Back:Class;
		
		// create a class for info.png
		[Embed(source = "../assets/InfoMenu.png")]
		private var Temp:Class;
		
		override public function create():void
		{

			var sound:FlxSound = FlxG.play(BackgroundSound);
			
			// create flixel sprite for info
			var temp:FlxSprite = new FlxSprite(0, 0, Temp);
			// display info in game
			add(temp);
			
			// add text for instructions page
			var txt:FlxText
			txt = new FlxText(-200,(FlxG.width / 2) - 400, FlxG.width,"How To Play")
			txt.setFormat(null,40, 0xFF4682B4, "center")
			this.add(txt);
			txt = new FlxText(-200, (FlxG.width /2)  -300, FlxG.width, "Select Your Character")
			txt.setFormat(null, 30, 0xFF4682B4, "center");
			this.add(txt);
			txt = new FlxText(-200, (FlxG.width /2)  -130, FlxG.width, "Wait For The GO")
			txt.setFormat(null, 30, 0xFF4682B4, "center");
			this.add(txt);
			txt = new FlxText(-200, (FlxG.width /2)  -50, FlxG.width, "Press Space To Attack")
			txt.setFormat(null, 30, 0xFF4682B4, "center");
			this.add(txt);
			
			// allocate a back button object and call goBack on click			
			backButton = new FlxButton(30, 530, null, goBack);
			backButton.loadGraphic(Back, false, false, 157, 61);
			// display back button in game
			add(backButton);
		}
		
		// switch state when called
		private function goBack():void
		{
			// switch to MenuState
			FlxG.switchState(new MenuState);
		}
	}
}