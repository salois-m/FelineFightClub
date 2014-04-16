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
<<<<<<< HEAD
		
		
		[Embed(source="../assets/explosion.mp3")]
		private var BackgroundSound:Class;	
		
		public var counter:Number = 0;
		public var sP:Boolean = false;
=======
		public var counter:Number = 0;
		public static var sP:Boolean = false;
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
		
		public function Player() 
		{
			// load the image
<<<<<<< HEAD
			super(FlxG.width * -0.1, FlxG.height - 250, this.isPlayer());
=======
			super(FlxG.width * 0.1, FlxG.height - 250, this.isPlayer());
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
		}
		
		// get chosen character
		public function isPlayer():Class {return CharacterSelectState.playerChosen;}
		// get chosen character's attack
		public function getAttack():Class {return CharacterSelectState.playerAttack;}

		override public function update():void
		{
<<<<<<< HEAD
		
			
			counter += FlxG.elapsed;
			if (PlayState.collision == true) 
			{
				velocity.x = 0;
				//colision noise
				var sound:FlxSound = FlxG.play(BackgroundSound)
				
			}
			
			//character moves toward center of the ring for 2.5 seconds then stops
			else if (sP == false) {
				if (counter < 2.5) 
					velocity.x=75	
				else
					velocity.x = 0;
			}
=======
			/*counter += FlxG.elapsed;
			if (PlayState.collision == true) 
				velocity.x = 0;
			else if (sP==false) {
				if (counter < 0.25)
					velocity.x = 75;
				else if (counter < 0.5)
					velocity.x = -75;
				else 
					if(counter>0.5)
					counter = 0;
			}*/
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be

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