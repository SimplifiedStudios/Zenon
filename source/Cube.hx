package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Cube extends FlxSprite
{
	public var isGrounded = false;

	var existingCharacter = false;

	//* Grabbing
	public var isGrabbed = false; // The start of our grabbing system

	var grabbedSprite:FlxSprite;

	public function new()
	{
		super();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (isGrounded == false)
		{
			if (existingCharacter)
			{
				if (isGrabbed == false)
				{
					acceleration.y = 250;
				}
			}
		}

		if (isGrabbed)
		{
			x = grabbedSprite.x + 100;
			y = grabbedSprite.y - 100;
		}
	}

	public function makeCube(scale:Int, color:FlxColor)
	{
		makeGraphic(scale, scale, color);
		existingCharacter = true;
	}

	public function grabOnto(Object:FlxSprite)
	{
		grabbedSprite = Object;
		isGrabbed = true;
	}

	public function drop()
	{
		isGrabbed = false;
		grabbedSprite = null;
	}
}
