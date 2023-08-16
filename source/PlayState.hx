package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	// * Physics Controller
	var player:FlxSprite;
	var weightCube:FlxSprite;
	// var gravityCube:Cube;
	var cameraCube:FlxSprite;

	// * Map Sprites
	var Map:FlxSpriteGroup;
	var ground:FlxSprite;

	override public function create()
	{
		super.create();

		player = new FlxSprite();
		player.makeGraphic(50, 50, FlxColor.WHITE);
		player.acceleration.y = 250;
		player.screenCenter();
		add(player);

		Map = new FlxSpriteGroup();

		ground = new FlxSprite();
		ground.makeGraphic(FlxG.width - 50, 30, FlxColor.GRAY);
		ground.screenCenter(X);
		ground.y = 700;
		Map.add(ground);

		add(Map);
	}

	public function groundCollision(Obj1:FlxSprite, Obj2:FlxSprite)
	{
		player.acceleration.y = 0;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		collisionController();
		playerController();
	}

	public function collisionController()
	{
		ground.y = 700;
		FlxG.collide(player, ground, groundCollision);
	}

	public function playerController()
	{
		if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
		{
			player.y -= 69;
		}

		if (FlxG.keys.anyPressed([FlxKey.A]))
		{
			player.x -= 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.D]))
		{
			player.x += 10;
		}
	}
}
