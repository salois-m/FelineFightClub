package  
{
	import mx.core.FlexSprite;
	import org.flixel.*;

	/**
	 * Player Class
	 * @author Michael Salois & Jon Ferris
	 * 4/6/14
	 */
	public class Player extends FlxSprite 
	{
		
		
		[Embed(source="../assets/explosion.mp3")]
		private var BackgroundSound:Class;	
		
		public var counter:Number = 0;
		public static var sP:Boolean = false;
		
		public function Player() 
		{
			// load the image
			super(FlxG.width * 0.1, FlxG.height - 250, this.isPlayer());
		}
		
		// get chosen character
		public function isPlayer():Class {return CharacterSelectState.playerChosen;}
		// get chosen character's attack
		public function getAttack():Class {return CharacterSelectState.playerAttack;}

		override public function update():void
		{
		
			
			counter += FlxG.elapsed;
			if (PlayState.collision == true) 
			{
				velocity.x = 0;
				//colision noise
				var sound:FlxSound = FlxG.play(BackgroundSound);
				
			}
			else if (sP==false) {
				if (counter < 0.25)
					velocity.x = 75;
				else if (counter < 0.5)
					velocity.x = -75;
				else 
					if(counter>0.5)
					counter = 0;
			}

			if (FlxG.keys.justPressed("SPACE"))
			{
				// attack when key is pressed
				this.loadGraphic(this.getAttack(), false, false);
				velocity.x = 400;
				sP = true;
			}

			super.update();
		}
	}
}