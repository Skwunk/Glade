package entities;

import flixel.math.FlxPoint;

class Animal extends DynamicEntity
{
    var currentPath = new Array<FlxPoint>();

    private function dist(A:FlxPoint,Bx:Float,By:Float):Int
    {
        return Std.int(Math.abs(A.x-Bx) + Math.abs(A.y-By));
    }
    public function findPath(dest:FlxPoint):Array<FlxPoint>
    {
        // Initialize the open list
        var openNodes = new Array<Node>();
        // Initialize the closed list
        var closedNodes = new Array<Node>();
        // Put the starting node on the open list
        openNodes.push(new Node(this.worldx,this.worldy,0,dist(dest,worldx,worldy)));

        var q:Node;
        var p:Node;

        while(openNodes.length > 0){
            //find the node with the least f on the open list, call it "q"
            openNodes.sort(function(A:Node,B:Node):Int
            {
                return B.f() - A.f();
            })
            q = openNodes.pop();
            //Generate successors
            var up = new Node(q.x,q.y-1,q.g+1,dist(dest,q.x,q.y+1));
            var down = new Node(q.x,q.y+1,q.g+1,dist(dest,q.x,q.y+1));
            var left = new Node(q.x-1,q.y,q.g+1,dist(dest,q.x,q.y+1));
            var right = new Node(q.x+1,q.y,q.g+1,dist(dest,q.x,q.y+1));
            for(p in [up,down,left,right]){
                if(p.eq(dest)){
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
        }
        do {
            currentPath.push(p);
            p = p.parent;
        } while(p.parent != null)
        return currentPath;
/*
    
        d) for each successor

            ii) if a node with the same position as 
                successor is in the OPEN list which has a 
            lower f than successor, skip this successor

            iii) if a node with the same position as 
                successor  is in the CLOSED list which has
                a lower f than successor, skip this successor
                otherwise, add  the node to the open list
        end (for loop)
    
        e) push q on the closed list
        end (while loop) 
        */
    }
}

private class Node extends FlxPoint
{
    public var g:Int;
    public var h:Int;
    public var parent:Node;
    public override function new(x:Float,y:Float,g:Int,h:Int){
        super(x,y);
        this.g = g;
        this.h = h
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