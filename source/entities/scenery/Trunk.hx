package entities.scenery;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class Trunk extends StaticEntity
{
    private var leaves:Leaves;
    private var world:World;

    public function new(?x:Int=0, ?y:Int=0, w:World)
    {
        super(x,y);
        makeGraphic(64,64,FlxColor.BROWN);
        world = w;
        passable = false;
    }

    public function makeLeaves():Leaves
    {
        leaves = new Leaves(worldx,worldy-1);
        return leaves;
    }

    override public function destroy():Void
    {
        world.removeObject(leaves);
        leaves.destroy();
        world.removeObject(this);
        super.destroy();
    }
}