package entities.items;

 class Stick extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        ItemType = STICK;
     }
     
 }