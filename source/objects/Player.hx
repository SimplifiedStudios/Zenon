package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public function new()
	{
		super();
	}

	public override function update(elapsed:Float)
	{
		if (FlxG.keys.anyPressed([FlxKey.SPACE]))
		{
			y -= 69;
		}

		if (FlxG.keys.anyPressed([FlxKey.A]))
		{
			x -= 10;
		}

		if (FlxG.keys.anyPressed([FlxKey.D]))
		{
			x += 10;
		}

		super.update(elapsed);
	}

	public function create(scale, color)
	{
		makeGraphic(scale, scale, color);
	}
}
