package entities.player;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import entities.items.Item;

class Player extends DynamicEntity
{
    
    var walking = false;
    var GrpInventory:FlxTypedGroup<Item>;
    public var Happiness:Int;
    
    public function new(?x:Int=0, ?y:Int=0)
    {
        Happiness = 50;
        super(x,y);
    }
    
    override public function update(elapsed:Float):Void
    {
        if(!walking){
            var oldPos = {x:worldx,y:worldy};
            if (FlxG.keys.pressed.LEFT){
                worldy++;
                walking = true;
            }
            if (FlxG.keys.pressed.RIGHT){
                worldy--;
                walking = true;
            }
            if (FlxG.keys.pressed.UP){
                worldx--;
                walking = true;
            }
            if (FlxG.keys.pressed.DOWN){
                worldx++;
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