package entities.animals;

import World;
import flixel.util.FlxColor;

class Squirrel extends Animal
{
    public override function new(x:Int,y:Int,w:World)
    {
        super(x,y,w);
        scritchable = false;
        makeGraphic(20,40,FlxColor.fromRGB(200,50,0));
    }
}