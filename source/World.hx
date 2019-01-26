package;

import flixel.FlxBasic;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap;
import flixel.group.FlxGroup;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledObjectLayer;

class World
{

    var Map:TiledMap;
    var TileLayers:FlxTypedGroup<FlxTilemap>;
    var ObjectLayer:TiledObjectLayer;

    public function new():Void
    {
        Map = new TiledMap(AssetPaths.Map__tmx); //TODO Add map asset
        TileLayers = new FlxTypedGroup<FlxTilemap>();

        for(layer in Map.layers)
        {
            if(layer.name ==  "objects")
            {
                ObjectLayer = cast Map.getLayer("objects");
            } else {
                var tmpTilemap = new FlxTilemap();
                tmpTilemap.loadMapFromArray(cast(layer, TiledTileLayer).tileArray, Map.width, Map.height
                , AssetPaths.TileMap__png, Map.tileWidth, Map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1 , 3);
                TileLayers.add(tmpTilemap);
            }
        }

        //Tile properties go here
    }

    public function getTileLayers():FlxTypedGroup<FlxTilemap>
    {
        return TileLayers;
    }

}