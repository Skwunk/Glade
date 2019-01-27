package entities.player;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import entities.items.Item;
import World;

class Player extends DynamicEntity
{
    
    var walking = false;
    public var Happiness:Int;
    public var Bag:Inventory;
    private var world:World;
    
    public function new(?x:Int=0, ?y:Int=0, world:World)
    {
        Happiness = 50;
        super(x,y);
        Bag = new Inventory();
        this.world = world;
        makeGraphic(64,64,FlxColor.ORANGE);
    }
    
    override public function update(elapsed:Float):Void
    {
        if(!walking){
            var oldPos = {x:worldx,y:worldy};
            var blocked = world.getWalkableDirections(worldx,worldy);
            if (FlxG.keys.pressed.LEFT && (blocked & World.LEFT) == 0){
                worldx--;
                walking = true;
            } else if (FlxG.keys.pressed.RIGHT && (blocked & World.RIGHT) == 0){
                worldx++;
                walking = true;
            } else if (FlxG.keys.pressed.UP && (blocked & World.UP) == 0){
                worldy--;
                walking = true;
            } else if (FlxG.keys.pressed.DOWN && (blocked & World.DOWN) == 0){
                worldy++;
                walking = true;
            }
            var newPos = Entity.toScreenPos(worldx,worldy);

            if(walking){
                var distance = Entity.distance(oldPos, {x:worldx,y:worldy});
                FlxTween.tween(this, newPos, distance/3, {
                ease: FlxEase.linear,
                onComplete: 
                    function(tween:FlxTween){
                        walking = false;
                    }
                });
            }
        }
    }
}