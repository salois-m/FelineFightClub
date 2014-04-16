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
		[Embed(source = "../assets/enemy.png")]
		private var PlayerImage:Class;
		
		[Embed(source = "../assets/enemyAttack.png")]
		private var PlayerAttack:Class;
		
		public var counter:Number = 0;
<<<<<<< HEAD
		public var sP:Boolean = false;

		public function Npc() 
		{
			super(FlxG.width*0.9, FlxG.height-315, PlayerImage);
=======
		public static var sP:Boolean = false;

		public function Npc() 
		{
			super(FlxG.width*0.6, FlxG.height-315, PlayerImage);
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
		}
		
		/* Use enemyAttack.png for the update method (i.e. this.loadGraphic()
		 * after a certain time for the NPC to attack the player). In loadGraphic,
		 * use 214 for width and 247 for height as the parameters.
		 * use 214 for width and 247 for height as the parameters.*/
		override public function update():void
		{
<<<<<<< HEAD
			counter += FlxG.elapsed;
			if (PlayState.collision == true) 
				velocity.x = 0;
				
			//character moves toward center of the ring for 2.5 seconds then stops
			else if (sP == false) {
				if (counter < 2.5) 
					velocity.x=-75	
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
				this.loadGraphic(PlayerAttack, false, false);
				velocity.x = -400;
				sP = true;
			}

			super.update();
		}
	}
}