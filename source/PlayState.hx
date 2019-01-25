package;

import flixel.FlxState;

class PlayState extends FlxState
{

	var World:World;

	override public function create():Void
	{
		World = new World();
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
