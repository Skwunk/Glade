package entities.items;

import flixel.util.FlxColor;

 class Acorn extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        loadGraphic(AssetPaths.Acorn__png, false, 16, 16);
        ItemType = ACORN;
     }
     
 }