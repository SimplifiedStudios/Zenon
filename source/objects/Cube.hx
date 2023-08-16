package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Cube extends FlxSprite
{
	public var isGrabbed = false;

	public function new()
	{
		acceleration.y = 150;
		super();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public function create(color:FlxColor)
	{
		makeGraphic(50, 50, color);
	}
}
