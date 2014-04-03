package  
{
	import org.flixel.*;
	
	/**
	 * PlayState class
	 * @author KittenMittens
	 * @version 1.0
	 * 3/23/14
	 */
	public class PlayState extends FlxState 
	{
		// create a class for Ring.png
		[Embed(source = "Ring.png")]
		private var Ring:Class;
		
		private var player:Player;
		private var npc:Npc;
		
		// override create function in super class
		// change state of game
		override public function create():void
		{
			// create flixel sprite for ring
			var ring:FlxSprite = new FlxSprite(0, 0, Ring);
			// display ring in game
			add(ring);
			
			player = new Player();
			add(player);
			
			npc = new Npc();
			add(npc);
		}
		
		override public function update(): void
		{
		//if (FlxG.keys.SPACE)
			
		super.update();
		}

	}
}