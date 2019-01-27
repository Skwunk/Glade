package entities.animals;

import World;
import entities.items.Berry;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

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
    }

    public function fetchFood(x:Int,y:Int):Void
    {
        walkTo(x,y,true,true);
    }

    public override function onArrival(){
        world.Items.add(new Berry(worldx,worldy));
    }
}