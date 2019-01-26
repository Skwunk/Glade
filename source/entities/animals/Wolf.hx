package entities.animals;


class Wolf extends Animal
{
    public override function new(x:Int,y:Int)
    {
        super(x,y);
        scritchable = true;
    }
}