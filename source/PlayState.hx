package;

import flixel.FlxState;
import entities.player.Player;
import flixel.FlxG;
import cutscene.CutsceneState;

class PlayState extends FlxState
{

	///var World:World;

	override public function create():Void
	{
		//World = new World();
		super.create();
		var player = new Player(5,5);
		add(player);
		FlxG.switchState(new CutsceneState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
