package entities;

class StaticEntity extends Entity
{

    public function new(?x:Int=0, ?y:Int=0)
    {
        super(x, y);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}