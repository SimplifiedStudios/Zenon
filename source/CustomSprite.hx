package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class CustomSprite extends FlxSprite
{
	var forcingPosition = [false, false];
	var forcingYValue:Float = 0;
	var forcingXValue:Float = 0;

	public function new()
	{
		super();
	}

	public function forceYPosition()
	{
		forcingPosition[0] = true;
		forcingYValue = y;
	}

	public function forceXPosition()
	{
		forcingPosition[1] = true;
		forcingXValue = x;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (forcingPosition[0])
		{
			y = forcingYValue;
		}

		if (forcingPosition[1])
		{
			x = forcingXValue;
		}
	}
}
