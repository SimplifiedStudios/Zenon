package objects;

import flixel.FlxSprite;

class CustomSprite extends FlxSprite
{
	var forcePos = false;
	var forcePosVal:Float = 0;

	public function new()
	{
		super();
	}

	public function forceYPosition(forceY:Float)
	{
		forcePosVal = forceY;
	}

	override public function update(elapsed:Float)
	{
		if (forcePos)
		{
			y = forcePosVal;
		}
	}
}
