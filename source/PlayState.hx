package;

import flixel.FlxState;
import entities.items.Item;
import entities.player.Player;
import flixel.FlxG;
import cutscene.CutsceneState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{

	var World:World;
	var Player:Player;
	var GrpItems:FlxTypedGroup<Item>;

	override public function create():Void
	{
		World = new World();
		add(World);

		Player = new Player(1, 1);
		add(Player);
		FlxG.camera.follow(Player, TOPDOWN, 1);

		GrpItems = new FlxTypedGroup();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	function placeEntity(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if(entityName == "player")
		{
			Player.x = x;
			Player.y = y;
		}
	}

	function playerTouchItem(P:Player, I:Item):Void
	{
		if(P.alive && P.exists && I.alive && I.exists)
		{
			I.kill();
		}
	}

}