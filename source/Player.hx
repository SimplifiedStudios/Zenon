package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	var walkingValue = 10;
	var jumpingValue = 120;
	var existingCharacter = false;

	public var isGrounded = false;

	public function new(?scaleOfPlayer:Int, ?colorOfPlayer:FlxColor)
	{
		super();
		if (scaleOfPlayer != null)
		{
			makePlayer(scaleOfPlayer, colorOfPlayer);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		characterController();
	}

	function characterController()
	{
		if (FlxG.keys.anyPressed([FlxKey.LEFT]))
		{
			x -= walkingValue;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT]))
		{
			x += walkingValue;
		}

		if (FlxG.keys.anyPressed([FlxKey.SPACE]))
		{
			if (isGrounded)
			{
				y -= jumpingValue;
				isGrounded = false;
			}
		}

		if (isGrounded == false)
		{
			if (existingCharacter)
			{
				acceleration.y = 250;
			}
		}
	}

	public function modifyMovement(newWalk:Int, newJump:Int)
	{
		walkingValue = newWalk;
		jumpingValue = newJump;
	}

	public function makePlayer(scale:Int, color:FlxColor)
	{
		makeGraphic(scale, scale, color);
		acceleration.y = 250;
		existingCharacter = true;
	}
}
