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
import entities.StaticEntity;

class World extends FlxSpriteGroup
{
    private var TileWidth:Int = 64;
    private var TileHeight:Int = 64; 
    private var Tiles:Array<Array<Int>> = [[1, 1, 1, 1, 1, 1],[1, 0, 0, 1, 0, 0, 1],[1, 0, 0, 0, 0, 0, 1],[1, 0, 0, 1, 0, 0, 1],[1, 0, 0, 1, 0, 0, 1],[1, 1, 1, 1, 1, 1]];

    private var Objects:Array<StaticEntity> = [];

    static var UP = 8;
    static var DOWN = 4;
    static var LEFT = 2;
    static var RIGHT = 1;

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

        var out:Int = 0;//getBlockedDirections(x, y);

        //up
        if(legal(x, y-1))
        {
            out = out | (getBlockedDirections(x, y-1, true) & UP);
        }
        else
        {
            out = out | UP;
        }
        //down
        if(legal(x, y+1))
        {
            out = out | (getBlockedDirections(x, y+1, true) & DOWN);
        }
        else
        {
            out = out | DOWN;
        }
        //left
        if(legal(x-1, y))
        {
            out = out | (getBlockedDirections(x-1, y, true) & LEFT);
        }
        else
        {
            out = out | LEFT;
        }
        //right
        if(legal(x+1, y))
        {
            out = out | (getBlockedDirections(x+1, y, true) & RIGHT);
        }
        else
        {
            out = out | RIGHT;
        }
        return out;
    }

    private function legal(x, y):Bool
    {
        if(x < 0 || x > Tiles[0].length - 1)
        {
            return false;
        }
        if(y < 0 || y > Tiles.length - 1)
        {
            return false;
        }
        return true;
    }

    public function getTile(x:Int, y:Int):Int
    {
        return Tiles[y][x];
    }

    public function getObject(x:Int, y:Int):StaticEntity
    {
        for(object in Objects)
        {
            if(object.worldx == x && object.worldy == y)
            {
                return object;
            }
        }
        return null;
    }

    public function addObject(object:StaticEntity):Bool
    {
        if(getObject != null)
        {
            return false;
        }

        Objects.push(object);
        add(object);
        return true;
    }

    public function removeObject(object:StaticEntity):Void
    {
        Objects.remove(object);
        remove(object);
    }

    public function setTile(x:Int, y:Int, tile:Int):Bool
    {
        if(!legal(x, y))
        {
            return false;
        }

        Tiles[y][x] = tile;
        return true;
    }
}