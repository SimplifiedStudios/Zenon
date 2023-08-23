package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class LevelLoader extends FlxState
{
	var loadingName = null;
	var loadingState:FlxState = new PlayState();
	var instantiatedObjects = false;
	var funny = 0;

	public function new(levelName:String, LoadedState:FlxState)
	{
		super();
		loadingName = levelName;
		loadingState = LoadedState;
	}

	override public function create()
	{
		super.create();

		var LoadingText = new FlxText(0, 0, "LOADING", 32);
		LoadingText.screenCenter();
		add(LoadingText);

		var LoadingTextDesc = new FlxText(0, 0, loadingName, 16);
		LoadingTextDesc.screenCenter();
		LoadingTextDesc.x += 30;
		LoadingTextDesc.y += 30;
		add(LoadingTextDesc);

		instantiatedObjects = false;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (funny == 100)
		{
			instantiatedObjects = false;

			Sys.sleep(2);

			FlxG.switchState(loadingState);
		}

		funny++;
	}
}
