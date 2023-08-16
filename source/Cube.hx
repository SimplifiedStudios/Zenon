package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Cube extends FlxSprite
{
	public function new(scale:Int, color:FlxColor)
	{
		makeGraphic(scale, scale, color);
		super();
	}
}
