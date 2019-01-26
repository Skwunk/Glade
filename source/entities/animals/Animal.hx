package entities.animals;

import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Animal extends DynamicEntity
{
    var currentPath = new Array<FlxPoint>();
    var walking = false;

    private function dist(A:FlxPoint,Bx:Float,By:Float):Int
    {
        return Std.int(Math.abs(A.x-Bx) + Math.abs(A.y-By));
    }
    private function findPath(dest:FlxPoint):Void
    {
        var steps = 0;
        var found = false;
        // Initialize the open list
        var openNodes = new Array<Node>();
        // Initialize the closed list
        var closedNodes = new Array<Node>();
        // Put the starting node on the open list

        var q:Node;
        q = new Node(this.worldx,this.worldy,0,dist(dest,worldx,worldy));
        var p:Node;

        while(((openNodes.length > 0 && steps < 100) || steps == 0 ) && !found){
            //find the node with the least f on the open list, call it "q"
            openNodes.sort(function(A:Node,B:Node):Int
            {
                return B.f() - A.f();
            });
            if(steps > 0) q = openNodes.pop();
            //Generate successors
            var up = new Node(q.x,q.y-1,q.g+1,dist(dest,q.x,q.y-1));
            var down = new Node(q.x,q.y+1,q.g+1,dist(dest,q.x,q.y+1));
            var left = new Node(q.x-1,q.y,q.g+1,dist(dest,q.x-1,q.y));
            var right = new Node(q.x+1,q.y,q.g+1,dist(dest,q.x+1,q.y));
            for(p in [up,down,left,right]){
                if(p.eq(dest)){
                    p.parent = q;
                    openNodes.push(p);
                    q = p;
                    trace("Got to destination");
                    found = true;
                    break;
                }
                for(o in openNodes){
                    if(p.eq(o)){
                        break;
                    }
                }
                for(c in closedNodes){
                    if(p.eq(c)){
                        break;
                    }
                }
                p.parent = q;
                openNodes.push(p);
            }
            closedNodes.push(q);
            steps++;
        }
        while(q != null){
            currentPath.push(q);
            q = q.parent;
        }
        trace(currentPath);
    }

    public function walkTo(x:Int,y:Int){
        if(currentPath.length == 0){
            findPath(new FlxPoint(x,y));
        }
    }

    public override function update(elapsed:Float){
        super.update(elapsed);
        if(!walking && currentPath.length > 0){
            var nextPoint = currentPath.pop();
            var newPos = Entity.toScreenPos(Std.int(nextPoint.x),Std.int(nextPoint.y));
            walking = true;
            FlxTween.tween(this, {
                x:newPos.x,
                y:newPos.y
            }, 0.4, {
            ease: FlxEase.linear,
            onComplete: 
                function(tween:FlxTween){
                    walking = false;
                }
            });
        }
    }
}

private class Node extends FlxPoint
{
    public var g:Int;
    public var h:Int;
    public var parent:Node;
    public override function new(x:Float,y:Float,g:Int,h:Int){
        parent = null;
        super(x,y);
        this.g = g;
        this.h = h;
    }
    public function f():Int
    {
        return g+h;
    }
    public function eq(other:FlxPoint):Bool
    {
        return other.x == x && other.y == y;
    }
}