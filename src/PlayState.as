<<<<<<< HEAD
  package
=======
package  
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
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
<<<<<<< HEAD

		[Embed(source = "../assets/11-bout-theme.mp3")]
		private var BackgroundSound:Class;
		
=======
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
		// create a class for Ring.png
		[Embed(source = "../assets/Ring.png")]
		private var Ring:Class;
		
		private var player:Player;
		private var npc:Npc;
		public static var collision:Boolean;
<<<<<<< HEAD
		private var counter:Number = 0;
		private var timer:FlxText;
		private var reactionTime:Number;
		private var lose:FlxText;
		private var win:FlxText;
		private var falseStart:FlxText;
		private var npcReaction:Number = 4;
=======
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be

		// override create function in super class
		// change state of game
		override public function create():void
		{
<<<<<<< HEAD
			var sound:FlxSound = FlxG.play(BackgroundSound);
			
=======
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
			// create flixel sprite for ring
			var ring:FlxSprite = new FlxSprite(0, 0, Ring);
			// display ring in game
			add(ring);

<<<<<<< HEAD
			//adds in players character
			player = new Player();
			add(player);
			
			//adds in Npc character
			npc = new Npc();
			add(npc);
			
			//creates display of timer that keeps track of elapsed time since PlayState started.
			//When space is pressed it then displays your reaction time.
			timer = new FlxText(1, 1, 400, String(counter), false);
			add(timer);
			
			//adds text to display when player reacts too soon.
			falseStart = new FlxText(300, 300, 500, "TOO SOON", false);	
			add(falseStart);
			falseStart.exists = false;
			
			//adds text to display when player loses.
			lose = new FlxText(300, 300, 500, "YOU LOSE", false);	
			add(lose);
			lose.exists = false;
			
			
			//adds text to display when player wins
			win = new FlxText(300, 300, 500, "YOU WIN", false);	
			add(win);
			win.exists = false;
=======
			player = new Player();
			add(player);

			npc = new Npc();
			add(npc);
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be
		}

		override public function update(): void
		{
<<<<<<< HEAD
			//if player hits space too soon then automatically loses.
			if (player.sP == true && (counter < 2.5)) {
				falseStart.exists = true;
			}
			//counter stops counting and gives its value to reactionTime
			//timer then uses reactinTime instead of counter to display
			//time.  only happens if player reacts in appropriate time window
			//will need changing when code to determine winner is written
			else if (player.sP == true && (counter >= 2.5)) {
				reactionTime = counter;
				timer.text = String(reactionTime);
				if(reactionTime<=npcReaction)
					win.exists = true;
				else
					lose.exists = true;
			}
			//updates counter until space is pressed.
			else {
				counter += FlxG.elapsed;
				timer.text = String(counter);
			}
			
			//If a collision(due to player pressing space) is detected then goes back to MenuState
			collision = FlxG.collide(player, npc);
			if (collision == true) {
					//FlxG.switchState(new MenuState);
			}
=======
			collision=FlxG.collide(player, npc);
>>>>>>> ac372ecf20c541c78e632247da91e6f8cc2801be

			super.update();
		}
	}
}