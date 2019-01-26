package entities.player;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import entities.items.Item;

class Player extends DynamicEntity
{
    
    var walking = false;
    public var Bag:Inventory;
    
    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x,y);
        Bag = new Inventory();
    }
    
    override public function update(elapsed:Float):Void
    {
        if(!walking){
            var oldPos = {x:worldx,y:worldy};
            if (FlxG.keys.pressed.LEFT){
                worldx--;
                walking = true;
            }
            if (FlxG.keys.pressed.RIGHT){
                worldx++;
                walking = true;
            }
            if (FlxG.keys.pressed.UP){
                worldy--;
                walking = true;
            }
            if (FlxG.keys.pressed.DOWN){
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