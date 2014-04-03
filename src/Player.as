package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michael Salois
	 */
	public class Player extends FlxSprite 
	{
		[Embed(source = "Cat2Use.png")]
		private var PlayerImage:Class;
		public var counter:Number = 0;
		public var sP:Boolean = false;
		
		public function Player() 
		{
			super(FlxG.width*0.2, FlxG.height-300, PlayerImage);
			
		}
		
		override public function update():void
		{
			counter += FlxG.elapsed;
				
			if (sP==false) {
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
				velocity.x = 400;
				sP = true;
			}
			super.update();
		}
	}

}