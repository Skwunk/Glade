package;

import flixel.ui.FlxButton;
import flixel.FlxG;
import cutscene.CutsceneState;

class MainMenuState extends MenuMasterState
{
    override public function create():Void
    {
        var newGameBttn = new FlxButton(10, 10, "New Game", startNewGame);
        add(newGameBttn);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

    }

    private function startNewGame():Void
    {
        FlxG.switchState(new PlayState);
    }
    private function loadGame():Void
    {
        FlxG.switchState(new PlayState());
    }
    private function openOptions():Void
    {
        //FlxG.switchState(new OptionsState)
    }

}