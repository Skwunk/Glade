package entities.items;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Item extends StaticEntity
{

    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x,y);
    }

    override public function kill():Void
    {
        alive = false;
        FlxTween.tween(this, {alpha: 0, y: y-16}, .33, {ease :FlxEase.circOut, onComplete: finishKill});
    }

    function finishKill(_):Void
    {
        exists = false;
    }

}