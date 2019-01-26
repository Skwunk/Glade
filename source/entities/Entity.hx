package entities;

import flixel.FlxSprite;

typedef Point = { x : Int, y : Int};

class Entity extends FlxSprite
{
    public var worldx:Int;
    public var worldy:Int;
    
    public function new(?x:Int=0, ?y:Int=0){
        worldx = x;
        worldy = y;
        var screenPos = toScreenPos(worldx,worldy);
        super(screenPos.x,screenPos.y);
    }

    public static function toScreenPos(x:Int,y:Int):Point
    {
        // TODO: Actually get the world offset here
        var worldOffset = {x: 0, y: 0};
        return {
            x: 64*x + worldOffset.x,
            y: 64*y + worldOffset.y
        }
    }

    public static function distance(A:Point, B:Point):Float
    {
        return Math.sqrt(Math.pow(Math.abs(A.x - B.x),2) + Math.pow(Math.abs(A.y - B.y),2));
    }
}