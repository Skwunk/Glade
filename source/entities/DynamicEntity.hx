package entities;

class DynamicEntity extends Entity
{

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}