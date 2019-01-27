package;

import entities.player.Player;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.ui.FlxBar;
import flixel.FlxG;
import entities.animals.Animal;

class HUD extends FlxSpriteGroup
{

    var HappinessGraphic:FlxSprite;
    var HappinessBar:FlxBar;
    var HUDPlayer:Player;

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
    }

    override public function update(elapsed:Float)
    {
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
}