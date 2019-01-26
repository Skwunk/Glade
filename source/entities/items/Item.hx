package entities.items;

class Item extends StaticEntity
{

    public function new(x:Int y:Int)
    {
        super(x,y);
    }

    override public function kill():Void
    {
        alive = false;
        FlxTween.tween(this, {alpha: 0, y: y-16}, .33, {ease:FlxEase.circOut, onComplete: finishKill});
    }

    funciton finishKill():Void
    {
        exists = false;
    }

}