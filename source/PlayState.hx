package;

import flixel.FlxState;
import entities.items.*;
import entities.player.Player;
import entities.animals.*;
import entities.scenery.*;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import cutscene.CutsceneState;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

class PlayState extends FlxState
{

	var World:World;
	var HUD:HUD;
	var Player:Player;
	var animals:FlxSpriteGroup;
	var scenery:FlxSpriteGroup;
	var GrpItems:FlxSpriteGroup;

	override public function create():Void
	{
		this.World = new World();
		add(World);

		var tree = new Trunk(1,4, World);
		var leaves = tree.makeLeaves();
		trace("start add");
		World.addObject(tree);
		World.addObject(leaves);

		animals = new FlxSpriteGroup();
		add(animals);
		var wolf = new Wolf(5,4, this.World);
		animals.add(wolf);
		var squirrel = new Squirrel(1,1,this.World);
		animals.add(squirrel);

		GrpItems = new FlxSpriteGroup();
		add(GrpItems);
		var stick = new Stick(6,6);
		GrpItems.add(stick);

		Player = new Player(2, 2, this.World);
		add(Player);
		FlxG.camera.follow(Player, TOPDOWN, 1);

		add(World.Foreground);

		HUD = new HUD(Player);
		add(HUD);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.SPACE){
			var sameTileAnimals = animals.members.filter(function(s:FlxSprite):Bool{
				var a = cast(s,Animal);
				return (a.worldx == Player.worldx) && (a.worldy == Player.worldy);
			});
			for(a in sameTileAnimals){
				var an = cast(a,Animal);
				if(an.scritchable) an.scritch(this);
			}
		}
		if(FlxG.keys.justPressed.R){
			var nearbyAnimals = animals.members.filter(function(s:FlxSprite):Bool{
				var a = cast(s,Animal);
				var dist = Math.abs(a.worldx - Player.worldx) + Math.abs(a.worldy - Player.worldy);
				return dist < 25 && Std.is(a,Wolf);
			});
			for(a in nearbyAnimals){
				var w = cast(a,Wolf);
				w.walkTo(Player.worldx,Player.worldy);
			}
		}
		FlxG.overlap(Player, GrpItems, playerTouchItem);
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
			Player.Bag.GiveItem(I.ItemType, 1);
			I.kill();
			GrpItems.forEachDead(removeItemFromGrp);
		}
	}

	function removeItemFromGrp(i:FlxSprite)
	{
		i.destroy();
	}

	public function getPlayer():Player
	{
		return Player;
	}

}