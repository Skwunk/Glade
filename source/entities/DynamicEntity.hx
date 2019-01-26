package entities;

class DynamicEntity extends Entity
{

    override public function new(?x:Int=0 ,?y:Int=0):Void
    {
        super(x, y);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}