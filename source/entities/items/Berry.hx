package entities.items;

import flixel.util.FlxColor;

 class Berry extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        ItemType = BERRY;
        makeGraphic(10,10,FlxColor.RED);
     }
     
 }