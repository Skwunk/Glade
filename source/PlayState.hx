package;

import flixel.FlxState;
import entities.items.Item;
import entities.player.Player;
import entities.animals.Wolf;
import flixel.FlxG;
import cutscene.CutsceneState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{

	//var World:World;
	var Player:Player;
	var wolf:Wolf;
	var GrpItems:FlxTypedGroup<Item>;

	override public function create():Void
	{
		//World = new World();
		//add(World.getTileLayers());

		Player = new Player(5, 5);
		add(Player);
		wolf = new Wolf(5,6);
		add(wolf);
		FlxG.camera.follow(Player, TOPDOWN, 1);

		GrpItems = new FlxTypedGroup();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE){
			wolf.scritch(this);
		}
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