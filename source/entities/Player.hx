package entities;

class Player extends DynamicEntity
{

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
    }

    override public function update(elapsed):Void
    {
        super.update(elapsed);
    }

}