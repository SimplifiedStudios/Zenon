package levels;

import Cube;
import CustomSprite;
import Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PhysicsLab extends FlxState
{
	// * Physics Labs is one of the many planned levels for Zenon. Physics Labs will be just a basic world where you are in a lab testing Cubes. Boring Life huh?
	var player:Player;
	var ground:CustomSprite;
	var platform:CustomSprite;

	// * Cubes
	var transportationCube:Cube;
	var recieverCube:Cube;
	var weightCube:Cube;
	var absorbCube:Cube;
	var finishLevel:Cube;

	var title:FlxText;

	override public function create()
	{
		super.create();
		player = new Player(50, FlxColor.WHITE);
		add(player);

		ground = new CustomSprite();
		ground.makeGraphic(FlxG.width, 30, FlxColor.GRAY);
		ground.screenCenter(X);
		ground.y = 600;
		ground.forceXPosition();
		ground.forceYPosition();
		add(ground);

		platform = new CustomSprite();
		platform.makeGraphic(300, 30, FlxColor.GRAY);
		platform.screenCenter();
		platform.forceXPosition();
		platform.forceYPosition();
		add(platform);

		transportationCube = new Cube();
		transportationCube.makeCube(50, FlxColor.PURPLE);
		transportationCube.screenCenter();
		transportationCube.y += 100;
		add(transportationCube);

		recieverCube = new Cube();
		recieverCube.makeCube(50, FlxColor.PINK);
		recieverCube.screenCenter();
		recieverCube.y -= 100;
		add(recieverCube);

		weightCube = new Cube();
		weightCube.makeCube(50, FlxColor.BLUE);
		weightCube.x = 100;
		add(weightCube);

		absorbCube = new Cube();
		absorbCube.makeCube(100, FlxColor.RED);
		absorbCube.acceleration.y = 0;
		absorbCube.screenCenter();
		absorbCube.x += 300;
		add(absorbCube);

		finishLevel = new Cube();
		finishLevel.makeCube(50, FlxColor.CYAN);
		finishLevel.x += 300;

		title = new FlxText(0, 50, "Physics Lab", 24);
		title.screenCenter(X);
		add(title);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		keybindController();
		collisionManager();
	}

	public function keybindController()
	{
		if (FlxG.keys.anyPressed([FlxKey.Q]))
		{
			if (weightCube.isGrabbed)
			{
				weightCube.drop();
			}
		}
	}

	public function collisionManager()
	{
		FlxG.collide(player, ground, function(playerNew:FlxSprite, groundNew:FlxSprite)
		{
			player.acceleration.y = 0;
			player.isGrounded = true;
		});

		FlxG.collide(player, platform, function(obj:FlxSprite, obj1:FlxSprite)
		{
			player.acceleration.y = 0;
			player.isGrounded = true;
		});

		FlxG.collide(recieverCube, platform, function(obj:FlxSprite, oobj:FlxSprite)
		{
			recieverCube.acceleration.y = 0;
			recieverCube.isGrounded = true;
		});

		FlxG.collide(transportationCube, ground, function(obj:FlxSprite, oobj:FlxSprite)
		{
			transportationCube.acceleration.y = 0;
			transportationCube.isGrounded = true;
		});

		FlxG.collide(weightCube, ground, function(obj:FlxSprite, obj1:FlxSprite)
		{
			weightCube.acceleration.y = 0;
			weightCube.isGrounded = true;
		});

		FlxG.collide(weightCube, platform, function(obj:FlxSprite, oobj:FlxSprite)
		{
			weightCube.acceleration.y = 0;
		}); // * Grab onto cube

		FlxG.overlap(player, weightCube, function(obj:FlxSprite, oobj:FlxSprite)
		{
			if (FlxG.keys.anyPressed([FlxKey.E]))
			{
				weightCube.grabOnto(player);
			}
		});

		// * Teleport

		FlxG.collide(absorbCube, ground, function(obj:FlxSprite, oobj:FlxSprite)
		{
			absorbCube.acceleration.y = 0;
			absorbCube.isGrounded = true;
		});

		FlxG.overlap(player, transportationCube, function(obj:FlxSprite, oobj:FlxSprite)
		{
			player.x = recieverCube.x;
			player.y = recieverCube.y;
		});

		FlxG.overlap(weightCube, absorbCube, function(obj:FlxSprite, oobj:FlxSprite)
		{
			weightCube.destroy();
			absorbCube.color = FlxColor.GREEN;
			add(finishLevel);
		});

		FlxG.collide(finishLevel, ground, function(obj:FlxSprite, oobj:FlxSprite)
		{
			finishLevel.acceleration.y = 0;
			finishLevel.isGrounded = true;
		});

		FlxG.overlap(player, finishLevel, function(obj:FlxSprite, oobj:FlxSprite)
		{
			FlxG.switchState(new LevelLoader("Main Menu", new PlayState()));
		});
	}
}
