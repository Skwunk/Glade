package entities.items;

 class Berry extends Item
 {

     public function new(?x:Int=0, ?y:Int=0)
     {
        super(x,y);
        ItemType = BERRY;
     }
     
 }