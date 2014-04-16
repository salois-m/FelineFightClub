package 
{
	import org.flixel.*;
	
	// initialize flash player
	[SWF(width = "800", height = "600", backgroundColor = "0x000000")]
	
	/**
	 * Feline Fight Club
	 * @author KittenMittens
	 * @version 1.0
	 * 3/23/14
	 */
	public class Main extends FlxGame
	{
		public function Main() 
		{
			// call super constructor
			// launch playstate
			super(800, 600, MenuState, 1);
		}
	}
}