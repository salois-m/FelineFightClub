package  
{
	import org.flixel.*;

	/**
	 * ...
	 * @author Michael Salois
	 * 4/5/14
	 */
	public class Npc extends FlxSprite 
	{
		public var counter:Number = 0;
		public static var sP:Boolean = false;

		
		public function Npc() 
		{
			// load the image
			super(FlxG.width * 0.7, FlxG.height - 250, this.isPlayer());
		}
		
		// get chosen character
		public function isPlayer():Class {return CharacterSelectState.playerChosen;}
		// get chosen character's attack
		public function getAttack():Class { return CharacterSelectState.playerAttack; }

		/* Use enemyAttack.png for the update method (i.e. this.loadGraphic()
		 * after a certain time for the NPC to attack the player). In loadGraphic,
		 * use 214 for width and 247 for height as the parameters.*/
		override public function update():void
		{
			counter += FlxG.elapsed;
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
			}

			if (FlxG.keys.justPressed("SPACE"))
			{
				// attack when key is pressed
				this.loadGraphic(this.getAttack(), false, false);
				velocity.x = -400;
				sP = true;
			}

			super.update();
		}
	}
}