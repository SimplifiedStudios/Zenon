package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import levels.PhysicsLabs;

class PlayState extends FlxState
{
	// Player
	var player:Player;
	var weightCube:Cube;

	// Map
	var map:FlxSpriteGroup = new FlxSpriteGroup();
	var ground:CustomSprite;
	var platform:CustomSprite;
	var platform1:CustomSprite;

	// * Menu Options
	var play:CustomSprite;

	override public function create()
	{
		player = new Player(50, FlxColor.WHITE);
		add(player.playerText); // This will add the name tag to the player indicating the player is you dumbass
		add(player);

		weightCube = new Cube();
		weightCube.makeCube(50, FlxColor.BLUE);
		add(weightCube);

		play = new CustomSprite();
		play.makeGraphic(100, 100, FlxColor.RED);
		play.screenCenter();
		play.x -= 300;
		play.forceXPosition();
		play.forceYPosition();
		add(play);

		ground = new CustomSprite();
		ground.makeGraphic(FlxG.width - 10, 30, FlxColor.GRAY);
		ground.y = 600;
		ground.screenCenter(X);
		ground.forceYPosition();
		ground.forceXPosition();
		ground.screenCenter(X);
		map.add(ground);

		platform = new CustomSprite();
		platform.makeGraphic(300, 30, FlxColor.GRAY);
		platform.y = 500;
		platform.x += 300;
		platform.forceYPosition();
		platform.forceXPosition();

		platform1 = new CustomSprite();
		platform1.makeGraphic(300, 30, FlxColor.GRAY);
		platform1.y = 500;
		platform1.screenCenter(X);
		platform1.x += 300;
		platform1.forceYPosition();
		platform1.forceXPosition();
		add(platform1);

		map.add(platform);

		add(map);

		// Main menu texts
		var title = new FlxText(0, 50, "Zenon", 32);
		title.screenCenter(X);
		add(title);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		collisionsController();
		objectPickupController();
	}

	public function objectPickupController()
	{
		if (FlxG.keys.anyPressed([FlxKey.Q]))
		{
			if (player.objectGrabbed != null)
			{
				player.objectGrabbed.drop();
			}
		}

		FlxG.overlap(player, weightCube, function(obj:FlxSprite, oobj:Cube)
		{
			if (FlxG.keys.anyPressed([FlxKey.E]))
			{
				weightCube.grabOnto(player);
				player.objectGrabbed = weightCube;
			}
		});
	}

	public function collisionsController()
	{
		FlxG.collide(player, ground, function(obj:FlxSprite, oobj:FlxSprite)
		{
			player.acceleration.y = 0;
			player.isGrounded = true;
		});

		FlxG.collide(player, platform, function(obj:FlxSprite, oobj:FlxSprite)
		{
			player.acceleration.y = 0;
			player.isGrounded = true;
		});

		FlxG.collide(player, platform1, function(obj:FlxSprite, oobj:FlxSprite)
		{
			player.acceleration.y = 0;
			player.isGrounded = true;
		});

		FlxG.collide(weightCube, ground, function(obj:FlxSprite, oobj:FlxSprite)
		{
			weightCube.acceleration.y = 0;
			weightCube.isGrounded = true;
		});

		FlxG.overlap(player, play, function(obj:FlxSprite, obj1:FlxSprite)
		{
			FlxG.switchState(new LevelLoader("Physics Labs", new PhysicsLab()));
		});
	}
}
