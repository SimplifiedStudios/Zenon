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
import objects.Cube;
import objects.Player;

class PlayState extends FlxState
{
	// * Physics Controller
	var player:Player;
	var weightCube:Cube;
	// var gravityCube:Cube;
	var cameraCube:FlxSprite;
	var isGrounded = false;

	// * Map Sprites
	var Map:FlxSpriteGroup;
	var ground:FlxSprite;

	override public function create()
	{
		super.create();

		player = new Player();
		player.create(50, FlxColor.WHITE);
		player.acceleration.y = 250;
		player.screenCenter();
		add(player);

		Map = new FlxSpriteGroup();

		weightCube = new Cube();
		weightCube.create(FlxColor.BLUE);
		add(weightCube);

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
