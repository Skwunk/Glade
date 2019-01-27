package entities.animals;

import World;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import entities.scenery.*;
import entities.items.Stick;

class Beaver extends Animal
{
    var lastHappinessUpdate:Float = 0;
    var treeTarget:Trunk;
    public override function new(x:Int,y:Int,w:World)
    {
        super(x,y,w);
        scritchable = false;
        makeGraphic(30,50,FlxColor.BROWN);
    }

    public override function update(elapsed:Float)
    {
        super.update(elapsed);
        lastHappinessUpdate += elapsed;
        if(lastHappinessUpdate > 1){
            lastHappinessUpdate = 0;
            updateHappiness();
        }
    }

    public function updateHappiness(){
        var num_buildings = 0;
        for(x in 0...world.MapWidth){
            for(y in 0...world.MapHeight){
                if(World.isBuiltTile[world.getTile(x,y)]){
                    num_buildings++;
                }
            }
        }
        happiness = Math.min(100,num_buildings*5);
    }

    public function harvestTree():Bool
    {
        trace("Finding Tree");
        var trees = world.getObjects().filter(function(o:Object){
            return o.ObjectType == TREE;
        });

        if(trees.length == 0) return false;

        trees.sort(function(A:Object,B:Object){
            var distA = Math.abs(A.worldx-worldx) + Math.abs(A.worldy-worldy);
            var distB = Math.abs(B.worldx - worldx) + Math.abs(B.worldy - worldy);
            return Std.int(distA - distB);
        });

        walkTo(trees[0].worldx, trees[0].worldy+1, true, true);

        treeTarget = cast trees[0];

        return true;
    }

    public override function onArrival(){
        trace("Arrived at tree");
        treeTarget.destroy();
        world.Items.add(new Stick(worldx,worldy-1));
    }
}