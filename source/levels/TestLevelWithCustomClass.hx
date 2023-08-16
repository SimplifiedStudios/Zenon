package levels;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class TestLevelWithCustomClass extends FlxState
{
	// * Physics Controller
	var player:FlxSprite;
	var weightCube:Cube;
	// var gravityCube:Cube;
	var cameraCube:Cube;
	var isGrounded = false;

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

		weightCube = new Cube(50, FlxColor.BLUE);
		weightCube.screenCenter();
		Map.add(weightCube);

		ground = new FlxSprite();
		ground.makeGraphic(FlxG.width - 50, 30, FlxColor.GRAY);
		ground.screenCenter(X);
		ground.y = 600;
		Map.add(ground);

		add(Map);
	}

	public function groundCollision(Obj1:FlxSprite, Obj2:FlxSprite)
	{
		Obj1.acceleration.y = 0;
		isGrounded = true;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		ground.y = 600;

		collisionController();
		playerController();
	}

	public function collisionController()
	{
		FlxG.collide(player, ground, groundCollision);
		FlxG.collide(weightCube, ground, groundCollision);
	}

	public function playerController()
	{
		if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
		{
			if (isGrounded)
			{
				player.y -= 69;
				isGrounded = false;
			}
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
