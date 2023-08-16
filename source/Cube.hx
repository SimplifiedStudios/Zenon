package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Cube extends FlxSprite
{
	var isCarried = false;

	public function new(scale:Int, color:FlxColor)
	{
		makeGraphic(scale, scale, color);
		super();
	}
}
