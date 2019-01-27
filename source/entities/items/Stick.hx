package entities.items;

 class Stick extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        loadGraphic(AssetPaths.Stick__png, false, 64, 64);
        ItemType = STICK;
     }
     
 }