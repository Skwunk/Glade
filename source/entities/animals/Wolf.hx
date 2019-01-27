package entities.animals;

import World;

class Wolf extends Animal
{
    public override function new(x:Int,y:Int,w:World)
    {
        super(x,y,w);
        scritchable = true;
    }
}