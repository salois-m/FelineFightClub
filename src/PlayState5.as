  package
{
	import mx.core.FlexSprite;
	import org.flixel.*;

	/**
	 * PlayState class
	 * @author KittenMittens
	 * @version 1.0
	 * 4/5/14
	 */
	public class PlayState5 extends FlxState 
	{	
		// prompts
		[Embed(source = "../assets/Prompt.png")]
		private var Prompt:Class;
		[Embed(source = "../assets/WinPrompt.png")]
		private var WinPrompt:Class;
		[Embed(source = "../assets/LosePrompt.png")]
		private var LosePrompt:Class;
		[Embed(source = "../assets/TooSoonWarning.png")]
		private var TooSoonPrompt:Class;
		
		// create a class for Ring.png
		[Embed(source = "../assets/Volcano.png")]
		private var volcano:Class;
		
		private var player:Player;
		private var npc:Npc;
		public static var collision:Boolean;
		private var timeSaver:FlxSave;
		private var actionSaver:FlxSave;
		private var counter:Number = 0;
		private var timer:FlxText;
		private var newMenuTimer:Number = 0;
		private var falseStart:FlxText;
		private var getReady:FlxText;
		private var npcReaction:Number = .17;
		private var delaytime:Number;
		private var delayset:Boolean = false;
		private var userTime:Number;
		var prompt:FlxSprite = new FlxSprite(310, 50, Prompt);
		var winPrompt:FlxSprite = new FlxSprite(310, 50, WinPrompt);
		var losePrompt:FlxSprite = new FlxSprite(310, 50, LosePrompt);
		var toosoonPrompt:FlxSprite = new FlxSprite(310, 135, TooSoonPrompt);

		// override create function in super class
		// change state of game
		override public function create():void
		{			
			// create flixel sprite for ring
			var ring:FlxSprite = new FlxSprite(0, 0, volcano);
			// display ring in game
			add(ring);
			
			//prepare the FlxSaves
			actionSaver = new FlxSave();
			actionSaver.bind("Stage4Attacked");
			
			timeSaver = new FlxSave()
			timeSaver.bind("Stage4Time");
			
			//adds in players character
			player = new Player();
			add(player);
			
			//adds in Npc character
			npc = new Npc();
			add(npc);
			
			//sets the delay time.
			while(delayset == false) {
				delaytime = Math.random() * 8;
				if (delaytime > 2) {
					delayset = true;
				}
			}
			
			//texts that says to get ready
			getReady = new FlxText(350, 300, 500, "GET READY!", false);	
			add(getReady);
			
			//creates display of timer that keeps track of elapsed time since PlayState started.
			//When space is pressed it then displays your reaction time.
			timer = new FlxText(350, 320, 300, String(counter), false);
			add(timer);
			timer.exists = false;
			
			//adds text to display when player reacts too soon.
			falseStart = new FlxText(350, 300, 300, "TOO SOON", false);	
			add(falseStart);
			falseStart.exists = false;
		}

		override public function update(): void
		{
			if (counter > delaytime){
				getReady.exists = false;
				add(prompt);
			}
			
			//if player hits space too soon then automatically loses.
			if (player.sP == true && (counter < delaytime)) {
				getReady.exists = false;
				falseStart.exists = true;
				add(toosoonPrompt);
				newMenuTimer += FlxG.elapsed;
				if (newMenuTimer > (counter + 2))
					FlxG.switchState(new EndState);
			}
			//counter stops counting and gives its value to reactionTime
			//timer then uses reactinTime instead of counter to display
			//time.  only happens if player reacts in appropriate time window
			//will need changing when code to determine winner is written
			else if (player.sP == true && (counter >= delaytime)) {
				actionSaver.data.DidAttack = true; //save the fact that space was placed
				userTime = (counter - delaytime);
				timer.text = String(userTime).slice(0, 4);
				timeSaver.data.Time = userTime; //save the reaction time
				newMenuTimer += FlxG.elapsed;
				timer.exists = true;
				if((counter - delaytime)<=npcReaction){
					add(winPrompt);
					if (newMenuTimer > (counter + 3.5)) {
						timeSaver.flush();
						actionSaver.flush();
						FlxG.switchState(new EndState);
					}
				}
				else {	
					add(losePrompt);
					if (newMenuTimer > (counter + 3.5)){
						timeSaver.flush();
						actionSaver.flush();
						FlxG.switchState(new EndState);	
					}
				}
			}
			//updates counter until space is pressed.
			else {
				counter += FlxG.elapsed;
				newMenuTimer += FlxG.elapsed;
				timer.text = String(counter);
			}
			
			//If a collision(due to player pressing space) is detected then goes back to MenuState
			collision = FlxG.collide(player, npc);
			
			super.update();
		}
	}
}