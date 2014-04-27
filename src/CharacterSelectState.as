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
		[Embed(source = "../assets/BaneCat.png")]
		private var FastCat:Class;
		[Embed(source = "../assets/BaneCatAttack.png")]
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
		// saves (get cleared)
		// T = time, D = did win.
		private var resetStage1T:FlxSave; 
		private var resetStage2T:FlxSave;
		private var resetStage3T:FlxSave; 
		private var resetStage4T:FlxSave;
		private var resetStage5T:FlxSave;
		private var resetStage1D:FlxSave; 
		private var resetStage2D:FlxSave;
		private var resetStage3D:FlxSave; 
		private var resetStage4D:FlxSave;
		private var resetStage5D:FlxSave;
		// chosen character for player
		public static var playerChosen:Class;
		// chosen character's attack
		public static var playerAttack:Class;
		
		// override create function in super class
		// change state of game
		override public function create():void
		{
			// create flixel sprite for CharacterMenu
			var charMenu:FlxSprite = new FlxSprite(0, 0, Character);
			add(charMenu);
			
			this.clearSaves();
			
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
		
		//Character Select screen resets all of the last sessions' scores
		//here in case the game was last closed in the middle of a session.
		//flushing conforms the save.
		private function clearSaves():void {
			
			resetStage1T = new FlxSave();
			resetStage1T.bind("Stage1Time");
			resetStage1T.data.Time = 0.00;
			resetStage1T.flush();
			
			resetStage1D = new FlxSave();
			resetStage1D.bind("Stage1Attacked");
			resetStage1D.data.DidAttack = false;
			resetStage1D.flush();
			
			resetStage2T = new FlxSave();
			resetStage2T.bind("Stage2Time");
			resetStage2T.data.Time = 0.00;
			resetStage2T.flush();
			
			resetStage2D = new FlxSave();
			resetStage2D.bind("Stage2Attacked");
			resetStage2D.data.DidAttack = false;
			resetStage2D.flush();
			
			resetStage3T = new FlxSave();
			resetStage3T.bind("Stage3Time");
			resetStage3T.data.Time = 0.00;
			resetStage3T.flush();
			
			resetStage3D = new FlxSave();
			resetStage3D.bind("Stage3Attacked");
			resetStage3D.data.DidAttack = false;
			resetStage3D.flush();
			
			resetStage4T = new FlxSave();
			resetStage4T.bind("Stage4Time");
			resetStage4T.data.Time = 0.00;
			resetStage4T.flush();
			
			resetStage4D = new FlxSave();
			resetStage4D.bind("Stage4Attacked");
			resetStage4D.data.DidAttack = false;
			resetStage1D.flush();
			
			resetStage5T = new FlxSave();
			resetStage5T.bind("Stage5Time");
			resetStage5T.data.Time = 0.00;
			resetStage5T.flush();
			
			resetStage5D = new FlxSave();
			resetStage5D.bind("Stage5Attacked");
			resetStage5D.data.DidAttack = false;
			resetStage5D.flush();
		}
		
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