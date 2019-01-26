package;

import flixel.FlxState;
import entities.items.Item;
import entities.player.Player;
import entities.animals.*;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import cutscene.CutsceneState;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

class PlayState extends FlxState
{

	//var World:World;
	var Player:Player;
	var animals:FlxSpriteGroup;
	var GrpItems:FlxTypedGroup<Item>;

	override public function create():Void
	{
		//World = new World();
		//add(World.getTileLayers());

		Player = new Player(5, 5);
		add(Player);

		animals = new FlxSpriteGroup();
		add(animals);
		var wolf = new Wolf(8,8);
		animals.add(wolf);
		FlxG.camera.follow(Player, TOPDOWN, 1);

		GrpItems = new FlxTypedGroup();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE){
			var nearbyAnimals = animals.members.filter(function(s:FlxSprite):Bool{
				var a = cast(s,Animal);
				return (a.worldx == Player.worldx) && (a.worldy == Player.worldy);
			});
			for(a in nearbyAnimals){
				var an = cast(a,Animal);
				if(an.scritchable) an.scritch(this);
			}
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