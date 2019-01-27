package entities.items;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import entities.player.Inventory;
import entities.player.Player;

class Item extends StaticEntity
{
    public var ItemType:ITEM_TYPE;

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

enum ITEM_TYPE
{
    STICK;
    BERRY;
}