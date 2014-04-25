package
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class Level extends FlxState
	{
		var level:int;
		var catReactionTime:Number;
		
		catReactionTime = this.setAIReaction(level);
		
		public function setAIReaction(int:Level):Number
		{			
			var minReacttime:Number;
			var maxReacttime:Number;
			var generatedNumber:Number;
			var timeset:Boolean = Boolean(false);
			
			if (level >= 5)
			{
				/*
				 * Send game to end screen
				 *
				 *
				 * */
			}
			
			if (level == 1)
			{
				minReacttime = 6;
				maxReacttime = 8;
			}
			
			if (level == 2)
			{
				minReacttime = 5;
				maxReacttime = 7;
			}
			
			if (level == 3)
			{
				minReacttime = 4;
				maxReacttime = 5;
			}
			
			if (level == 4)
			{
				minReacttime = 1.5;
				maxReacttime = 3;
			}
			
			while (timeset == false)
			{
				generatedNumber = FlxU.random() * 17;
				if (generatedNumber <= maxReacttime)
				{
					if (generatedNumber >= minReacttime)
					{
						timeset = true;
					}
				}
				
			}
			
			return generatedNumber;
			
			public function nextLevel():void
			{
				level = 1 + level;
			}
			
			public function resetGame():void
			{
				level = 1;
			}
		}
	}
}