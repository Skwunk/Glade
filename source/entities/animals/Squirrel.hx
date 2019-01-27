package entities.animals;

import World;
import entities.items.*;
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
        makeGraphic(20,40,FlxColor.fromRGB(200,50,0));
    }

    public override function update(elapsed:Float)
    {
        super.update(elapsed);
        var num_trees = world.getObjects().filter(function(o:Object){
            return o.ObjectType == TREE;
        }).length;
        happiness = Math.min(num_trees * 5,100);
    }

    public function fetchFood(x:Int,y:Int):Void
    {
        walkTo(x,y,true,true);
    }

    public override function onArrival(){
        world.Items.add(new Acorn(worldx,worldy));
    }
}