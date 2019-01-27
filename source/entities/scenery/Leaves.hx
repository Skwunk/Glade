package entities.scenery;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import entities.scenery.Object;

class Leaves extends Object;
{
    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x,y);
        makeGraphic(64,64,FlxColor.GREEN);
        background = false;
        ObjectType = LEAVES;
    }
}