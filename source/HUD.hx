package;

import entities.player.Player;
import entities.items.Item;
import entities.items.*;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.ui.FlxBar;
import flixel.FlxG;
import entities.animals.Animal;

class HUD extends FlxSpriteGroup
{

    var HUDPlayer:Player;
    var HappinessGraphic:FlxSprite;
    var HappinessBar:FlxBar;

    var ItemBar:FlxSprite;
    var Items:FlxSpriteGroup;

    var AnimalBars:Map<Animal, FlxBar>;

    public function new(?x:Float=0,?y:Float=0, player:Player)
    {
        super(x, y);
        HUDPlayer = player;

        HappinessGraphic = new FlxSprite();
        HappinessGraphic.loadGraphic(AssetPaths.Heart__png, false, 32, 32);
        HappinessGraphic.x = 16;
        HappinessGraphic.y = 16;
        HappinessGraphic.scrollFactor.set(0,0);

        add(HappinessGraphic);

        HappinessBar = new FlxBar(60, 24, LEFT_TO_RIGHT, 100, 16, player, "Happiness");

        HappinessBar.createFilledBar(0xFF63460C, 0xFFE6AA2F);
        HappinessBar.scrollFactor.set(0, 0);

        add(HappinessBar);

        AnimalBars = new Map<Animal, FlxBar>();

        ItemBar = new FlxSprite();
        ItemBar.loadGraphic(AssetPaths.ItemBar__png, false, 348, 76);
        ItemBar.x = Math.floor(FlxG.width/2 - ItemBar.width/2);
        ItemBar.y = Math.floor(FlxG.height - ItemBar.height - 8);
        ItemBar.scrollFactor.set(0, 0);
        add(ItemBar);
    }

    override public function update(elapsed:Float)
    {
        if(HUDPlayer.Bag.Order.length == 0 && Items != null)
        {
            Items.destroy();
        } else if (HUDPlayer.Bag.Order.length == 1) {
            var item1 = createItem(HUDPlayer.Bag.Order.first());
            item1.x = ItemBar.x + 142;
            item1.y = ItemBar.y + 6;
            add(item1);
        } else if (HUDPlayer.Bag.Order.length == 2) {
            scroll();
            var item1type = HUDPlayer.Bag.Order.pop();
            var item1 = createItem(item1type);
            item1.x = ItemBar.x + 142;
            item1.y = ItemBar.y + 6;
            add(item1);
            var item2type = HUDPlayer.Bag.Order.pop();
            var item2 = createItem(item2type);
            item2.x = ItemBar.x + 210;
            item2.y = ItemBar.y + 6;
            add(item2);
            HUDPlayer.Bag.Order.add(item1type);
            HUDPlayer.Bag.Order.add(item2type);
        } else if (HUDPlayer.Bag.Order.length == 3) {
            scroll();
            var item1type = HUDPlayer.Bag.Order.pop();
            var item1 = createItem(item1type);
            item1.x = ItemBar.x + 142;
            item1.y = ItemBar.y + 6;
            add(item1);
            var item2type = HUDPlayer.Bag.Order.pop();
            var item2 = createItem(item2type);
            item2.x = ItemBar.x + 210;
            item2.y = ItemBar.y + 6;
            add(item2);
            var item3type = HUDPlayer.Bag.Order.pop();
            var item3 = createItem(item3type);
            item3.x = ItemBar.x + 278;
            item3.y = ItemBar.y + 6;
            add(item3);
            HUDPlayer.Bag.Order.add(item1type);
            HUDPlayer.Bag.Order.add(item2type);
            HUDPlayer.Bag.Order.add(item3type);
        } else if (HUDPlayer.Bag.Order.length == 4) {
            scroll();
            var item1type = HUDPlayer.Bag.Order.pop();
            var item1 = createItem(item1type);
            item1.x = ItemBar.x + 142;
            item1.y = ItemBar.y + 6;
            add(item1);
            var item2type = HUDPlayer.Bag.Order.pop();
            var item2 = createItem(item2type);
            item2.x = ItemBar.x + 210;
            item2.y = ItemBar.y + 6;
            add(item2);
            var item3type = HUDPlayer.Bag.Order.pop();
            var item3 = createItem(item3type);
            item3.x = ItemBar.x + 278;
            item3.y = ItemBar.y + 6;
            add(item3);
            var item4type = HUDPlayer.Bag.Order.pop();
            var item4 = createItem(item4type);
            item4.x = ItemBar.x + 74;
            item4.y = ItemBar.y +6;
            add(item4);
            HUDPlayer.Bag.Order.add(item1type);
            HUDPlayer.Bag.Order.add(item2type);
            HUDPlayer.Bag.Order.add(item3type);
            HUDPlayer.Bag.Order.add(item4type);
        } else if (HUDPlayer.Bag.Order.length >= 5) {
            scroll();
            var item1type = HUDPlayer.Bag.Order.pop();
            var item1 = createItem(item1type);
            item1.x = ItemBar.x + 142;
            item1.y = ItemBar.y + 6;
            add(item1);
            var item2type = HUDPlayer.Bag.Order.pop();
            var item2 = createItem(item2type);
            item2.x = ItemBar.x + 210;
            item2.y = ItemBar.y + 6;
            add(item2);
            var item3type = HUDPlayer.Bag.Order.pop();
            var item3 = createItem(item3type);
            item3.x = ItemBar.x + 278;
            item3.y = ItemBar.y + 6;
            add(item3);
            var item4type = HUDPlayer.Bag.Order.last();
            HUDPlayer.Bag.Order.remove(item4type);
            var item4 = createItem(item4type);
            item4.x = ItemBar.x + 74;
            item4.y = ItemBar.y + 6;
            add(item4);
            var item5type = HUDPlayer.Bag.Order.last();
            HUDPlayer.Bag.Order.remove(item5type);
            var item5 = createItem(item5type);
            item5.x = ItemBar.x + 6;
            item5.y = ItemBar.y + 6;
            add(item5);
            HUDPlayer.Bag.Order.push(item3type);
            HUDPlayer.Bag.Order.push(item2type);
            HUDPlayer.Bag.Order.push(item1type);
            HUDPlayer.Bag.Order.add(item5type);
            HUDPlayer.Bag.Order.add(item4type);
            
        }
        super.update(elapsed);
    }

    public function createAnimalBar(animal:Animal):Void
    {
        trace(animal.happiness);
        var bar:FlxBar = new FlxBar(0, animal.y - 6, LEFT_TO_RIGHT, 64, 5, animal, "happiness", 0, 100);
        bar.x = animal.x + animal.width/2 - bar.width/2;
        bar.createFilledBar(0xFF63460C, 0xFFE6AA2F);
        if (AnimalBars.exists(animal)) 
        {
           remove(AnimalBars.get(animal));
        }
        AnimalBars.set(animal, bar);
        add(bar);
    }

    public function removeAnimalBar(animal:Animal):Void
    {
        if (AnimalBars.exists(animal)) 
        {
           remove(AnimalBars.get(animal));
        }
        AnimalBars.remove(animal);
    }

    function scroll():Void
    {
        var tmp:ITEM_TYPE;
        var scrollDelta = FlxG.mouse.wheel;
        if(scrollDelta > 0)
        {
            tmp = HUDPlayer.Bag.Order.pop();
            HUDPlayer.Bag.Order.add(tmp);
        } else if(scrollDelta < 0) {
            tmp = HUDPlayer.Bag.Order.last();
            HUDPlayer.Bag.Order.remove(tmp);
            HUDPlayer.Bag.Order.push(tmp);
        }
    }

    function createItem(itemType:ITEM_TYPE):Item
    {
        var item:Item = new Item();
        if(itemType == ITEM_TYPE.STICK)
        {
            item = new Stick();
        }
        return item;
    }
}