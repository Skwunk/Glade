package entities.animals;

import World;
import flixel.util.FlxColor;

class Wolf extends Animal
{
    public override function new(x:Int,y:Int,w:World)
    {
        super(x,y,w);
        scritchable = true;
        makeGraphic(64,32,FlxColor.GRAY);
    }

    public override function update(elapsed:Float)
    {
        super.update(elapsed);
        happiness -= happiness*0.01 * elapsed;
    }
}