package;

import flixel.FlxState;
import entities.Player;
import entities.items.Item;
import flixel.FlxG;
import cutscene.CutsceneState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{

	///var World:World;
	var Player:Player;
	var GrpItems:FlxTypedGroup<Item>;

	override public function create():Void
	{
		//World = new World();

		Player = new Player(5,5);
		add(Player);

		GrpItems = new FlxTypedGroup();

		//FlxG.switchState(new CutsceneState());

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}