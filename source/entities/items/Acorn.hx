package entities.items;

import flixel.util.FlxColor;

 class Acorn extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        makeGraphic(20,20,FlxColor.BROWN);
        ItemType = ACORN;
     }
     
 }