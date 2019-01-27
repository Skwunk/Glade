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
		var beaver = new Beaver(7,5,this.World);
		animals.add(beaver);


		GrpItems = new FlxSpriteGroup();
		add(this.World.Items);
		var stick = new Stick(5,2);
		this.World.Items.add(stick);

		Player = new Player(2, 2, this.World);
		add(Player);
		FlxG.camera.follow(Player, TOPDOWN, 1);

		add(World.Foreground);

		HUD = new HUD(Player);
		add(HUD);
		add(HUD.AnimalBarGroup);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		trace(Player.Happiness);

		if(Player.Happiness >= 85)
		{
			FlxG.switchState(new CutsceneState());
		}

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
				return dist < 25;
			});
			for(a in nearbyAnimals){
				if(Std.is(a,Wolf)){
					var w = cast(a,Wolf);
					w.walkTo(Player.worldx,Player.worldy);
				} else if(Std.is(a,Squirrel)){
					var s = cast(a,Squirrel);
					s.fetchFood(Player.worldx,Player.worldy);
				}
				
			}
		}

		if(FlxG.mouse.justPressed){
			// Check player has material
			trace("You clicked");
			switch(Player.Bag.Order.first())
			{
				case STICK:
					if(Player.Bag.HasItem(STICK, 1) >= 1){
						trace("Has stuff");
						var buildx = Std.int((FlxG.camera.x + FlxG.mouse.x)/64);
						var buildy = Std.int((FlxG.camera.y + FlxG.mouse.y)/64);
						trace(buildx + "," + buildy);
						World.setTile(buildx, buildy, 2);
						Player.Bag.RemoveItem(STICK, 1);
					}
				case ACORN:
					if(Player.Bag.HasItem(ACORN, 1) >= 1)
					{
						var buildx = Std.int((FlxG.camera.x + FlxG.mouse.x)/64);
						var buildy = Std.int((FlxG.camera.y + FlxG.mouse.y)/64);
						trace(buildx + "," + buildy);
						var tree = new Trunk(buildx, buildy, World);
						World.addObject(tree);
						World.addObject(tree.makeLeaves());
						Player.Bag.RemoveItem(ACORN, 1);
					}
				default:
					1;
			}
		}

		var happiness:Float = 0;
		for(s in animals.members){
			var a = cast(s,Animal);
			happiness += a.happiness;
		}
		Player.Happiness = Std.int(happiness/animals.length);

		FlxG.overlap(Player, this.World.Items, playerTouchItem);

		//handle animal ui interatcion
		if(FlxG.mouse.justPressedRight)
		{
			var mouseWorldPosX:Float = Std.int((FlxG.camera.x + FlxG.mouse.x)/64);
			var mouseWorldPosY:Float = Std.int((FlxG.camera.y + FlxG.mouse.y)/64);
			for(animal in animals)
			{
				HUD.removeAnimalBar(cast animal);
				if((cast animal).worldx == mouseWorldPosX && (cast animal).worldy == mouseWorldPosY)
				{
					HUD.createAnimalBar(cast animal);
				}
			}
		}

		if(FlxG.mouse.justPressedMiddle)
		{
			trace("Pressed Middle");
			var mouseWorldPosX:Float = Std.int((FlxG.camera.x + FlxG.mouse.x)/64);
			var mouseWorldPosY:Float = Std.int((FlxG.camera.y + FlxG.mouse.y)/64);
			for(animal in animals)
			{
				if(Std.is(animal,Beaver)){
					var b = cast(animal,Beaver);
					b.harvestTree();
				}
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
			Player.Bag.GiveItem(I.ItemType, 1);
			I.kill();
			this.World.Items.forEachDead(removeItemFromGrp);
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