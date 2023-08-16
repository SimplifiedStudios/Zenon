package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	// Player
	var player:Player;

	// Map
	var map:FlxSpriteGroup = new FlxSpriteGroup();
	var ground:CustomSprite;
	var platform:CustomSprite;
	var platform1:CustomSprite;

	override public function create()
	{
		player = new Player(50, FlxColor.WHITE);
		add(player);

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
		platform1.forceYPosition();
		add(platform1);

		map.add(platform);

		add(map);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		collisionsController();
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
	}
}
