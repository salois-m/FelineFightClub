package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michael Salois
	 */
	public class Npc extends FlxSprite 
	{
		[Embed(source = "blackcat.png")]
		private var PlayerImage:Class;
		public var counter:Number = 0;
		
		public function Npc() 
		{
			super(FlxG.width*0.6, FlxG.height-300, PlayerImage);
			
		}
		
		override public function update():void
		{
			counter += FlxG.elapsed;
			if (counter < 0.25)
				velocity.x = -75;
			else if (counter < 0.5)
				velocity.x = 75;
			else 
				if(counter>0.5)
				counter = 0;
			
			super.update();
		}
	}

}