  package
{
	import org.flixel.*;

	/**
	 * PlayState class
	 * @author KittenMittens
	 * @version 1.0
	 * 4/5/14
	 */
	public class PlayState extends FlxState 
	{

		[Embed(source = "../assets/11-bout-theme.mp3")]
		private var BackgroundSound:Class;
		
		// create a class for Ring.png
		[Embed(source = "../assets/Ring.png")]
		private var Ring:Class;
		
		private var player:Player;
		private var npc:Npc;
		public static var collision:Boolean;

		// override create function in super class
		// change state of game
		override public function create():void
		{
			var sound:FlxSound = FlxG.play(BackgroundSound);
			
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
			collision=FlxG.collide(player, npc);

			super.update();
		}
	}
}