package entities.scenery;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import entities.scenery.Object;

class Trunk extends Object
{
    private var leaves:Leaves;
    private var world:World;

    public function new(?x:Int=0, ?y:Int=0, w:World)
    {
        super(x,y);
        loadGraphic(AssetPaths.Tree__png, false, 64, 64);
        world = w;
        passable = false;
        ObjectType = TREE;
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