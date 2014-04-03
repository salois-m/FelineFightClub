package  
{
	import org.flixel.*;

	/**
	 * MenuState class
	 * @author KittenMittens
	 * @version 1.0
	 * 3/23/14
	 */
	public class MenuState extends FlxState 
	{
		private var startButton:FlxButton;
		
		// create a class for StartMenu.png
		[Embed(source = "StartMenu.png")]
		private var Start:Class;
		
		public function MenuState() 
		{
			super();
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
			
			// allocate a start button object and call startGame on click			
			startButton = new FlxButton(360, 420, "START", startGame);
			// display start button in game
			add(startButton);
		}
		
		// switch state when called
		private function startGame():void
		{
			// hide mouse
			FlxG.mouse.hide();
			// switch to PlayState
			FlxG.switchState(new PlayState);
		}
		
	}

}