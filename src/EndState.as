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
		
		// store buttons in variables
		private var playAgainButton:FlxButton;
		private var homeButton:FlxButton;
		// sprites
		private var cat:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();
			// create flixel sprite for EndMenu
			var endMenu:FlxSprite = new FlxSprite(0, 0, End);
			add(endMenu);
			
			cat = new FlxSprite(650, 390, CharacterSelectState.playerChosen);
			add(cat);
			
			// allocate a play again button object and call replay on click			
			playAgainButton = new FlxButton(438, 380, null, replay);
			playAgainButton.loadGraphic(PlayAgain, false, false, 157, 61);
			add(playAgainButton);
			
			// allocate a home button object and call toHome on click			
			homeButton = new FlxButton(438, 480, null, toHome);
			homeButton.loadGraphic(Home, false, false, 157, 61);
			add(homeButton);
		}
		
		// switch state when called
		private function replay():void {FlxG.switchState(new CharacterSelectState);}
		
		// switch state when called
		private function toHome():void {FlxG.switchState(new MenuState);}
	}
}