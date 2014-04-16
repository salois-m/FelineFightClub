package    
{
	import flash.media.Sound;
	import org.flixel.*;
	/**
	 * Character Selection Class
	 * @author KittenMittens
	 * @version 1.0
	 * 4/6/14
	 */
	public class CharacterSelectState extends FlxState
	{	
		[Embed(source="../assets/CharacterSelect.mp3")]
		private var BackgroundSound:Class;		
		
		// CharacterMenu
		[Embed(source = "../assets/CharacterMenu.png")]
		private var Character:Class;
		// back & next buttons
		[Embed(source = "../assets/backbutton.png")]
		private var Back:Class;
		[Embed(source = "../assets/nextbutton.png")]
		private var Next:Class;
		// FastCat
		[Embed(source = "../assets/FastCatCube.png")]
		private var FastCube:Class;
		[Embed(source = "../assets/FastCatChosen.png")]
		private var FastChosen:Class;
		[Embed(source = "../assets/Cat2Use.png")]
		private var FastCat:Class;
		[Embed(source = "../assets/Cat2UseAttack.png")]
		private var FastCatAttack:Class;
		// 4Arms
		[Embed(source = "../assets/4ArmsCube.png")]
		private var FourCube:Class;
		[Embed(source = "../assets/4ArmsChosen.png")]
		private var FourChosen:Class;
		[Embed(source = "../assets/Cat4arms.png")]
		private var FourArms:Class;
		[Embed(source = "../assets/Cat4armsAttack.png")]
		private var FourArmsAttack:Class;
		// HairBall
		[Embed(source = "../assets/HairBallCube.png")]
		private var HairCube:Class;
		[Embed(source = "../assets/HairBallChosen.png")]
		private var HairChosen:Class;
		[Embed(source = "../assets/blackcat.png")]
		private var HairBall:Class;
		[Embed(source = "../assets/blackcatAttack.png")]
		private var HairBallAttack:Class;
		// KittyLitR
		[Embed(source = "../assets/KittyLitCube.png")]
		private var KittyCube:Class;
		[Embed(source = "../assets/KittyLitChosen.png")]
		private var KittyChosen:Class;
		[Embed(source = "../assets/fatcat.png")]
		private var KittyLitR:Class;
		[Embed(source = "../assets/fatcatAttack.png")]
		private var KittyLitRAttack:Class;
		
		// back & next button
		private var backButton:FlxButton;
		private var nextButton:FlxButton;
		// buttons for cats
		private var FastCatButton:FlxButton;
		private var FourArmsButton:FlxButton;
		private var HairBallButton:FlxButton;
		private var KittyLitRButton:FlxButton;
		// chosen character for player
		public static var playerChosen:Class;
		// chosen character's attack
		public static var playerAttack:Class;
		
		// override create function in super class
		// change state of game
		override public function create():void
		{
			var sound:FlxSound = FlxG.play(BackgroundSound);
			
			// create flixel sprite for CharacterMenu
			var charMenu:FlxSprite = new FlxSprite(0, 0, Character);
			add(charMenu);
			
			// allocate a back button object and call goBack on click			
			backButton = new FlxButton(30, 530, null, goBack);
			backButton.loadGraphic(Back, false, false, 157, 61);
			add(backButton);
			
			// allocate a next button object and call toNext on click			
			nextButton = new FlxButton(610, 530, null, toNext);
			nextButton.loadGraphic(Next, false, false, 157, 61);
			
			// allocate a FastCat button object and call getFastCat on click			
			FastCatButton = new FlxButton(212, 190, null, getFastCat);
			FastCatButton.loadGraphic(FastCube, false, false, 186, 186);
			add(FastCatButton);
			
			// allocate a FourArms button object and call getFourArms on click			
			FourArmsButton = new FlxButton(398, 190, null, getFourArms);
			FourArmsButton.loadGraphic(FourCube, false, false, 186, 186);
			add(FourArmsButton);
			
			// allocate a HairBall button object and call getHairBall on click			
			HairBallButton = new FlxButton(212, 376, null, getHairBall);
			HairBallButton.loadGraphic(HairCube, false, false, 186, 186);
			add(HairBallButton);
			
			// allocate a KittyLit button object and call getKittyLitR on click			
			KittyLitRButton = new FlxButton(398, 376, null, getKittyLitR);
			KittyLitRButton.loadGraphic(KittyCube, false, false, 186, 186);
			add(KittyLitRButton);
		}
		
		// switch state when called
		private function goBack():void {FlxG.switchState(new MenuState);}
		
		// switch state when called
		private function toNext():void {FlxG.mouse.hide();FlxG.switchState(new PlayState);}
		
		// player has chosen FastCat
		public function getFastCat():void
		{
			// update buttons
			FastCatButton.loadGraphic(FastChosen, false, false, 186, 186);
			FourArmsButton.loadGraphic(FourCube, false, false, 186, 186);
			HairBallButton.loadGraphic(HairCube, false, false, 186, 186);
			KittyLitRButton.loadGraphic(KittyCube, false, false, 186, 186);
			// store in class variable
			playerChosen = FastCat;
			playerAttack = FastCatAttack;
			add(nextButton);
		}
		
		// player has chosen FourArms
		public function getFourArms():void
		{
			// update buttons
			FastCatButton.loadGraphic(FastCube, false, false, 186, 186);
			FourArmsButton.loadGraphic(FourChosen, false, false, 186, 186);
			HairBallButton.loadGraphic(HairCube, false, false, 186, 186);
			KittyLitRButton.loadGraphic(KittyCube, false, false, 186, 186);
			// store in class variable
			playerChosen = FourArms;
			playerAttack = FourArmsAttack;
			add(nextButton);
		}
		
		// player has chosen HairBall
		public function getHairBall():void
		{
			// update buttons
			FastCatButton.loadGraphic(FastCube, false, false, 186, 186);
			FourArmsButton.loadGraphic(FourCube, false, false, 186, 186);
			HairBallButton.loadGraphic(HairChosen, false, false, 186, 186);
			KittyLitRButton.loadGraphic(KittyCube, false, false, 186, 186);
			// store in class variable
			playerChosen = HairBall;
			playerAttack = HairBallAttack;
			add(nextButton);
		}
		
		// player has chosen KittyLitR
		public function getKittyLitR():void
		{
			// update buttons
			FastCatButton.loadGraphic(FastCube, false, false, 186, 186);
			FourArmsButton.loadGraphic(FourCube, false, false, 186, 186);
			HairBallButton.loadGraphic(HairCube, false, false, 186, 186);
			KittyLitRButton.loadGraphic(KittyChosen, false, false, 186, 186);
			// store in class variables
			playerChosen = KittyLitR;
			playerAttack = KittyLitRAttack;
			add(nextButton);
		}
	}
}