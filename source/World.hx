package;

import flixel.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxTilemapAutoTiling;
import flixel.group.FlxGroup;
import flixel.addons.tiled.TiledMap;
import flixel.addons.tiled.TiledTileLayer;
import flixel.addons.tiled.TiledObjectLayer;

class World extends FlxSpriteGrp
{

    var Map:TiledMap;
    var TileLayers:FlxTypedGroup<FlxTilemap>;
    var ObjectLayer:TiledObjectLayer;

    public function new()
    {
        Map = new TiledMap(); //TODO Add map asset
        TileLayers = new FlxTypedGroup<FlxTilemap>;

        for(layer in Map.layers)
        {
            if(layer.name ==  "objects");
            {
                ObjectLayer = cast Map.getLayer("objects");
            } else {
                var tmpTilemap = new FlxTilemap();
                tmpTilemap.loadMapFromArray(cast(layer, TiledTileLayer).tileArray, Map.width, Map.height
                , AssetPaths.tiles__png, Map.tileWidth, Map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1 , 3);
                TileLayers.add(tmpTilemap);
            }
        }

        //Tile properties go here
    }

}