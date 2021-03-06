package entities;

class StaticEntity extends Entity
{
    public var passable:Bool = true;
    public var background:Bool = true;

    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x, y);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}