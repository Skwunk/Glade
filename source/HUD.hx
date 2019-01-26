package;

import entities.player.Player;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.ui.FlxBar;
import flixel.FlxG;

class HUD extends FlxSpriteGroup
{

    var HappinessGraphic:FlxSprite;
    var HappinessBar:FlxBar;
    var HUDPlayer:Player;

    public function new(?x:Float=0,?y:Float=0, player:Player)
    {
        super(x, y);
        scrollFactor.set(0,0);
        HUDPlayer = player;

        HappinessGraphic = new FlxSprite();
        HappinessGraphic.loadGraphic(AssetPaths.Heart__png, false, 32, 32);
        HappinessGraphic.x = 16;
        HappinessGraphic.y = 16;
        add(HappinessGraphic);

        HappinessBar = new FlxBar(60, 24, LEFT_TO_RIGHT, 100, 16, player, "Happiness");
        HappinessBar.createFilledBar(0xFF63460C, 0xFFE6AA2F);
        add(HappinessBar);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

}