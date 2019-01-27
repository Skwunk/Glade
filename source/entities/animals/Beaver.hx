package entities.animals;

import World;
import flixel.util.FlxColor;

class Beaver extends Animal
{
    var lastHappinessUpdate:Float = 0;
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
        trace(lastHappinessUpdate);
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

    // public function fetchFood(x:Int,y:Int):Void
    // {
    //     walkTo(x,y,true,true);
    // }

    // public override function onArrival(){
    //     world.Items.add(new Berry(worldx,worldy));
    // }
}