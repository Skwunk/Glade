package;

import flixel.FlxState;
import flixel.FlxG;
import cutscene.CutsceneState;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		FlxG.switchState(new CutsceneState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
