package;

import flixel.FlxBasic;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap;
import flixel.group.FlxGroup;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class World extends FlxSpriteGroup
{
    private var TileWidth:Int = 64;
    private var TileHeight:Int = 64; 
    private var Tiles:Array<Array<Int>> = [[1, 1, 1, 1, 1, 1],[1, 0, 0, 1, 0, 0, 1],[1, 0, 0, 0, 0, 0, 1],[1, 0, 0, 1, 0, 0, 1],[1, 0, 0, 1, 0, 0, 1],[1, 1, 1, 1, 1, 1]];

    private var UP = 8;
    private var DOWN = 4;
    private var LEFT = 2;
    private var RIGHT = 1;

    public function new()
    {
        super();
        updateImage();
    }

    private function updateImage():Void
    {
        clear();
        for(y in 0...(Tiles.length))
        {
            for(x in 0...(Tiles[y].length))
            {
                if(Tiles[y][x] == 0)
                {
                    var holder:FlxSprite = new FlxSprite(x*TileWidth, y*TileHeight);
                    holder.makeGraphic(TileWidth, TileHeight, FlxColor.WHITE);
                    add(holder);
                }
            }
        }

    }
    
    public function getBlockedDirections(x:Int, y:Int, reverse:Bool=false):Int
    {
        if(!legal(x, y)) return -1;


        var out:Int = 0;
        if(Tiles[y][x] == 1)
        {
            out = 15;
        }
        
        if(reverse)
        {
            out = ((out & 5) << 1) | ((out & 10) >> 1);
        }

        return out;
    }

    public function getWalkableDirections(x:Int, y:Int):Int
    {
        if(!legal(x, y)) return -1;        

        var out:Int = getBlockedDirections(x, y);

        //up
        if(legal(y-1, x))
        {
            out = out | (getBlockedDirections(y-1, x, true) & UP);
        }
        else
        {
            out = out | UP;
        }
        //down
        if(legal(y+1, x))
        {
            out = out | (getBlockedDirections(y+1, x, true) & DOWN);
        }
        else
        {
            out = out | DOWN;
        }
        //left
        if(legal(y, x-1))
        {
            out = out | (getBlockedDirections(y, x-1, true) & LEFT);
        }
        else
        {
            out = out | LEFT;
        }
        //right
        if(legal(y, x+1))
        {
            out = out | (getBlockedDirections(y, x+1, true) & RIGHT);
        }
        else
        {
            out = out | RIGHT;
        }
        return out;
    }

    private function legal(x, y):Bool
    {
        if(x < 0 || x > 5)
        {
            return false;
        }
        if(y < 0 || y > 5)
        {
            return false;
        }
        return true;
    }

}