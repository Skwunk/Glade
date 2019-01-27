package entities.scenery;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import entities.scenery.Object;

class Leaves extends Object
{
    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x,y);
        loadGraphic(AssetPaths.Leaves__png, false, 64, 64);
        background = false;
        ObjectType = LEAVES;
    }
}