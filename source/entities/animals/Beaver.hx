package entities.animals;

import World;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import entities.scenery.Object;
import entities.scenery.Trunk;

class Squirrel extends Animal
{
    public override function new(x:Int,y:Int,w:World)
    {
        super(x,y,w);
        scritchable = false;
        makeGraphic(30,50,FlxColor.BROWN);
    }

    public override function update(elapsed:Float)
    {
        super.update(elapsed);
        var num_built = world.getObjects().filter(function(o:Object){
            return o.ObjectType == TREE;
        }).length;
        happiness = num_trees * 5;
    }

    public function updateHappiness(){
        
    }

    public function fetchFood(x:Int,y:Int):Void
    {
        walkTo(x,y,true,true);
    }

    public override function onArrival(){
        world.Items.add(new Berry(worldx,worldy));
    }
}