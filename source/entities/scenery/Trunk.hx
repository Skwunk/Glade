package entities.scenery;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class Trunk extends StaticEntity
{
    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x,y);
        makeGraphic(64,64,FlxColor.BROWN);
    }

    public function makeLeaves():Leaves
    {
        var leaves = new Leaves(worldx,worldy-1);
        return leaves;
    }

    public override function destroy(world:World):Void
    {
        world.removeObject(leaves);
        leaves.destroy();
        super();
    }
}